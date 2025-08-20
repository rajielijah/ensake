import 'package:flutter/foundation.dart';
import 'package:ensake_loyalty_app/models/reward.dart';
import 'package:ensake_loyalty_app/services/api_service.dart';
import 'package:ensake_loyalty_app/utils/constants.dart';

enum RewardOrderType { distance, pointsAsc, pointsDesc, none }

class RewardsProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Reward> _rewards = [];
  List<Reward> _filteredRewards = [];
  bool _isLoading = false;
  String? _error;
  RewardOrderType _currentOrder = RewardOrderType.none;
  int _userPoints = 0;

  List<Reward> get rewards => _filteredRewards;
  bool get isLoading => _isLoading;
  String? get error => _error;
  int get userPoints => _userPoints;
  int get availableRewardsCount => _filteredRewards.length;

  Future<void> fetchRewards(String authToken) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final data = await _apiService.getRewards(authToken);

      _userPoints = data['customer_points'] ?? 0;
      final rewardsList = data['rewards'] as List? ?? [];

      _rewards = rewardsList.map((json) => Reward.fromJson(json)).toList();
      _applyCurrentOrder();

      _isLoading = false;
      _error = null;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  void setOrder(RewardOrderType orderType) {
    _currentOrder = orderType;
    _applyCurrentOrder();
    notifyListeners();
  }

  void _applyCurrentOrder() {
    _filteredRewards = List.from(_rewards);

    switch (_currentOrder) {
      case RewardOrderType.distance:
        _filteredRewards.sort((a, b) {
          final aDistance =
              AppConstants.brandDistances[a.brand.name] ?? double.infinity;
          final bDistance =
              AppConstants.brandDistances[b.brand.name] ?? double.infinity;
          return aDistance.compareTo(bDistance);
        });
        break;
      case RewardOrderType.pointsAsc:
        _filteredRewards.sort((a, b) => a.points.compareTo(b.points));
        break;
      case RewardOrderType.pointsDesc:
        _filteredRewards.sort((a, b) => b.points.compareTo(a.points));
        break;
      case RewardOrderType.none:
      default:
        break;
    }
  }

  Future<bool> claimReward(String rewardId, String authToken) async {
    try {
      final success = await _apiService.claimReward(rewardId, authToken);

      if (success) {
        final reward = _rewards.firstWhere((r) => r.id.toString() == rewardId);
        _userPoints -= reward.points;

        final index = _rewards.indexWhere((r) => r.id.toString() == rewardId);
        if (index != -1) {
          _rewards[index] = _rewards[index].copyWith(claimed: true);
        }

        _applyCurrentOrder();
        notifyListeners();
      }

      return success;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  bool canClaimReward(Reward reward) {
    return !reward.claimed && _userPoints >= reward.points;
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
