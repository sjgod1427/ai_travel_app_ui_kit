import 'package:ai_travel_app_ui_kit/screens/ai_chat_section.dart';
import 'package:ai_travel_app_ui_kit/screens/explore_hotels_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/order_status_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Current tab index

  // List of screens/widgets for each tab
  final List<Widget> _screens = [
    const HomeTabContent(), // Home content
    const OrderStatusScreen(), // Bookings content
    const ExploreHotelsScreen(), // Favorites content
    const ProfileScreen(), // Profile content
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(pageBuilder: (_, __, ___) => AIChatSection()),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Icon(Icons.psychology_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _BottomNavigationBar(
        primaryColor: primaryColor,
        colorScheme: colorScheme,
        textTheme: textTheme,
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

// Home Tab Content (your original home screen content)
class HomeTabContent extends StatefulWidget {
  const HomeTabContent({super.key});

  @override
  State<HomeTabContent> createState() => _HomeTabContentState();
}

class _HomeTabContentState extends State<HomeTabContent> {
  String _selectedCategory = 'Hotel';

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(
                  'https://picsum.photos/100/100?random=profile_home',
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
                fillColor: Colors.grey[100],
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: Icon(Icons.search, color: primaryColor),
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
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
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _HotelCard(
                    hotelName: 'Hotel Supreme - Booking ${index + 1}',
                    address: '4140 Parker Rd. Allentown, Sylhet 3100',
                    pricePerDay: '\$126',
                    rating: '4.9 (234 reviews)',
                    imageUrl:
                        'https://picsum.photos/400/250?random=${index + 10}',
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                    onTap: () {},
                  ),
                );
              },
            ),
            const SizedBox(height: 80.0),
          ],
        ),
      ),
    );
  }
}

// Bookings Tab Content
class BookingsTabContent extends StatelessWidget {
  const BookingsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'My Bookings',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Tab selection for booking status
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        'Upcoming',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Past',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            // Booking list
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://picsum.photos/80/80?random=booking$index',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hotel Booking ${index + 1}',
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                'Check-in: Dec ${20 + index}, 2024',
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Text(
                                  'Confirmed',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: Colors.green[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Favorites Tab Content
class FavoritesTabContent extends StatelessWidget {
  const FavoritesTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'Favorites',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.8,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return _HotelCard(
              hotelName: 'Favorite Hotel ${index + 1}',
              address: 'City Location ${index + 1}',
              pricePerDay: '\$${120 + index * 20}',
              rating: '4.${7 + index % 3} (${200 + index * 50} reviews)',
              imageUrl: 'https://picsum.photos/200/150?random=fav$index',
              textTheme: textTheme,
              colorScheme: colorScheme,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

// Profile Tab Content
class ProfileTabContent extends StatelessWidget {
  const ProfileTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'Profile',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Profile header
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(
                'https://picsum.photos/200/200?random=profile',
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Jane Doe',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            Text(
              'jane.doe@example.com',
              style: textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 32.0),
            // Profile options
            _ProfileOption(
              icon: Icons.person_outline,
              title: 'Personal Information',
              onTap: () {},
              textTheme: textTheme,
            ),
            _ProfileOption(
              icon: Icons.payment_outlined,
              title: 'Payment Methods',
              onTap: () {},
              textTheme: textTheme,
            ),
            _ProfileOption(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              onTap: () {},
              textTheme: textTheme,
            ),
            _ProfileOption(
              icon: Icons.security_outlined,
              title: 'Security',
              onTap: () {},
              textTheme: textTheme,
            ),
            _ProfileOption(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {},
              textTheme: textTheme,
            ),
            _ProfileOption(
              icon: Icons.info_outline,
              title: 'About',
              onTap: () {},
              textTheme: textTheme,
            ),
            const SizedBox(height: 32.0),
            // Logout button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red[700],
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Logout',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final TextTheme textTheme;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey[700]),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  title,
                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey[400]),
            ],
          ),
        ),
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

class _BottomNavigationBar extends StatelessWidget {
  final Color primaryColor;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const _BottomNavigationBar({
    required this.primaryColor,
    required this.colorScheme,
    required this.textTheme,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[500],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        unselectedLabelStyle: textTheme.bodySmall?.copyWith(
          color: Colors.grey[500],
        ),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
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
