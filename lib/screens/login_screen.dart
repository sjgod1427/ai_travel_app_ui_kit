import 'package:ai_travel_app_ui_kit/components/text_fields/auth_textfields.dart';
import 'package:flutter/material.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/social_auth_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor, size: 20),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Login',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            Text(
              'Welcome back!',
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[850],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Sign in to continue your adventure.',
              style: textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 32.0),
            // TextField(
            //   keyboardType: TextInputType.emailAddress,
            //   decoration: InputDecoration(
            //     hintText: 'Email address',
            //     hintStyle: textTheme.bodyLarge?.copyWith(
            //       color: Colors.grey[500],
            //     ),
            //     filled: true,
            //     fillColor: Colors.grey[100],
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //       borderSide: BorderSide.none,
            //     ),
            //     contentPadding: const EdgeInsets.symmetric(
            //       horizontal: 16.0,
            //       vertical: 16.0,
            //     ),
            //   ),
            //   style: textTheme.bodyLarge?.copyWith(color: Colors.grey[850]),
            // ),
            AuthTextfields().buildTextField(
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16.0),
            // TextField(
            //   obscureText: _obscureText,
            //   decoration: InputDecoration(
            //     hintText: 'Password',
            //     hintStyle: textTheme.bodyLarge?.copyWith(
            //       color: Colors.grey[500],
            //     ),
            //     filled: true,
            //     fillColor: Colors.grey[100],
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //       borderSide: BorderSide.none,
            //     ),
            //     contentPadding: const EdgeInsets.symmetric(
            //       horizontal: 16.0,
            //       vertical: 16.0,
            //     ),
            //     suffixIcon: Padding(
            //       padding: const EdgeInsets.only(right: 8.0),
            //       child: IconButton(
            //         icon: Icon(
            //           _obscureText ? Icons.visibility_off : Icons.visibility,
            //           color: Colors.grey.withValues(alpha: 0.7),
            //         ),
            //         onPressed: () {
            //           setState(() {
            //             _obscureText = !_obscureText;
            //           });
            //         },
            //       ),
            //     ),
            //   ),
            //   style: textTheme.bodyLarge?.copyWith(color: Colors.grey[850]),
            // ),
            AuthTextfields().buildPasswordField(
              controller: TextEditingController(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: textTheme.bodyMedium?.copyWith(color: primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            PrimaryTextButton(text: 'Login', onPressed: () {}),
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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to signup screen
                  },
                  child: Text(
                    'Sign Up',
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
    );
  }
}
