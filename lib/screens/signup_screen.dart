import 'package:ai_travel_app_ui_kit/components/text_fields/auth_textfields.dart';
import 'package:ai_travel_app_ui_kit/screens/home_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/login_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/phone_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/social_auth_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: primaryColor, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Sign Up',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0),
              Text(
                'Create an account',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[850],
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Join us to start your travel journey.',
                style: textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 32.0),
              AuthTextfields().buildTextField(
                controller: TextEditingController(),
                labelText: "Full Name",
              ),
              const SizedBox(height: 16.0),
              AuthTextfields().buildTextField(
                controller: TextEditingController(),
                labelText: "Email",
              ),
              const SizedBox(height: 16.0),
              AuthTextfields().buildPasswordField(
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16.0),
              AuthTextfields().buildPasswordField(
                controller: TextEditingController(),
                labelText: "Confirm Password",
              ),
              const SizedBox(height: 24.0),
              PrimaryTextButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => PhoneInputScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Or',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),
              const SizedBox(height: 24.0),
              SocialAuthButton.google(onPressed: () {}),
              const SizedBox(height: 16.0),
              SocialAuthButton.apple(onPressed: () {}),
              const SizedBox(height: 16.0),
              SocialAuthButton.facebook(onPressed: () {}),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Log In',
                      style: textTheme.bodyMedium?.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
