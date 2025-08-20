import 'package:flutter/material.dart';
import 'package:ensake_loyalty_app/screens/rewards_screen.dart';
import 'package:ensake_loyalty_app/screens/qr_code_screen.dart';
import 'package:ensake_loyalty_app/screens/history_screen.dart';
import 'package:ensake_loyalty_app/screens/profile_screen.dart';
import 'package:ensake_loyalty_app/utils/app_colors.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const RewardsScreen(),
    const QRCodeScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
                Icons.home, 'Home', _currentIndex == 0, () => _onTabTapped(0)),
            _buildNavItem(Icons.qr_code, 'QR Code', _currentIndex == 1,
                () => _onTabTapped(1)),
            _buildNavItem(Icons.history, 'History', _currentIndex == 2,
                () => _onTabTapped(2)),
            _buildNavItem(Icons.person, 'Profile', _currentIndex == 3,
                () => _onTabTapped(3)),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? AppColors.primary : AppColors.textSecondary,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? AppColors.primary : AppColors.textSecondary,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
