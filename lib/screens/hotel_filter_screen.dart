import 'package:ai_travel_app_ui_kit/screens/book_hotel_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/explore_hotels_screen.dart';
import 'package:flutter/material.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart';

class HotelFilterScreen extends StatefulWidget {
  const HotelFilterScreen({super.key});

  @override
  State<HotelFilterScreen> createState() => _HotelFilterScreenState();
}

class _HotelFilterScreenState extends State<HotelFilterScreen> {
  String? _sortBySelection = 'Recommended';
  RangeValues _priceRange = const RangeValues(10000, 20000);
  final TextEditingController _fromPriceController = TextEditingController(
    text: '10,000 BDT',
  );
  final TextEditingController _toPriceController = TextEditingController(
    text: '20,000 BDT',
  );

  final Map<String, bool> _popularFilters = {
    'Pool': true,
    'Pet Friendly': false,
    'Breakfast Included': true,
    'Reserve Now, Pay Later': true,
  };

  int _selectedStarRating = 4; // Default to 4 stars

  final Map<String, bool> _accessibilityOptions = {
    'Elevator': true,
    'Accessible Bathroom': false,
    'In-room Services': true,
    'Food Delivery Service Friendly': true,
  };

  int? _selectedBedrooms = 4; // Default to 4

  final Map<String, bool> _travelersExperience = {
    'Eco-certified': true,
    'Business Friendly': false,
    'Guest Friendly': false,
  };

  @override
  void dispose() {
    _fromPriceController.dispose();
    _toPriceController.dispose();
    super.dispose();
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: primaryColor, size: 20),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Book a Hotel',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _sortBySelection = 'Recommended';
                _priceRange = const RangeValues(10000, 20000);
                _fromPriceController.text = '10,000 BDT';
                _toPriceController.text = '20,000 BDT';
                _popularFilters.updateAll(
                  (key, value) => false,
                ); // Reset all to false
                _popularFilters['Pool'] =
                    true; // Set default active as per image
                _popularFilters['Breakfast Included'] = true;
                _popularFilters['Reserve Now, Pay Later'] = true;

                _selectedStarRating = 4;
                _accessibilityOptions.updateAll((key, value) => false);
                _accessibilityOptions['Elevator'] = true;
                _accessibilityOptions['In-room Services'] = true;
                _accessibilityOptions['Food Delivery Service Friendly'] = true;

                _selectedBedrooms = 4;
                _travelersExperience.updateAll((key, value) => false);
                _travelersExperience['Eco-certified'] = true;
              });
            },
            child: Text(
              'Clear',
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
            ),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                _buildSectionTitle(context, 'Sort By'),
                ...['Recommended', 'Popularity', 'Rating', 'Nearby'].map((
                  option,
                ) {
                  return RadioListTile<String>(
                    title: Text(
                      option,
                      style: textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                    value: option,
                    groupValue: _sortBySelection,
                    onChanged: (String? value) {
                      setState(() {
                        _sortBySelection = value;
                      });
                    },
                    activeColor: primaryColor,
                    controlAffinity: ListTileControlAffinity.trailing,
                  );
                }),
                Divider(
                  color: Colors.grey.withValues(alpha: 0.5),
                  indent: 24,
                  endIndent: 24,
                  thickness: 0.5,
                ),
                _buildSectionTitle(context, 'Pricing'),
                const SizedBox(height: 16.0),
                // Price Range Histogram with Wave Pattern
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 50, // Height for the wave pattern
                    child: CustomPaint(
                      painter: _WaveHistogramPainter(
                        primaryColor: primaryColor,
                        inactiveColor: primaryColor.withValues(alpha: 0.2),
                        currentRange: _priceRange,
                        minPrice: 0,
                        maxPrice: 30000,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0), // Space between chart and slider
                RangeSlider(
                  values: _priceRange,
                  min: 0,
                  max: 30000,
                  divisions: 300,
                  labels: RangeLabels(
                    _priceRange.start.round().toString(),
                    _priceRange.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _priceRange = values;
                      _fromPriceController.text =
                          '${values.start.round()},000 BDT';
                      _toPriceController.text = '${values.end.round()},000 BDT';
                    });
                  },
                  activeColor: primaryColor,
                  inactiveColor: primaryColor.withValues(alpha: 0.2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _fromPriceController,
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                            ),
                          ),
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '-',
                        style: textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          controller: _toPriceController,
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                            ),
                          ),
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.withValues(alpha: 0.5),
                  thickness: 0.5,
                  indent: 24,
                  endIndent: 24,
                  height: 40,
                ),

                _buildSectionTitle(context, 'Popular Filters'),
                ..._popularFilters.keys.map((filter) {
                  return CheckboxListTile(
                    title: Text(
                      filter,
                      style: textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                    value: _popularFilters[filter],
                    onChanged: (bool? value) {
                      setState(() {
                        _popularFilters[filter] = value!;
                      });
                    },
                    activeColor: primaryColor,
                    checkColor: colorScheme.onPrimary,
                    controlAffinity: ListTileControlAffinity.trailing,
                  );
                }),
                Divider(
                  color: Colors.grey.withValues(alpha: 0.5),
                  indent: 24,
                  endIndent: 24,
                  thickness: 0.5,
                ),

                _buildSectionTitle(context, 'Filter by minimum star rating'),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // Distribute evenly
                    children: List.generate(5, (index) {
                      final star = index + 1;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedStarRating = star;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            color:
                                _selectedStarRating >= star
                                    ? primaryColor.withValues(alpha: 0.1)
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color:
                                  _selectedStarRating >= star
                                      ? primaryColor.withValues(alpha: 0.3)
                                      : Colors.grey[300]!,
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '$star',
                                style: textTheme.bodySmall?.copyWith(
                                  color:
                                      _selectedStarRating >= star
                                          ? primaryColor
                                          : Colors.grey[700],
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Icon(
                                Icons.star,
                                size: 16,
                                color:
                                    _selectedStarRating >= star
                                        ? primaryColor
                                        : Colors.grey[400],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Divider(
                  color: Colors.grey.withValues(alpha: 0.5),
                  thickness: 0.5,
                  indent: 24,
                  endIndent: 24,
                  height: 40,
                ),

                _buildSectionTitle(context, 'Accessibility'),
                ..._accessibilityOptions.keys.map((option) {
                  return CheckboxListTile(
                    title: Text(
                      option,
                      style: textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                    value: _accessibilityOptions[option],
                    onChanged: (bool? value) {
                      setState(() {
                        _accessibilityOptions[option] = value!;
                      });
                    },
                    activeColor: primaryColor,
                    checkColor: colorScheme.onPrimary,
                    controlAffinity: ListTileControlAffinity.trailing,
                  );
                }),
                Divider(
                  color: Colors.grey.withValues(alpha: 0.5),
                  indent: 24,
                  endIndent: 24,
                  thickness: 0.5,
                ),

                _buildSectionTitle(context, 'Number of Bedrooms'),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        final count = index + 1;
                        final String displayText = count == 5 ? '5+' : '$count';
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedBedrooms = count;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 10.0,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              color:
                                  _selectedBedrooms == count
                                      ? primaryColor.withValues(alpha: 0.1)
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color:
                                    _selectedBedrooms == count
                                        ? primaryColor.withValues(alpha: 0.3)
                                        : Colors.grey[300]!,
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              displayText,
                              style: textTheme.bodySmall?.copyWith(
                                color:
                                    _selectedBedrooms == count
                                        ? primaryColor
                                        : Colors.grey[700],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey.withValues(alpha: 0.5),
                  thickness: 0.5,
                  indent: 24,
                  endIndent: 24,
                  height: 40,
                ),

                _buildSectionTitle(context, 'Travelers experience'),
                ..._travelersExperience.keys.map((option) {
                  return CheckboxListTile(
                    title: Text(
                      option,
                      style: textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                    value: _travelersExperience[option],
                    onChanged: (bool? value) {
                      setState(() {
                        _travelersExperience[option] = value!;
                      });
                    },
                    activeColor: primaryColor,
                    checkColor: colorScheme.onPrimary,
                    controlAffinity: ListTileControlAffinity.trailing,
                  );
                }),
                const SizedBox(height: 40.0), // Padding before button
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 24.0,
            ),
            child: PrimaryTextButton(
              text: 'Done',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
      child: Text(
        title,
        style: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}

class _WaveHistogramPainter extends CustomPainter {
  final Color primaryColor;
  final Color inactiveColor;
  final RangeValues currentRange;
  final double minPrice;
  final double maxPrice;

  _WaveHistogramPainter({
    required this.primaryColor,
    required this.inactiveColor,
    required this.currentRange,
    required this.minPrice,
    required this.maxPrice,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final double segmentWidth = width / 6; // Dividing into 6 main segments

    // Define the points for the wave pattern.
    // Each pair (x,y) defines a point. y is scaled by height later.
    // The pattern is a series of upward and downward V-shapes,
    // with transparency from the ends towards the center.
    // The active range will be fully opaque.

    final List<Offset> points = [];

    // Helper to add a V-shape.
    // xOffset: starting x for the segment
    // startHeight: height factor for the start of the segment (0.0 to 1.0)
    // midHeight: height factor for the middle of the segment (0.0 to 1.0)
    // endHeight: height factor for the end of the segment (0.0 to 1.0)
    void addWaveSegment(
      double xOffset,
      double startHeight,
      double midHeight,
      double endHeight,
    ) {
      points.add(Offset(xOffset, startHeight * height));
      points.add(Offset(xOffset + segmentWidth / 2, midHeight * height));
      points.add(Offset(xOffset + segmentWidth, endHeight * height));
    }

    // First segment (leftmost, somewhat transparent)
    addWaveSegment(0, 0.4, 0.8, 0.4);

    // Second segment (more opaque)
    addWaveSegment(segmentWidth, 0.4, 0.9, 0.5);

    // Third segment (fully opaque, peak range)
    addWaveSegment(segmentWidth * 2, 0.5, 1.0, 0.6);

    // Fourth segment (fully opaque, peak range)
    addWaveSegment(segmentWidth * 3, 0.6, 1.0, 0.5);

    // Fifth segment (more opaque)
    addWaveSegment(segmentWidth * 4, 0.5, 0.9, 0.4);

    // Sixth segment (rightmost, somewhat transparent)
    addWaveSegment(segmentWidth * 5, 0.4, 0.8, 0.4);

    // Adjust y-coordinates to be relative to the bottom of the canvas
    // and scale to height.
    final List<Offset> adjustedPoints =
        points.map((p) => Offset(p.dx, height - p.dy)).toList();

    final Path path = Path();
    if (adjustedPoints.isNotEmpty) {
      path.moveTo(adjustedPoints[0].dx, adjustedPoints[0].dy);
      for (int i = 1; i < adjustedPoints.length; i++) {
        path.lineTo(adjustedPoints[i].dx, adjustedPoints[i].dy);
      }
    }

    // We need to close the path to create a filled shape for the histogram.
    // We'll add points to the bottom-right and bottom-left to close the shape.
    path.lineTo(width, height); // Go to bottom-right
    path.lineTo(0, height); // Go to bottom-left
    path.close(); // Close the path to the starting point

    // Calculate the percentage of the current range within the total range
    final double rangeStartPercentage =
        (currentRange.start - minPrice) / (maxPrice - minPrice);
    final double rangeEndPercentage =
        (currentRange.end - minPrice) / (maxPrice - minPrice);

    // Calculate the pixel positions for the active range on the canvas
    final double activeStartPx = width * rangeStartPercentage;
    final double activeEndPx = width * rangeEndPercentage;

    // Create a linear gradient for the active part
    final activePaint =
        Paint()
          ..shader = LinearGradient(
            colors: [
              primaryColor.withValues(alpha: 0.5),
              primaryColor,
            ], // Fading effect for active bars
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ).createShader(Rect.fromLTWH(0, 0, width, height));

    // Create a linear gradient for the inactive parts (with more transparency)
    final inactivePaint =
        Paint()
          ..shader = LinearGradient(
            colors: [
              inactiveColor.withValues(alpha: 0.5),
              inactiveColor.withValues(alpha: 0.2),
            ], // More faded inactive bars
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ).createShader(Rect.fromLTWH(0, 0, width, height));

    // Draw the full path with the inactive gradient first
    canvas.drawPath(path, inactivePaint);

    // Now, clip and draw the active part over it
    canvas.save();
    canvas.clipRect(
      Rect.fromLTWH(activeStartPx, 0, activeEndPx - activeStartPx, height),
    );
    canvas.drawPath(path, activePaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _WaveHistogramPainter oldDelegate) {
    // Only repaint if the current range changes
    return oldDelegate.currentRange != currentRange;
  }
}
