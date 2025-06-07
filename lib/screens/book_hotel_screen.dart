import 'package:flutter/material.dart';

import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart'; // Import PrimaryTextButton

class BookHotelScreen extends StatelessWidget {
  const BookHotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor:
          Colors.grey[100], // Light grey background matching the image
      appBar: AppBar(
        backgroundColor: Colors.grey[100], // Match scaffold background
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Icon(Icons.close, color: primaryColor, size: 20), // Close icon
          onPressed: () {},
        ),
        title: Text(
          'Book a Hotel',
          style: textTheme.titleLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            Text(
              'Book a Hotel From?',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600, // Semi-bold
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Sylhet, Bangl', // Example hint text
                hintStyle: textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[500],
                ),
                filled: true,
                fillColor:
                    colorScheme.surface, // White background for the input field
                prefixIcon: Padding(
                  // Add padding around the prefix icon
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    right: 8.0,
                  ), // Adjust padding as needed
                  child: Icon(
                    Icons.location_on,
                    color: Colors.grey[600],
                  ), // Location icon
                ),
                suffixIcon: Padding(
                  // Add padding around the suffix icon
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 12.0,
                  ), // Adjust padding as needed
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey[600],
                  ), // Dropdown arrow
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ), // More rounded corners
                  borderSide: BorderSide.none, // No border line
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
              ),
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[850]),
            ),
            const Spacer(), // Pushes the button to the bottom
            PrimaryTextButton(
              // Using the UIKit PrimaryTextButton
              text: 'Next',
              onPressed: () {},
            ),
            const SizedBox(height: 40.0), // Bottom padding
          ],
        ),
      ),
    );
  }
}
