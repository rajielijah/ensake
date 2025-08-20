import 'package:flutter/material.dart';
import 'package:ensake_loyalty_app/utils/app_colors.dart';
import 'package:ensake_loyalty_app/models/reward.dart';
import 'package:ensake_loyalty_app/widgets/reward_modals.dart';
import 'package:ensake_loyalty_app/services/localization_service.dart';

class RewardCard extends StatefulWidget {
  final Reward reward;
  final Future<bool> Function(String rewardId)? onClaim;
  final int userPoints;

  const RewardCard({
    super.key,
    required this.reward,
    required this.userPoints,
    this.onClaim,
  });

  @override
  State<RewardCard> createState() => _RewardCardState();
}

class _RewardCardState extends State<RewardCard> {
  bool _isClaiming = false;

  Future<void> _handleClaim() async {
    if (widget.onClaim == null || _isClaiming) return;

    if (widget.userPoints < widget.reward.points) {
      await RewardModals.showFailureModal(
        context,
        onTryAgain: null,
        onViewDetails: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  '${AppLocalizations.of(context).insufficientPoints}: ${widget.reward.points - widget.userPoints} ${AppLocalizations.of(context).points}'),
              backgroundColor: AppColors.error,
            ),
          );
        },
      );
      return;
    }

    setState(() {
      _isClaiming = true;
    });

    try {
      final success = await widget.onClaim!(widget.reward.id.toString());

      if (!mounted) return;

      if (success) {
        await RewardModals.showSuccessModal(
          context,
          bonusAmount: 'N${widget.reward.points.toString()}',
          onViewDetails: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    '${AppLocalizations.of(context).rewardDetails}: ${widget.reward.description}'),
                backgroundColor: AppColors.primary,
              ),
            );
          },
        );
      } else {
        await RewardModals.showFailureModal(
          context,
          onTryAgain: () => _handleClaim(),
          onViewDetails: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    '${AppLocalizations.of(context).error}: ${widget.reward.description}'),
                backgroundColor: AppColors.error,
              ),
            );
          },
        );
      }
    } catch (e) {
      if (!mounted) return;

      await RewardModals.showFailureModal(
        context,
        onTryAgain: () => _handleClaim(),
        onViewDetails: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  '${AppLocalizations.of(context).error}: ${e.toString()}'),
              backgroundColor: AppColors.error,
            ),
          );
        },
      );
    } finally {
      if (mounted) {
        setState(() {
          _isClaiming = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isCompact = screenWidth < 360;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            right: -4,
            top: -68,
            child: _BigLogoBubble(
              size: 120,
              color: _getBrandColor(widget.reward.brand.name),
              logoUrl: widget.reward.brand.logo,
              fallbackIcon: _getBrandIcon(widget.reward.brand.name),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SmallLogoPill(
                  size: 32,
                  logoUrl: widget.reward.brand.logo,
                  fallbackIcon: _getBrandIcon(widget.reward.brand.name),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.reward.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textPrimary,
                          height: 1.25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: isCompact ? 8 : 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _ClaimButton(
                          enabled: widget.onClaim != null &&
                              !_isClaiming &&
                              widget.userPoints >= widget.reward.points,
                          isLoading: _isClaiming,
                          onPressed: _handleClaim,
                        ),
                        if (widget.onClaim != null &&
                            !widget.reward.claimed &&
                            widget.userPoints < widget.reward.points)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              '${AppLocalizations.of(context).insufficientPoints}: ${widget.reward.points - widget.userPoints} ${AppLocalizations.of(context).points}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.error,
                                fontSize: 10,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getBrandColor(String brandName) {
    switch (brandName.toLowerCase()) {
      case 'circa':
        return const Color(0xFF8B4513);
      case 'cravvings':
        return const Color(0xFFFF6B6B);
      case 'ibom air':
        return const Color(0xFF4ECDC4);
      case 'omenka':
        return const Color(0xFF45B7D1);
      case 'total energies':
        return const Color(0xFF96CEB4);
      default:
        return AppColors.primary;
    }
  }

  IconData _getBrandIcon(String brandName) {
    switch (brandName.toLowerCase()) {
      case 'circa':
        return Icons.local_bar;
      case 'cravvings':
        return Icons.restaurant;
      case 'ibom air':
        return Icons.flight;
      case 'omenka':
        return Icons.brush;
      case 'total energies':
        return Icons.local_gas_station;
      default:
        return Icons.card_giftcard;
    }
  }
}

/// Small left logo with subtle container (like the design’s badge)
class _SmallLogoPill extends StatelessWidget {
  final double size;
  final String logoUrl;
  final IconData fallbackIcon;

  const _SmallLogoPill({
    required this.size,
    required this.logoUrl,
    required this.fallbackIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 8,
      height: size + 8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 1),
            color: Colors.black.withOpacity(0.04),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: _BrandImage(
          url: logoUrl,
          size: size,
          icon: fallbackIcon,
        ),
      ),
    );
  }
}

class _BigLogoBubble extends StatelessWidget {
  final double size;
  final Color color;
  final String logoUrl;
  final IconData fallbackIcon;

  const _BigLogoBubble({
    required this.size,
    required this.color,
    required this.logoUrl,
    required this.fallbackIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: ClipOval(
        child: _BrandImage(
          url: logoUrl,
          size: size,
          icon: fallbackIcon,
        ),
      ),
    );
  }
}

class _BrandImage extends StatelessWidget {
  final String url;
  final double size;
  final IconData icon;

  const _BrandImage({
    required this.url,
    required this.size,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return Icon(icon, color: Colors.white, size: size * 0.5);
    }
    return Image.network(
      url,
      width: size,
      height: size,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.medium,
      errorBuilder: (_, __, ___) =>
          Icon(icon, color: Colors.white, size: size * 0.5),
    );
  }
}

class _ClaimButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback? onPressed;
  final bool isLoading;

  const _ClaimButton(
      {required this.enabled, this.onPressed, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      onPressed: enabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        minimumSize: const Size(0, 40),
        side: const BorderSide(color: AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        foregroundColor: AppColors.primary,
        textStyle: theme.textTheme.labelLarge,
      ),
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2,
              ),
            )
          : Text(AppLocalizations.of(context).claim),
    );
  }
}
