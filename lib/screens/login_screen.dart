import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ensake_loyalty_app/providers/auth_provider.dart';
import 'package:ensake_loyalty_app/utils/app_colors.dart';
import 'package:ensake_loyalty_app/utils/notifier.dart';
import 'package:ensake_loyalty_app/services/font_service.dart';
import 'package:ensake_loyalty_app/services/localization_service.dart';
import 'package:ensake_loyalty_app/widgets/language_toggle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _emailController.text = 'ghengiskhan@gmail.com';
    _passwordController.text = 'secret';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      try {
        
        await authProvider.login(
            _emailController.text, _passwordController.text);

        if (mounted) {
          await Notifier.showToast(
            context,
            message: 'Login successful! Welcome back!',
            backgroundColor: AppColors.success,
          );
        }
      } catch (e) {
        if (mounted) {
          String errorMessage = 'Login failed';

          if (e.toString().contains('Invalid email or password')) {
            errorMessage =
                'Invalid email or password. Please check your credentials.';
          } else if (e.toString().contains('Network error')) {
            errorMessage =
                'Network error. Please check your internet connection.';
          } else if (e.toString().contains('Connection failed')) {
            errorMessage = 'Connection failed. Please try again.';
          } else if (e.toString().contains('Server error')) {
            errorMessage = 'Server error. Please try again later.';
          } else if (e.toString().contains('Validation failed')) {
            errorMessage = 'Please check your input and try again.';
          } else {
            errorMessage = e.toString().replaceAll('Exception: ', '');
          }

          await Notifier.showToast(
            context,
            message: errorMessage,
            backgroundColor: AppColors.error,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              size: 18, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          const LanguageToggle(),
          IconButton(
            icon: const Icon(Icons.help_outline, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24.0,
          left: 24.0,
          right: 24.0,
          bottom: 24.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).loginToAccount,
                style: AppFonts.headlineSmall.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context).enterEmailPassword,
                style: AppFonts.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                AppLocalizations.of(context).emailAddress,
                style: AppFonts.titleSmall.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).pleaseEnterEmail,
                  hintStyle: const TextStyle(color: AppColors.textLight),
                  prefixIcon: const Icon(Icons.email_outlined,
                      color: AppColors.textSecondary),
                  filled: true,
                  fillColor: AppColors.background,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.divider),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).pleaseEnterEmail;
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return AppLocalizations.of(context).pleaseEnterEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context).passwordField,
                style: AppFonts.titleSmall.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).pleaseEnterPassword,
                  hintStyle: const TextStyle(color: AppColors.textLight),
                  prefixIcon: const Icon(Icons.lock_outlined,
                      color: AppColors.textSecondary),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: AppColors.background,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.divider),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).pleaseEnterPassword;
                  }
                  if (value.length < 6) {
                    return AppLocalizations.of(context).passwordMinLength;
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    AppLocalizations.of(context).forgotPassword,
                    style: AppFonts.labelLarge.copyWith(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: authProvider.isLoading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        shadowColor: AppColors.shadow,
                      ),
                      child: authProvider.isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.white),
                              ),
                            )
                          : Text(
                              'Log in',
                              style: AppFonts.buttonLarge.copyWith(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context).dontHaveAccount,
                    style: AppFonts.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/rewards');
                    },
                    child: Text(
                      AppLocalizations.of(context).register,
                      style: AppFonts.labelLarge.copyWith(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
