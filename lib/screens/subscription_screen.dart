import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white, // Light grey background
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 20,
          ), // Back arrow primary color
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Subscription',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40.0),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color:
                    Colors
                        .grey[100], // Light grey background for the icon container
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Icon(
                Icons.emoji_events_outlined, // Crown icon
                size: 60,
                color: primaryColor, // Crown icon primary color
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'AI Travel Premium',
              style: textTheme.headlineSmall?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 40.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Benefits',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  'Members-only benefits',
                  style: textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Benefits Card
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: colorScheme.surface, // White background
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _BenefitItem(
                    text: 'Unlimited Free Delivery',
                    hasLink: true,
                    linkText: 'Terms apply',
                    onLinkTap: () {},
                    textTheme: textTheme,
                    primaryColor:
                        primaryColor, // Pass primaryColor to BenefitItem
                  ),
                  const SizedBox(height: 8.0),
                  _BenefitItem(
                    text: 'Ready, Set & Drive',
                    textTheme: textTheme,
                    primaryColor: primaryColor,
                  ),
                  const SizedBox(height: 8.0),
                  _BenefitItem(
                    text: 'Free Shipping',
                    textTheme: textTheme,
                    primaryColor: primaryColor,
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    'Just \$49 a year',
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Pays for itself in 1.5 house cleanings.\nBased on national Average.',
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor:
                            primaryColor, // Unlock Benefits button primary color
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            60,
                          ), // Match primary text button style
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                      ),
                      child: Text(
                        'UNLOCK BENEFITS',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(), // Pushes content up if screen is tall
          ],
        ),
      ),
    );
  }
}

class _BenefitItem extends StatelessWidget {
  final String text;
  final bool hasLink;
  final String? linkText;
  final VoidCallback? onLinkTap;
  final TextTheme textTheme;
  final Color primaryColor; // Added primaryColor to BenefitItem

  const _BenefitItem({
    required this.text,
    this.hasLink = false,
    this.linkText,
    this.onLinkTap,
    required this.textTheme,
    required this.primaryColor, // Require primaryColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle,
          color: primaryColor,
          size: 20,
        ), // Checkmark icon primary color
        const SizedBox(width: 12.0),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: text,
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
              children: [
                if (hasLink && linkText != null)
                  TextSpan(
                    text: ' ($linkText)',
                    style: textTheme.bodyLarge?.copyWith(
                      color: primaryColor, // Link color
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onLinkTap,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
