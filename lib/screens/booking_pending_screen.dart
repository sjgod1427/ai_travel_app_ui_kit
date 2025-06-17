import 'package:ai_travel_app_ui_kit/screens/hotel_details_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/order_status_screen.dart';
import 'package:flutter/material.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart';

class BookingPendingScreen extends StatelessWidget {
  const BookingPendingScreen({super.key});

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
          icon: Icon(Icons.close, color: primaryColor, size: 20), // Close icon
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Request to book',
          style: textTheme.titleLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 32.0),
                  Text(
                    'Your stay is pending',
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    'Your request is on hold—awaiting confirmation from the host or service provider. We\'ll notify you as soon as there\'s an update.',
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24.0),
                  _HotelDetailCard(
                    hotelName: 'Hotel Supreme',
                    address: '4140 Parker Rd. Allentown, Sylhet 3100',
                    pricePerDay: '\$126',
                    rating: '4.9 (234 reviews)',
                    imageUrl:
                        'https://picsum.photos/400/250?random=bookingpending',
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(height: 40.0), // Space before bottom button
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 24.0,
            ),
            child: PrimaryTextButton(text: 'Got It', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

class _HotelDetailCard extends StatefulWidget {
  final String hotelName;
  final String address;
  final String pricePerDay;
  final String rating;
  final String imageUrl;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final VoidCallback? onTap;

  const _HotelDetailCard({
    required this.hotelName,
    required this.address,
    required this.pricePerDay,
    required this.rating,
    required this.imageUrl,
    required this.textTheme,
    required this.colorScheme,
    this.onTap,
  });

  @override
  State<_HotelDetailCard> createState() => _HotelDetailCardState();
}

class _HotelDetailCardState extends State<_HotelDetailCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      // Needed to show ripple
      color: Colors.transparent,
      child: InkWell(
        onTap:
            widget.onTap ??
            () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => HotelDetailsScreen(),
                ),
              );
            },
        borderRadius: BorderRadius.circular(15.0),
        child: Ink(
          decoration: BoxDecoration(
            color: widget.colorScheme.surface,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
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
                              size: 80,
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
                  const Icon(Icons.star, color: Colors.amber, size: 16),
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
