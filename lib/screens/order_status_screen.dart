import 'package:ai_travel_app_ui_kit/screens/booking_pending_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/home_screen.dart';
import 'package:flutter/material.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key});

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  String _selectedCategory = 'Hotel'; // Default selected category

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

        title: Row(
          // Changed Column to Row
          mainAxisSize: MainAxisSize.min, // Ensure row takes minimum space
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Order Status',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 8.0), // Add some spacing between texts
            Text(
              'Messages (1)',
              style: textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
        centerTitle: false, // Align title to start
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: primaryColor,
            ), // Set search icon color to primaryColor
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(pageBuilder: (_, __, ___) => HomeScreen()),
              );
            },
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              // Added SingleChildScrollView
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _OrderCategoryTab(
                    text: 'All',
                    isSelected: _selectedCategory == 'All',
                    onTap: () {
                      setState(() {
                        _selectedCategory = 'All';
                      });
                    },
                    primaryColor: primaryColor,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: 8.0),
                  _OrderCategoryTab(
                    text: 'Hotel',
                    isSelected: _selectedCategory == 'Hotel',
                    onTap: () {
                      setState(() {
                        _selectedCategory = 'Hotel';
                      });
                    },
                    primaryColor: primaryColor,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: 8.0),
                  _OrderCategoryTab(
                    text: 'Convention Center',
                    isSelected: _selectedCategory == 'Convention Center',
                    onTap: () {
                      setState(() {
                        _selectedCategory = 'Convention Center';
                      });
                    },
                    primaryColor: primaryColor,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: 8.0),
                  _OrderCategoryTab(
                    text: 'Flights',
                    isSelected: _selectedCategory == 'Flights',
                    onTap: () {
                      setState(() {
                        _selectedCategory = 'Flights';
                      });
                    },
                    primaryColor: primaryColor,
                    textTheme: textTheme,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Hotel Booking',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemCount: 5, // Example number of booking cards
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _BookingStatusCard(
                    roomType: 'Room Booking',
                    roomName: 'Loft Style Guest suite with\nPrivate Bathroom',
                    rating: '4.9 (240)',
                    status: 'Pending',
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                    // Use different image for each card
                    imageUrl:
                        'https://picsum.photos/100/100?random=${index + 10}',
                    onTap: () {
                      // Handle tap on the booking card
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => BookingPendingScreen(),
                        ),
                      );
                      // You can navigate to a detail screen or perform other actions here
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderCategoryTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color primaryColor;
  final TextTheme textTheme;

  const _OrderCategoryTab({
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.primaryColor,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        ), // Reverted padding
        decoration: BoxDecoration(
          color:
              isSelected
                  ? primaryColor
                  : Colors.transparent, // Reverted inactive background
          borderRadius: BorderRadius.circular(60.0), // Rounded corners
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1.0,
          ), // Reverted inactive border
        ),
        child: Text(
          text,
          style: textTheme.bodyMedium?.copyWith(
            color:
                isSelected
                    ? Colors.white
                    : Colors.grey[700], // Reverted inactive text color
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _BookingStatusCard extends StatelessWidget {
  final String roomType;
  final String roomName;
  final String rating;
  final String status;
  final String imageUrl;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final VoidCallback? onTap; // Added onTap callback

  const _BookingStatusCard({
    required this.roomType,
    required this.roomName,
    required this.rating,
    required this.status,
    required this.imageUrl,
    required this.textTheme,
    required this.colorScheme,
    this.onTap, // Added onTap to constructor
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Material(
      // Wrap with Material for InkWell splash effect
      color: Colors.transparent, // Make Material transparent
      child: Ink(
        // Use Ink to apply the decoration
        decoration: BoxDecoration(
          color: colorScheme.surface, // White background
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 0.5,
            color: Colors.grey.withValues(alpha: 0.5),
          ),
        ),
        child: InkWell(
          hoverColor: primaryColor.withValues(alpha: 0.06),
          onTap: onTap, // Assign the onTap callback
          borderRadius: BorderRadius.circular(
            15.0,
          ), // Match container's border radius
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    imageUrl, // Placeholder image
                    height: 100, // Increased image height
                    width: 100, // Increased image width
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          height: 100, // Match increased height
                          width: 100, // Match increased width
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.image,
                            color: Colors.grey[600],
                            size: 50,
                          ), // Adjust icon size accordingly
                        ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        roomType,
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        roomName,
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
                            rating,
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0), // Space before status tag
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 6.0,
                    ),
                    decoration: BoxDecoration(
                      color:
                          Colors.grey[200], // Light grey background for status
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      status,
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
