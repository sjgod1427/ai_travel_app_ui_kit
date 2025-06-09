import 'package:flutter/material.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart'; // Assuming PrimaryTextButton is suitable for "Reserve"
// TapGestureRecognizer to make parts of TextSpan tappable
import 'package:flutter/gestures.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({super.key});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  bool _isDescriptionExpanded = false;
  String _selectedTab = 'Overview'; // Default selected tab
  bool _isFavorited = false; // State for the heart icon

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white, // Light grey background
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor:
            Colors.transparent, // Transparent to show background behind
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor,
            size: 20,
          ), // Back icon
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorited
                  ? Icons.favorite
                  : Icons.favorite_border, // Toggle icon based on state
              color:
                  _isFavorited
                      ? Colors.red
                      : primaryColor, // Red when favorited
              size: 24,
            ), // Heart icon
            onPressed: () {
              setState(() {
                _isFavorited = !_isFavorited; // Toggle favorite state
              });
            },
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: 80,
            ), // Space for the fixed bottom bar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Center(
                    child: ClipRRect(
                      child: Image.network(
                        'https://picsum.photos/400/250?random=hotelmain', // Main hotel image - changed to 400x250 for better filling
                        height: 200,
                        width: double.infinity, // Make image fill width
                        fit: BoxFit.cover, // Ensure image covers the area
                        errorBuilder:
                            (context, error, stackTrace) => Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.image,
                                size: 80,
                                color: Colors.grey[600],
                              ),
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        // Use Expanded to give available space to text
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hotel Supreme',
                              style: textTheme.headlineSmall?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                              overflow:
                                  TextOverflow
                                      .ellipsis, // Add overflow handling
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '4140 Parker Rd. Allentown, Sylhet 3100',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                              overflow:
                                  TextOverflow
                                      .ellipsis, // Add overflow handling
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ), // Add some space between text and share button
                      Ink(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: () {},
                          splashColor: primaryColor.withValues(alpha: 0.2),
                          hoverColor: primaryColor.withValues(alpha: 0.1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 8.0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.share,
                                  size: 16,
                                  color: Colors.grey[700],
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  'Share',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _HotelAttributeChip(icon: Icons.king_bed, text: '2 Beds'),
                      _HotelAttributeChip(icon: Icons.bathtub, text: '1 Bath'),
                      _HotelAttributeChip(icon: Icons.group, text: '2 Guests'),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _TabButton(
                        text: 'Overview',
                        isSelected: _selectedTab == 'Overview',
                        onTap: () => setState(() => _selectedTab = 'Overview'),
                        primaryColor: primaryColor,
                        textTheme: textTheme,
                      ),
                      _TabButton(
                        text: 'Review',
                        isSelected: _selectedTab == 'Review',
                        onTap: () => setState(() => _selectedTab = 'Review'),
                        primaryColor: primaryColor,
                        textTheme: textTheme,
                      ),
                      _TabButton(
                        text: 'Location',
                        isSelected: _selectedTab == 'Location',
                        onTap: () => setState(() => _selectedTab = 'Location'),
                        primaryColor: primaryColor,
                        textTheme: textTheme,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                // Conditionally display content based on selected tab
                _selectedTab == 'Overview'
                    ? _OverviewContent(
                      isDescriptionExpanded: _isDescriptionExpanded,
                      primaryColor: primaryColor,
                      textTheme: textTheme,
                      onSeeMoreTap: () {
                        setState(() {
                          _isDescriptionExpanded = !_isDescriptionExpanded;
                        });
                      },
                    )
                    : _selectedTab == 'Review'
                    ? _ReviewSectionContent(
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                      colorScheme: colorScheme,
                    )
                    : _LocationContent(textTheme: textTheme),
                const SizedBox(height: 24.0), // Final padding before bottom bar
              ],
            ),
          ),
          // Fixed bottom bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              decoration: BoxDecoration(
                color: colorScheme.surface, // White background
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -3), // Shadow above the bar
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    // Use Expanded to give available space to text
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '27,200 BDT / Tax included',
                          style: textTheme.titleLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                          overflow:
                              TextOverflow.ellipsis, // Add overflow handling
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          '40% Money • 10 - 13 March',
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          overflow:
                              TextOverflow.ellipsis, // Add overflow handling
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16.0), // Space between text and button
                  SizedBox(
                    width: 120, // Fixed width for the button as per image
                    // Fixed height for the button
                    child: PrimaryTextButton(text: 'Reserve'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Separate widget for Overview content
class _OverviewContent extends StatelessWidget {
  final bool isDescriptionExpanded;
  final Color primaryColor;
  final TextTheme textTheme;
  final VoidCallback onSeeMoreTap;

  const _OverviewContent({
    required this.isDescriptionExpanded,
    required this.primaryColor,
    required this.textTheme,
    required this.onSeeMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8.0),
              Text.rich(
                TextSpan(
                  text:
                      'Featuring a garden, Hotel Supreme is located in Sylhet. With a fitness centre, the 3-star hotel has air-conditioned rooms with free WiFi. Each room features a flat-screen TV with cable channels and a private bathroom.',
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                  children: [
                    if (!isDescriptionExpanded)
                      TextSpan(
                        text: '... ',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    TextSpan(
                      text: isDescriptionExpanded ? '' : 'See more',
                      style: textTheme.bodyMedium?.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = onSeeMoreTap,
                    ),
                  ],
                ),
                maxLines: isDescriptionExpanded ? null : 3,
                overflow:
                    isDescriptionExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Amenities',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 4.0,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: const [
              _AmenityItem(icon: Icons.park_outlined, text: 'Outdoor Park'),
              _AmenityItem(
                icon: Icons.room_service_outlined,
                text: 'Room Service',
              ),
              _AmenityItem(
                icon: Icons.chair_alt_outlined,
                text: 'Fully-furnished',
              ),
              _AmenityItem(icon: Icons.deck_outlined, text: 'Terrace'),
              _AmenityItem(icon: Icons.bathtub_outlined, text: 'Bathtub'),
              _AmenityItem(
                icon: Icons.volume_mute_outlined,
                text: 'Quiet surroundings',
              ),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Gallery Images',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: _GalleryImage(
                  imageUrl: 'https://picsum.photos/400/300?random=1',
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    _GalleryImage(
                      imageUrl: 'https://picsum.photos/200/150?random=2',
                      height: 92,
                    ),
                    const SizedBox(height: 16.0),
                    _GalleryImage(
                      imageUrl: 'https://picsum.photos/200/150?random=3',
                      height: 92,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// New widget for Review Section
class _ReviewSectionContent extends StatelessWidget {
  final TextTheme textTheme;
  final Color primaryColor;
  final ColorScheme colorScheme;

  const _ReviewSectionContent({
    required this.textTheme,
    required this.primaryColor,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4.9',
                    style: textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 48,
                    ),
                  ),
                  Text(
                    'Excellent',
                    style: textTheme.titleMedium?.copyWith(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '(240 Reviews)',
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24.0),
              Expanded(
                child: Column(
                  children: [
                    _RatingBreakdownRow(
                      category: 'Excellent',
                      count: 167,
                      total: 240,
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                    ),
                    _RatingBreakdownRow(
                      category: 'Very Good',
                      count: 43,
                      total: 240,
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                    ),
                    _RatingBreakdownRow(
                      category: 'Average',
                      count: 14,
                      total: 240,
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                    ),
                    _RatingBreakdownRow(
                      category: 'Poor',
                      count: 10,
                      total: 240,
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                    ),
                    _RatingBreakdownRow(
                      category: 'Terrible',
                      count: 6,
                      total: 240,
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CategoryRatingBar(
                category: 'Cleanliness',
                rating: 4.5,
                primaryColor: primaryColor,
                textTheme: textTheme,
              ),
              _CategoryRatingBar(
                category: 'Location',
                rating: 5.0,
                primaryColor: primaryColor,
                textTheme: textTheme,
              ),
              _CategoryRatingBar(
                category: 'Service',
                rating: 4.8,
                primaryColor: primaryColor,
                textTheme: textTheme,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CategoryRatingBar(
                category: 'Value',
                rating: 4.9,
                primaryColor: primaryColor,
                textTheme: textTheme,
              ),
              _CategoryRatingBar(
                category: 'Sleep',
                rating: 4.1,
                primaryColor: primaryColor,
                textTheme: textTheme,
              ),
              _CategoryRatingBar(
                category: 'Room',
                rating: 4.6,
                primaryColor: primaryColor,
                textTheme: textTheme,
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          Text(
            'Reviews',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 200, // Height for horizontal review cards
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3, // Example reviews
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == 2 ? 0 : 16.0),
                  child: _ReviewCard(
                    reviewerName: 'Jim Majesky',
                    date: '12/01/2025',
                    reviewText:
                        'I love how they broke down their KYC and onboarding. I enjoyed the user experience, and even the service experience while...',
                    rating: 5,
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24.0),
          Center(
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit_outlined, color: primaryColor),
                label: Text(
                  'Write a review',
                  style: textTheme.bodyLarge?.copyWith(color: primaryColor),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      60,
                    ), // Set to 60 for pill shape
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// New widget for Location section (can be expanded later)
class _LocationContent extends StatelessWidget {
  final TextTheme textTheme;

  const _LocationContent({required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location Details',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16.0),
          // Placeholder for map or location details
          Container(
            height: 200,
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              'https://media.istockphoto.com/id/858885038/photo/airplane-fly-on-the-blue-painted-map.jpg?s=2048x2048&w=is&k=20&c=LRt0Jw0WNIrJkpJ8X5uorgCLtFJN0Px-nrw7l_Y6zh4=', // Example map image
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.grey[600]!,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    'Map Placeholder',
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
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

class _RatingBreakdownRow extends StatelessWidget {
  final String category;
  final int count;
  final int total;
  final TextTheme textTheme;
  final Color primaryColor;

  const _RatingBreakdownRow({
    required this.category,
    required this.count,
    required this.total,
    required this.textTheme,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 80, // Fixed width for category text
            child: Text(
              category,
              style: textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: count / total,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              minHeight: 8.0,
              borderRadius: BorderRadius.circular(
                4.0,
              ), // Rounded corners for progress bar
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            '$count',
            style: textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

class _CategoryRatingBar extends StatelessWidget {
  final String category;
  final double rating;
  final Color primaryColor;
  final TextTheme textTheme;

  const _CategoryRatingBar({
    required this.category,
    required this.rating,
    required this.primaryColor,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          category,
          style: textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 4.0),
        SizedBox(
          width: 80, // Fixed width for the bar
          child: LinearProgressIndicator(
            value: rating / 5.0, // Assuming max rating is 5
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            minHeight: 8.0,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          rating.toStringAsFixed(1),
          style: textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final String reviewerName;
  final String date;
  final String reviewText;
  final int rating;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _ReviewCard({
    required this.reviewerName,
    required this.date,
    required this.reviewText,
    required this.rating,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280, // Fixed width for review cards
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
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[200],
                child: Icon(Icons.person, color: Colors.grey[600], size: 20),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reviewerName,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    date,
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: index < rating ? Colors.amber : Colors.grey[400],
                size: 16,
              );
            }),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: Text(
              reviewText,
              style: textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Was this review helpful?',
                style: textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(width: 8.0),
              _SmallTextButton(
                text: 'No',
                onPressed: () {},
                textTheme: textTheme,
              ),
              const SizedBox(width: 4.0),
              _SmallTextButton(
                text: 'Yes',
                onPressed: () {},
                textTheme: textTheme,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SmallTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextTheme textTheme;

  const _SmallTextButton({
    required this.text,
    required this.onPressed,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        minimumSize: Size.zero, // Remove default minimum size
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(
        text,
        style: textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
      ),
    );
  }
}

class _HotelAttributeChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _HotelAttributeChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100], // Light grey background
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.grey[700]),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color primaryColor;
  final TextTheme textTheme;

  const _TabButton({
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            child: Text(
              text,
              style: textTheme.bodyLarge?.copyWith(
                color: isSelected ? primaryColor : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Container(
            height: 3.0,
            width: isSelected ? 40.0 : 0.0, // Underline for selected tab
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmenityItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _AmenityItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        const SizedBox(width: 8.0),
        Expanded(
          // Use Expanded to ensure text wraps within available space
          child: Text(
            text,
            style: textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _GalleryImage extends StatelessWidget {
  final String imageUrl;
  final double height;

  const _GalleryImage({
    required this.imageUrl,
    this.height = 200, // Default height for the main image
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        imageUrl,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder:
            (context, error, stackTrace) => Container(
              height: height,
              width: double.infinity,
              color: Colors.grey[300],
              child: Icon(
                Icons.image,
                size: height / 2,
                color: Colors.grey[600],
              ),
            ),
      ),
    );
  }
}
