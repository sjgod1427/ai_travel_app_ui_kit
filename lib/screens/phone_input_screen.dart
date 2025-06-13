import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart';
import 'package:ai_travel_app_ui_kit/components/text_fields/auth_textfields.dart';
import 'package:ai_travel_app_ui_kit/screens/otp_screen.dart';
import 'package:flutter/material.dart';

class PhoneInputScreen extends StatelessWidget {
  const PhoneInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor:
          colorScheme.surface, // Use theme surface color, which is white
      appBar: AppBar(
        backgroundColor:
            colorScheme
                .surface, // AppBar background should match screen background
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 20,
          ), // Back arrow icon matching UIKit style
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Try Now',
                style: textTheme.bodyLarge?.copyWith(color: primaryColor),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0), // Spacing from app bar
            Text(
              'Hello,\nwhat\'s your phone number?',
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color:
                    Colors
                        .grey[850], // Darker text for prominence, consistent with UIKit
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Customer Messages may be sent within iOS\nNotifications or visa SMS.',
              style: textTheme.bodyMedium?.copyWith(
                color:
                    Colors
                        .grey[600], // Lighter text for subtitle, consistent with UIKit
              ),
            ),
            const SizedBox(height: 32.0),
            AuthTextfields().buildTextField(
              controller: TextEditingController(),
              labelText: "Number?",
            ),
            const Spacer(), // Pushes content to the bottom
            PrimaryTextButton(text: 'Continue',
             onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => OtpScreen(),
                      ),
                    );
                  },
            ),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          'By continuing, you confirm you\'ve read and agree to our\n',
                    ),
                    TextSpan(
                      text: 'Terms of Service',
                      style: textTheme.bodySmall?.copyWith(
                        color:
                            Colors
                                .grey[800], // Darker for bolded parts, matching image
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Notice',
                      style: textTheme.bodySmall?.copyWith(
                        color:
                            Colors
                                .grey[800], // Darker for bolded parts, matching image
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text:
                          ' on how we collect, use,\ndisclose, and process your personal data.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40.0), // Bottom padding
          ],
        ),
      ),
    );
  }
}
