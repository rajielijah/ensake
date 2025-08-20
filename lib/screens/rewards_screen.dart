import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ensake_loyalty_app/providers/auth_provider.dart';
import 'package:ensake_loyalty_app/providers/rewards_provider.dart';

import 'package:ensake_loyalty_app/services/font_service.dart';
import 'package:ensake_loyalty_app/services/localization_service.dart';
import 'package:ensake_loyalty_app/utils/app_colors.dart';
import 'package:ensake_loyalty_app/widgets/language_toggle.dart';

import 'package:ensake_loyalty_app/widgets/reward_card.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRewards();
    });
  }

  void _loadRewards() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final rewardsProvider =
        Provider.of<RewardsProvider>(context, listen: false);

    if (authProvider.authToken != null) {
      rewardsProvider.fetchRewards(authProvider.authToken!);
    }
  }

  Future<bool> _claimReward(String rewardId) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final rewardsProvider =
        Provider.of<RewardsProvider>(context, listen: false);

    try {
      final success =
          await rewardsProvider.claimReward(rewardId, authProvider.authToken!);

      if (!mounted) return false;

      if (success) {
        authProvider.updateUserPoints(rewardsProvider.userPoints);
        return true;
      }
      return false;
    } catch (e) {
      if (!mounted) return false;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).rewards),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        actions: [
          const LanguageToggle(),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) {
              if (value == 'logout') {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'logout',
                child: Text(AppLocalizations.of(context).logout),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightBlue,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 24,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        final userName = authProvider.user?.firstName ?? 'User';
                        return Text(
                          '${AppLocalizations.of(context).welcome} $userName',
                          style: AppFonts.titleLarge.copyWith(
                            color: AppColors.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer2<AuthProvider, RewardsProvider>(
                builder: (context, authProvider, rewardsProvider, child) {
                  if (rewardsProvider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    );
                  }

                  if (rewardsProvider.error != null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 64,
                            color: AppColors.error,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '${AppLocalizations.of(context).error}: ${rewardsProvider.error}',
                            style: const TextStyle(color: AppColors.error),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              rewardsProvider.clearError();
                              _loadRewards();
                            },
                            child: Text(AppLocalizations.of(context).retry),
                          ),
                        ],
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.shadow,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context).yourPoints,
                                style: AppFonts.titleSmall.copyWith(
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${rewardsProvider.userPoints}pts',
                                style: AppFonts.headlineMedium.copyWith(
                                  color: AppColors.white,
                                  fontSize: 28,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${AppLocalizations.of(context).availableRewardsCount}: ${rewardsProvider.rewards.length}',
                                style: AppFonts.bodySmall.copyWith(
                                  color: AppColors.white.withOpacity(0.9),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context).availableRewards,
                              style: AppFonts.titleMedium.copyWith(
                                color: AppColors.textPrimary,
                                fontSize: 18,
                              ),
                            ),
                            PopupMenuButton<String>(
                              icon: const Icon(Icons.sort,
                                  color: AppColors.primary, size: 20),
                              onSelected: (String value) {
                                switch (value) {
                                  case 'distance':
                                    Provider.of<RewardsProvider>(context,
                                            listen: false)
                                        .setOrder(RewardOrderType.distance);
                                    break;
                                  case 'points_low_to_high':
                                    Provider.of<RewardsProvider>(context,
                                            listen: false)
                                        .setOrder(RewardOrderType.pointsAsc);
                                    break;
                                  case 'points_high_to_low':
                                    Provider.of<RewardsProvider>(context,
                                            listen: false)
                                        .setOrder(RewardOrderType.pointsDesc);
                                    break;
                                }
                              },
                              itemBuilder: (BuildContext context) => [
                                PopupMenuItem<String>(
                                  value: 'distance',
                                  child: Text(
                                      AppLocalizations.of(context).distance),
                                ),
                                PopupMenuItem<String>(
                                  value: 'points_low_to_high',
                                  child: Text(AppLocalizations.of(context)
                                      .pointsLowToHigh),
                                ),
                                PopupMenuItem<String>(
                                  value: 'points_high_to_low',
                                  child: Text(AppLocalizations.of(context)
                                      .pointsHighToLow),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: rewardsProvider.rewards.length,
                          itemBuilder: (context, index) {
                            final reward = rewardsProvider.rewards[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: RewardCard(
                                reward: reward,
                                userPoints: rewardsProvider.userPoints,
                                onClaim: reward.claimed ? null : _claimReward,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Rewards History',
                          style: AppFonts.titleMedium.copyWith(
                            color: AppColors.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildHistoryItem(
                          'Points Earned',
                          'Received bonus points at sensible delicacy',
                          '10pts',
                          'Feb 12',
                          Icons.trending_up,
                          AppColors.lightBlue,
                          AppColors.primary,
                        ),
                        const SizedBox(height: 8),
                        _buildHistoryItem(
                          'Points Claimed',
                          'Spent points at sensible delicacy',
                          '30pts',
                          'Feb 12',
                          Icons.trending_down,
                          AppColors.success.withOpacity(0.2),
                          AppColors.success,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(String title, String description, String points,
      String date, IconData icon, Color backgroundColor, Color textColor) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: textColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppFonts.titleSmall.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                description,
                style: AppFonts.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              points,
              style: AppFonts.bodyMedium.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              date,
              style: AppFonts.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
