import 'package:flutter/material.dart';

class ExploreHotelsScreen extends StatefulWidget {
  const ExploreHotelsScreen({super.key});

  @override
  State<ExploreHotelsScreen> createState() => _ExploreHotelsScreenState();
}

class _ExploreHotelsScreenState extends State<ExploreHotelsScreen> {
  // Use a Set to store currently active filter chips
  final Set<String> _activeFilters = {
    'Hotel - Sylhet',
  }; // Initialize with 'Hotel - Sylhet' active

  void _toggleFilter(String filterText) {
    setState(() {
      if (_activeFilters.contains(filterText)) {
        _activeFilters.remove(filterText);
      } else {
        _activeFilters.add(filterText);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white, // Light grey background
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent, // Match scaffold background
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: primaryColor,
          ), // Close icon with primaryColor
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
        title: Text(
          'Book a Hotel',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize:
                18, // Based on previous request for title size consistency
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: primaryColor.withValues(
                  alpha: 0.1,
                ), // Light primary color background
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(
                Icons.psychology_outlined,
                color: primaryColor,
              ), // AI icon
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Colors.grey[700],
            ), // Filter icon
            onPressed: () {},
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _FilterChip(
                    text: 'Hotel - Sylhet',
                    onTap: () => _toggleFilter('Hotel - Sylhet'),
                    isActive: _activeFilters.contains('Hotel - Sylhet'),
                    primaryColor: primaryColor,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: 8.0),
                  _FilterChip(
                    text: '4 Days',
                    onTap: () => _toggleFilter('4 Days'),
                    isActive: _activeFilters.contains('4 Days'),
                    primaryColor: primaryColor,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: 8.0),
                  _FilterChip(
                    text: 'Check in - Mar 10',
                    onTap: () => _toggleFilter('Check in - Mar 10'),
                    isActive: _activeFilters.contains('Check in - Mar 10'),
                    primaryColor: primaryColor,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: 8.0),
                  // Add more chips if needed
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Available Hotels, Choose by yourself',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Your Selection applies to all traveler and hotel authority.',
              style: textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 24.0),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemCount: 5, // Example: 5 hotel cards
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _HotelCard(
                    hotelName: 'Hotel Supreme', // Example data
                    address: '4140 Parker Rd. Allentown, Sylhet 3100',
                    pricePerDay: '\$126',
                    rating: '4.9 (234 reviews)',
                    imageUrl:
                        'https://picsum.photos/400/250?random=$index', // Placeholder image
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                    onTap: () {},
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

class _FilterChip extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isActive;
  final Color primaryColor;
  final TextTheme textTheme;

  const _FilterChip({
    required this.text,
    required this.onTap,
    this.isActive = false,
    required this.primaryColor,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color:
              isActive
                  ? primaryColor.withValues(alpha: 0.1)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0), // Increased border radius
          border: Border.all(
            color:
                isActive
                    ? primaryColor.withValues(alpha: 0.3)
                    : Colors.grey[300]!,
            width: 1.5,
          ),
        ),
        child: Text(
          text,
          style: textTheme.bodySmall?.copyWith(
            color: isActive ? primaryColor : Colors.grey[700],
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
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
  final VoidCallback onTap; // Added for making the card tappable

  const _HotelCard({
    required this.hotelName,
    required this.address,
    required this.pricePerDay,
    required this.rating,
    required this.imageUrl,
    required this.textTheme,
    required this.colorScheme,
    required this.onTap, // Added key to constructor
  });

  @override
  State<_HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<_HotelCard> {
  bool _isFavorite = false; // State for the heart icon

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.colorScheme.surface, // Card background color
      borderRadius: BorderRadius.circular(15.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: widget.onTap,
        hoverColor: widget.colorScheme.primary.withValues(alpha: 0.05),
        splashColor: widget.colorScheme.primary.withValues(alpha: 0.2),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            // Removed color and shadow from here to prevent overriding Material effects
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget.imageUrl,
                      height: 220, // Increased image height
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Container(
                            height: 220, // Match increased height
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
