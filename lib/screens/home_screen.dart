import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Hotel'; // Default selected category

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white, // Consistent light grey background
      appBar: AppBar(
        backgroundColor: Colors.white, // Match scaffold background
        elevation: 0,
        scrolledUnderElevation: 0, // Ensure no shadow on scroll
        titleSpacing: 0, // Remove default title spacing for custom layout
        title: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(
                  'https://picsum.photos/100/100?random=profile_home', // Placeholder profile image
                ),
              ),
              const SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Jane!',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    'Hope you are having a good time',
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: primaryColor, size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: 16.0),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for your next adventure',
                hintStyle: textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[500],
                ),
                filled: true,
                fillColor: colorScheme.surface, // White background
                prefixIcon: Padding(
                  // Added Padding for left padding
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 8.0,
                  ), // Added left padding
                  child: Icon(Icons.search, color: Colors.grey[600]),
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Made background transparent
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Icon(Icons.location_on, color: primaryColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[850]),
            ),
            const SizedBox(height: 24.0),
            // Categories
            Text(
              'Explore Categories',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _CategoryChip(
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
                  const SizedBox(width: 12.0),
                  _CategoryChip(
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
                  const SizedBox(width: 12.0),
                  _CategoryChip(
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
                  const SizedBox(width: 12.0),
                  _CategoryChip(
                    text: 'Travel',
                    isSelected: _selectedCategory == 'Travel',
                    onTap: () {
                      setState(() {
                        _selectedCategory = 'Travel';
                      });
                    },
                    primaryColor: primaryColor,
                    textTheme: textTheme,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            // Featured Destination
            Text(
              'Featured Destination',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 16.0),
            _HotelCard(
              hotelName: 'The Westin Dhaka',
              address: 'Gulshan 2, Dhaka',
              pricePerDay: '\$180',
              rating: '4.8 (1.5k reviews)',
              imageUrl: 'https://picsum.photos/400/250?random=featured',
              textTheme: textTheme,
              colorScheme: colorScheme,
              onTap: () {},
            ),
            const SizedBox(height: 24.0),
            // Recently Booked
            Text(
              'Recently Booked',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable internal scrolling
              itemCount: 3, // Example: 3 recently booked items
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _HotelCard(
                    hotelName: 'Hotel Supreme - Booking ${index + 1}',
                    address: '4140 Parker Rd. Allentown, Sylhet 3100',
                    pricePerDay: '\$126',
                    rating: '4.9 (234 reviews)',
                    imageUrl:
                        'https://picsum.photos/400/250?random=${index + 10}', // Different image for each
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                    onTap: () {},
                  ),
                );
              },
            ),
            const SizedBox(height: 80.0), // Padding for bottom navigation
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // AI icon
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50.0,
          ), // Makes it a circular button
        ),
        child: Icon(Icons.psychology_outlined),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation
              .endFloat, // Positions it in the bottom-right
      bottomNavigationBar: _BottomNavigationBar(
        primaryColor: primaryColor,
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color primaryColor;
  final TextTheme textTheme;

  const _CategoryChip({
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(60.0),
          border: Border.all(color: Colors.grey[300]!, width: 1.0),
        ),
        child: Text(
          text,
          style: textTheme.bodyMedium?.copyWith(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

// Re-using _HotelCard from explore_hotels_screen.dart
class _HotelCard extends StatefulWidget {
  final String hotelName;
  final String address;
  final String pricePerDay;
  final String rating;
  final String imageUrl;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final VoidCallback onTap;

  const _HotelCard({
    required this.hotelName,
    required this.address,
    required this.pricePerDay,
    required this.rating,
    required this.imageUrl,
    required this.textTheme,
    required this.colorScheme,
    required this.onTap,
  });

  @override
  State<_HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<_HotelCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.colorScheme.surface,
      borderRadius: BorderRadius.circular(15.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: widget.onTap,
        hoverColor: widget.colorScheme.primary.withValues(alpha: 0.05),
        splashColor: widget.colorScheme.primary.withValues(alpha: 0.2),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget.imageUrl,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Container(
                            height: 220,
                            width: double.infinity,
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.grey[600],
                            ),
                          ),
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: _isFavorite ? Colors.red : Colors.grey[700],
                        ),
                        onPressed: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.hotelName,
                          style: widget.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          widget.address,
                          style: widget.textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${widget.pricePerDay}/Day',
                    style: widget.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4.0),
                  Text(
                    widget.rating,
                    style: widget.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  final Color primaryColor;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _BottomNavigationBar({
    required this.primaryColor,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  int _selectedIndex = 0; // Default to Home tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3), // Shadow above the bar
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0, // No shadow on the bar itself, using container shadow
        backgroundColor:
            Colors.transparent, // Transparent to show container color
        selectedItemColor: widget.primaryColor,
        unselectedItemColor: Colors.grey[500],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: widget.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: widget.primaryColor,
        ),
        unselectedLabelStyle: widget.textTheme.bodySmall?.copyWith(
          color: Colors.grey[500],
        ),
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online_outlined),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
