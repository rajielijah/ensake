import 'package:flutter/material.dart';
import 'package:ensake_loyalty_app/utils/app_colors.dart';

enum _ModalVariant { success, error }

class RewardModals {
  static Future<void> showSuccessModal(
    BuildContext context, {
    required String bonusAmount,
    VoidCallback? onViewDetails,
  }) {
    return _showStatusModal(
      context,
      variant: _ModalVariant.success,
      title: 'Points Earned!',
      message: "You've claimed a $bonusAmount Bonus!",
      secondaryLabel: 'Cancel',
      primaryLabel: 'View Details',
      onSecondary: null,
      onPrimary: onViewDetails,
    );
  }

  static Future<void> showFailureModal(
    BuildContext context, {
    VoidCallback? onTryAgain,
    VoidCallback? onViewDetails,
  }) {
    return _showStatusModal(
      context,
      variant: _ModalVariant.error,
      title: 'Failed',
      message: 'You can try again to claim a reward',
      secondaryLabel: 'Try Again',
      primaryLabel: 'View Details',
      onSecondary: onTryAgain,
      onPrimary: onViewDetails,
    );
  }

  static Future<void> _showStatusModal(
    BuildContext context, {
    required _ModalVariant variant,
    required String title,
    required String message,
    required String secondaryLabel,
    required String primaryLabel,
    VoidCallback? onSecondary,
    VoidCallback? onPrimary,
  }) {
    final isSuccess = variant == _ModalVariant.success;
    final Color accent = isSuccess ? AppColors.success : AppColors.error;
    const Color surface = Colors.white;

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Material(
            type: MaterialType.card,
            color: surface,
            borderRadius: BorderRadius.circular(20),
            elevation: 8,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 420),
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: accent.withOpacity(0.12),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            isSuccess ? Icons.check : Icons.error_outline,
                            color: accent,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(dialogContext)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 52),
                      child: Text(
                        message,
                        style: Theme.of(dialogContext)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              color: AppColors.textSecondary,
                              height: 1.4,
                            ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(height: 1, color: AppColors.divider),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: onSecondary != null
                                ? () {
                                    Navigator.of(dialogContext).pop();
                                    onSecondary();
                                  }
                                : () {
                                    Navigator.of(dialogContext).pop();
                                  },
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(0, 44),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side: const BorderSide(color: AppColors.divider),
                              foregroundColor: AppColors.textPrimary,
                              textStyle:
                                  Theme.of(dialogContext).textTheme.labelLarge,
                            ),
                            child: Text(
                                onSecondary != null ? secondaryLabel : 'Close'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(dialogContext).pop();
                              onPrimary?.call();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 44),
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              textStyle:
                                  Theme.of(dialogContext).textTheme.labelLarge,
                            ),
                            child: Text(primaryLabel),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
