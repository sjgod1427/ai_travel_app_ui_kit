import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart';

class ReservationDetailsScreen extends StatefulWidget {
  const ReservationDetailsScreen({super.key});

  @override
  State<ReservationDetailsScreen> createState() =>
      _ReservationDetailsScreenState();
}

class _ReservationDetailsScreenState extends State<ReservationDetailsScreen> {
  String? _selectedPaymentOption =
      'Pay part now, part later'; // Default selection
  String? _selectedPaymentMethod =
      'Google Pay - **** **** 4709'; // Default selection

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white, // Light grey background
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: primaryColor,
          ), // Set close icon color to primaryColor
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Request to book',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                _BookingSummaryCard(
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                ),
                const SizedBox(height: 16.0),
                // --- New: Required for your trip section ---
                _SectionContainer(
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                  title: 'Required for your trip',
                  children: [
                    _RequiredInfoRow(
                      label: 'Message the host',
                      hintText: 'Hi Brother,\nCheck all My files!',
                      onAddTap: () {},
                      textTheme: textTheme,
                    ),
                    _RequiredInfoRow(
                      label: 'Phone Number',
                      hintText: '01616 411555',
                      onAddTap: () {},
                      textTheme: textTheme,
                    ),
                    _RequiredInfoRow(
                      label: 'Profile Photo',
                      hintText: 'Uploaded',
                      onAddTap: () {},
                      textTheme: textTheme,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                // --- New: Cancellation Policy Section (distinct from original card) ---
                _SectionContainer(
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                  title: 'Cancellation Policy',
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text:
                                  'Stay informed with clear, flexible cancellation terms. View refundable dates, fees, and policy types before you book. ',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[700],
                              ),
                              children: [
                                TextSpan(
                                  text: 'Learn More',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer:
                                      TapGestureRecognizer()..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.grey[600],
                          size: 24,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                // --- New: Hotel Rules Section ---
                _SectionContainer(
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                  title: 'Hotel Rules',
                  children: [
                    Text(
                      'Know before you go—check key rules like check-in/out times, smoking policies...',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _BulletPointText(
                      text: 'Follow all Rules',
                      textTheme: textTheme,
                    ),
                    _BulletPointText(
                      text:
                          'If you break intentionally. Hotel Management may charge you',
                      textTheme: textTheme,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                // --- New: Your Reservation Gonna Confirm Soon! ---
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
                      Expanded(
                        child: Text(
                          'Your Reservation Gonna\nConfirm Soon!',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      Icon(
                        Icons.calendar_month,
                        color: Colors.grey[600],
                        size: 36,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ), // Consistent spacing before next section
                // --- Original sections follow below ---
                _SectionContainer(
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                  title: 'Your Trip',
                  children: [
                    _TripDetailRow(
                      label: 'Dates',
                      value: 'March 10 - 13, 2024 (4 Days)',
                      onEdit: () {},
                      textTheme: textTheme,
                    ),
                    _TripDetailRow(
                      label: 'Guests',
                      value: '2 Guests',
                      onEdit: () {},
                      textTheme: textTheme,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                // Choose how to pay Section
                _SectionContainer(
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                  title: 'Choose how to pay',
                  children: [
                    _PaymentOptionTile(
                      title: 'Pay 68,000 BDT (full)',
                      value: 'Pay 68,000 BDT (full)',
                      groupValue: _selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentOption = value;
                        });
                      },
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                    ),
                    _PaymentOptionTile(
                      title: 'Pay part now, part later',
                      subtitle:
                          'Pay 40% Money today as an advance payment for room booking. ',
                      subtitleLink: 'More info',
                      value: 'Pay part now, part later',
                      groupValue: _selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentOption = value;
                        });
                      },
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                // Price Details Section
                _SectionContainer(
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                  title: 'Price Details',
                  children: [
                    _PriceDetailRow(
                      label: 'Advance Payment',
                      amount: '27,200 BDT',
                      textTheme: textTheme,
                      isBold: false,
                    ),
                    _PriceDetailRow(
                      label: 'App Service Fee',
                      amount: '300 BDT',
                      textTheme: textTheme,
                      isBold: false,
                    ),
                    _PriceDetailRow(
                      label: 'Government Tax',
                      amount: '500 BDT',
                      textTheme: textTheme,
                      isBold: false,
                    ),
                    const SizedBox(height: 8.0),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    const SizedBox(height: 8.0),
                    _PriceDetailRow(
                      label: 'Total (BDT)',
                      amount: '28,000 BDT',
                      textTheme: textTheme,
                      isBold: true,
                      linkText: 'More Info',
                      onLinkTap: () {},
                    ),
                    const SizedBox(height: 16.0),
                    _PriceDetailRow(
                      label: 'Due Now',
                      amount: '40,000 BDT',
                      textTheme: textTheme,
                      isBold: true,
                      isPrimaryColor: true,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                // Pay With Section
                _SectionContainer(
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                  title: 'Pay With',
                  children: [
                    _PaymentMethodTile(
                      icon:
                          Icons
                              .person_outline, // Placeholder for Google Pay icon
                      title: 'Google Pay - **** **** 4709',
                      value: 'Google Pay - **** **** 4709',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value;
                        });
                      },
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                    ),
                    _PaymentMethodTile(
                      icon:
                          Icons.credit_card, // Placeholder for Mastercard icon
                      title: 'Mastercard - **** **** 6782',
                      value: 'Mastercard - **** **** 6782',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value;
                        });
                      },
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                    ),
                    _PaymentMethodTile(
                      icon: Icons.add_card,
                      title: 'Add new card',
                      isAddCard: true,
                      onTap: () {},
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                    ),
                  ],
                ),
                const SizedBox(height: 40.0), // Padding before bottom button
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 24.0,
            ),
            child: PrimaryTextButton(text: 'Next', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

class _SectionContainer extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final String title;
  final List<Widget> children;

  const _SectionContainer({
    required this.textTheme,
    required this.colorScheme,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0), // Space between sections
      padding: const EdgeInsets.all(16.0), // Internal padding
      decoration: BoxDecoration(
        color: colorScheme.surface, // White background
        borderRadius: BorderRadius.circular(15.0), // Rounded corners
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
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16.0),
          ...children,
        ],
      ),
    );
  }
}

class _BookingSummaryCard extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _BookingSummaryCard({
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              'https://picsum.photos/100/100?random=roombooking', // Placeholder image
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
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Room Booking',
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Loft Style Guest suite with\nPrivate Bathroom',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4.0),
                    Text(
                      '4.9 (240)',
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TripDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onEdit;
  final TextTheme textTheme;

  const _TripDetailRow({
    required this.label,
    required this.value,
    required this.onEdit,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textTheme.bodyLarge?.copyWith(
                  // Changed to bodyLarge as per image
                  fontWeight: FontWeight.normal, // Not bold in image
                  color: Colors.grey[700], // Adjust color
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                value,
                style: textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
          TextButton(
            onPressed: onEdit,
            child: Text(
              'Edit',
              style: textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentOptionTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? subtitleLink;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final TextTheme textTheme;
  final Color primaryColor;

  const _PaymentOptionTile({
    required this.title,
    this.subtitle,
    this.subtitleLink,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.textTheme,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          title: Text(
            title,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.normal, // Not bold in image
              color: Colors.grey[700], // Adjust color
            ),
          ),
          subtitle:
              subtitle != null
                  ? Text.rich(
                    TextSpan(
                      text: subtitle,
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                      children: [
                        if (subtitleLink != null)
                          TextSpan(
                            text: subtitleLink,
                            style: textTheme.bodySmall?.copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                      ],
                    ),
                  )
                  : null,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: primaryColor,
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        if (subtitle != null)
          // No divider needed here, container will provide separation
          const SizedBox(height: 8.0), // Space between radio tiles
      ],
    );
  }
}

class _PriceDetailRow extends StatelessWidget {
  final String label;
  final String amount;
  final TextTheme textTheme;
  final bool isBold;
  final String? linkText;
  final VoidCallback? onLinkTap;
  final bool isPrimaryColor;

  const _PriceDetailRow({
    required this.label,
    required this.amount,
    required this.textTheme,
    this.isBold = false,
    this.linkText,
    this.onLinkTap,
    this.isPrimaryColor = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        isPrimaryColor
            ? Theme.of(context).primaryColor
            : (isBold ? Colors.grey[800] : Colors.grey[700])!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                label,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: textColor,
                ),
              ),
              if (linkText != null) ...[
                const SizedBox(width: 8.0),
                GestureDetector(
                  onTap: onLinkTap,
                  child: Text(
                    linkText!,
                    style: textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
          Text(
            amount,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? value; // Used for radio selection
  final String? groupValue;
  final ValueChanged<String?>? onChanged;
  final bool isAddCard;
  final VoidCallback? onTap;
  final TextTheme textTheme;
  final Color primaryColor;

  const _PaymentMethodTile({
    this.icon,
    required this.title,
    this.value,
    this.groupValue,
    this.onChanged,
    this.isAddCard = false,
    this.onTap,
    required this.textTheme,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    if (isAddCard) {
      return ListTile(
        leading: Icon(icon, color: Colors.grey[700]),
        title: Text(
          title,
          style: textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey[400],
          size: 16,
        ),
        onTap: onTap,
      );
    } else {
      return RadioListTile<String>(
        value: value!,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: primaryColor,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.grey[700]),
              const SizedBox(width: 8.0),
            ],
            Expanded(
              // Wrap text in Expanded to prevent overflow
              child: Text(
                title,
                style: textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
                overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _RequiredInfoRow extends StatelessWidget {
  final String label;
  final String hintText;
  final VoidCallback onAddTap;
  final TextTheme textTheme;

  const _RequiredInfoRow({
    required this.label,
    required this.hintText,
    required this.onAddTap,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align to top for multiline hint
        children: [
          Expanded(
            // Ensure text takes available space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  hintText,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[500],
                  ),
                  maxLines: 2, // Allow two lines for hint text
                  overflow:
                      TextOverflow.ellipsis, // Ellipsis if still overflows
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0), // Space between text and button
          SizedBox(
            height: 30, // Smaller height for the "Add" button
            child: OutlinedButton(
              onPressed: onAddTap,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey[300]!, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                minimumSize: Size.zero, // Remove default minimum size
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Add',
                style: textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletPointText extends StatelessWidget {
  final String text;
  final TextTheme textTheme;

  const _BulletPointText({required this.text, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
          ),
          Expanded(
            child: Text(
              text,
              style: textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
