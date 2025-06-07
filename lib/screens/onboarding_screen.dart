import 'package:flutter/material.dart';

import 'package:ai_travel_app_ui_kit/components/buttons/social_auth_button.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access theme for consistent styling
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor:
          Colors.white, // Using white as a base, similar to UIKit surface
      body: Stack(
        children: [
          // "Try Now" button in the top right
          Positioned(
            top:
                MediaQuery.of(context).padding.top +
                16.0, // Adjust for safe area
            right: 16.0,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Try Now',
                style: textTheme.bodyLarge?.copyWith(
                  color: primaryColor,
                ), // Assuming bodyLarge for "Try Now"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ), // Placeholder for top spacing
                Text(
                  'Rethink\nSimplicity',
                  style: textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 32, // Font size reduced to 36 as requested
                    color: Colors.grey[800], // Darker grey for prominent text
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.',
                  style: textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600], // Lighter grey for body text
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width:
                          index == 0 ? 20.0 : 8.0, // First dot slightly wider
                      height: 8.0,
                      decoration: BoxDecoration(
                        color:
                            index == 0
                                ? primaryColor
                                : Colors
                                    .grey[300], // First dot is primary, others are lighter
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    );
                  }),
                ),
                const Spacer(), // Pushes content to the bottom
                SocialAuthButton(type: ButtonType.apple, onPressed: () {}),
                const SizedBox(height: 16.0),
                PrimaryTextButton(
                  text: 'Signup / Login with phone',
                  onPressed: () {},
                ),
                const SizedBox(height: 40.0), // Bottom padding
              ],
            ),
          ),
        ],
      ),
    );
  }
}
