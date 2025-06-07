import 'package:flutter/material.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _mobileNumberFocusNode = FocusNode();
  final FocusNode _locationFocusNode = FocusNode();

  Color? _nameFillColor;
  Color? _mobileNumberFillColor;
  Color? _locationFillColor;

  @override
  void initState() {
    super.initState();
    _nameFocusNode.addListener(_updateNameFillColor);
    _mobileNumberFocusNode.addListener(_updateMobileNumberFillColor);
    _locationFocusNode.addListener(_updateLocationFillColor);
  }

  @override
  void dispose() {
    _nameFocusNode.removeListener(_updateNameFillColor);
    _nameFocusNode.dispose();
    _mobileNumberFocusNode.removeListener(_updateMobileNumberFillColor);
    _mobileNumberFocusNode.dispose();
    _locationFocusNode.removeListener(_updateLocationFillColor);
    _locationFocusNode.dispose();
    super.dispose();
  }

  void _updateNameFillColor() {
    setState(() {
      _nameFillColor =
          _nameFocusNode.hasFocus
              ? Theme.of(context).primaryColor.withValues(alpha: 0.05)
              : Theme.of(context).colorScheme.surface;
    });
  }

  void _updateMobileNumberFillColor() {
    setState(() {
      _mobileNumberFillColor =
          _mobileNumberFocusNode.hasFocus
              ? Theme.of(context).primaryColor.withValues(alpha: 0.05)
              : Theme.of(context).colorScheme.surface;
    });
  }

  void _updateLocationFillColor() {
    setState(() {
      _locationFillColor =
          _locationFocusNode.hasFocus
              ? Theme.of(context).primaryColor.withValues(alpha: 0.05)
              : Theme.of(context).colorScheme.surface;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    // Initialize default fill colors
    _nameFillColor ??= colorScheme.surface;
    _mobileNumberFillColor ??= colorScheme.surface;
    _locationFillColor ??= colorScheme.surface;

    return Scaffold(
      backgroundColor: Colors.grey[100], // Light grey background
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ), // Set back icon color to primaryColor
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Profile',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              color: primaryColor,
            ), // Set settings icon color to primaryColor
            onPressed: () {},
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            // User Summary
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: colorScheme.surface,
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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/200/200?random=profile',
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jane Cooper',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        '+01618 411555',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            // Prioritized Service Promo
            _PromoCard(
              textTheme: textTheme,
              primaryColor: primaryColor,
              colorScheme: colorScheme,
            ),
            const SizedBox(height: 24.0),
            // Profile Information Inputs
            _ProfileSectionTitle(title: 'Name', textTheme: textTheme),
            TextField(
              focusNode: _nameFocusNode,
              controller: TextEditingController(text: 'Jane Cooper'),
              decoration: InputDecoration(
                filled: true,
                fillColor: _nameFillColor, // Dynamic fill color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
              ),
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[850]),
            ),
            const SizedBox(height: 16.0),
            _ProfileSectionTitle(title: 'Mobile Number', textTheme: textTheme),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '+880',
                        style: textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[850],
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
                    ],
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    focusNode: _mobileNumberFocusNode,
                    controller: TextEditingController(text: '1616 - 411666'),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: _mobileNumberFillColor, // Dynamic fill color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                    ),
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[850],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            _ProfileSectionTitle(title: 'Location', textTheme: textTheme),
            TextField(
              focusNode: _locationFocusNode,
              controller: TextEditingController(text: 'Current Location'),
              decoration: InputDecoration(
                filled: true,
                fillColor: _locationFillColor, // Dynamic fill color
                prefixIcon: Icon(Icons.location_on, color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
              ),
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[850]),
            ),
            const SizedBox(height: 40.0),
            // Explore Your Features
            Text(
              'Explore Your features',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 24.0),
            _BenefitItem(
              icon: Icons.lightbulb_outline,
              title: 'Rethink simplicity',
              description:
                  'Travel planning, simplified. No clutter. No confusion. Just smart, seamless experiences—powered by AI, designed for ease.',
              textTheme: textTheme,
            ),
            const SizedBox(height: 24.0),
            _BenefitItem(
              icon: Icons.block,
              title: 'No ads, Not now, Not ever',
              description:
                  'Enjoy a completely ad-free experience—focused on your journey, not distractions.',
              textTheme: textTheme,
            ),
            const SizedBox(height: 24.0),
            _BenefitItem(
              icon: Icons.psychology_outlined,
              title: 'We belive in App AI Technology',
              description:
                  'Harnessing the power of AI to create smarter, simpler travel experiences for you.',
              textTheme: textTheme,
            ),
            const SizedBox(height: 40.0),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: PrimaryTextButton(
                  text: 'Learn more about Travel AI App',
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}

class _ProfileSectionTitle extends StatelessWidget {
  final String title;
  final TextTheme textTheme;

  const _ProfileSectionTitle({required this.title, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  final TextTheme textTheme;
  final Color primaryColor;
  final ColorScheme colorScheme;

  const _PromoCard({
    required this.textTheme,
    required this.primaryColor,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: primaryColor.withValues(
          alpha: 0.1,
        ), // Light primary color background
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Want to get free Prioritized service?',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: 120, // Constrain button width
                  height: 40, // Standard button height
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: primaryColor, // Set to primaryColor
                      foregroundColor: Colors.white, // Set text color to white
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          60,
                        ), // Match PrimaryTextButton
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Text(
                      'View Details',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Ensure text is white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              'https://picsum.photos/100/100?random=promo', // Placeholder image
              height: 80,
              width: 80,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, color: Colors.grey[600]),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final TextTheme textTheme;

  const _BenefitItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey[700], size: 28),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                description,
                style: textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
