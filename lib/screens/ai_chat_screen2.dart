import 'package:flutter/material.dart';
import 'dart:math';

class AIChatScreen2 extends StatefulWidget {
  const AIChatScreen2({super.key});

  @override
  State<AIChatScreen2> createState() => _AIChatScreen2State();
}

class _AIChatScreen2State extends State<AIChatScreen2> {
  final Set<String> _selectedSuggestions = {}; // To manage selected chips

  void _toggleSuggestion(String text) {
    setState(() {
      if (_selectedSuggestions.contains(text)) {
        _selectedSuggestions.remove(text);
      } else {
        _selectedSuggestions.add(text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.grey[100], // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.grey[100], // Match scaffold background
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor,
            size: 20,
          ), // Back icon with primary color and size 20
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'App AI',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 18, // Title font size 18
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_month, color: primaryColor, size: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: primaryColor, size: 20),
            onPressed: () {},
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 24.0,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .center, // Center the content horizontally
                mainAxisAlignment:
                    MainAxisAlignment
                        .center, // Center content vertically within available space
                children: [
                  const SizedBox(height: 150),
                  Text(
                    'What can i help with?',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center, // Center the text itself
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    // Center the Wrap widget (redundant with parent column's CrossAxisAlignment.center if Wrap takes full width, but good for safety)
                    child: Wrap(
                      spacing: 8.0, // horizontal spacing
                      runSpacing: 8.0, // vertical spacing
                      children: [
                        _SuggestionChip(
                          text: 'Trip Planning & Itineraries',
                          onTap:
                              () => _toggleSuggestion(
                                'Trip Planning & Itineraries',
                              ),
                          isActive: _selectedSuggestions.contains(
                            'Trip Planning & Itineraries',
                          ),
                          textTheme: textTheme,
                          primaryColor: primaryColor,
                        ),
                        _SuggestionChip(
                          text: 'Cost Optimization',
                          onTap: () => _toggleSuggestion('Cost Optimization'),
                          isActive: _selectedSuggestions.contains(
                            'Cost Optimization',
                          ),
                          textTheme: textTheme,
                          primaryColor: primaryColor,
                        ),
                        _SuggestionChip(
                          text: 'Filtering System',
                          onTap: () => _toggleSuggestion('Filtering System'),
                          isActive: _selectedSuggestions.contains(
                            'Filtering System',
                          ),
                          textTheme: textTheme,
                          primaryColor: primaryColor,
                        ),
                        _SuggestionChip(
                          text: 'Travel Safety & Security',
                          onTap:
                              () =>
                                  _toggleSuggestion('Travel Safety & Security'),
                          isActive: _selectedSuggestions.contains(
                            'Travel Safety & Security',
                          ),
                          textTheme: textTheme,
                          primaryColor: primaryColor,
                        ),
                        _SuggestionChip(
                          text: 'Eco-Friendly Travel',
                          onTap: () => _toggleSuggestion('Eco-Friendly Travel'),
                          isActive: _selectedSuggestions.contains(
                            'Eco-Friendly Travel',
                          ),
                          textTheme: textTheme,
                          primaryColor: primaryColor,
                        ),
                        _SuggestionChip(
                          text: 'AI-Powered Travel Reviews',
                          onTap:
                              () => _toggleSuggestion(
                                'AI-Powered Travel Reviews',
                              ),
                          isActive: _selectedSuggestions.contains(
                            'AI-Powered Travel Reviews',
                          ),
                          textTheme: textTheme,
                          primaryColor: primaryColor,
                        ),
                        _SuggestionChip(
                          text: 'More',
                          onTap: () => _toggleSuggestion('More'),
                          isActive: _selectedSuggestions.contains('More'),
                          textTheme: textTheme,
                          primaryColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Audio recording bar at the bottom
          _AudioRecordingBar(
            primaryColor: primaryColor,
            colorScheme: colorScheme,
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isActive; // Added isActive property
  final TextTheme textTheme;
  final Color primaryColor; // Added primaryColor for styling

  const _SuggestionChip({
    required this.text,
    required this.onTap,
    this.isActive = false, // Default to false
    required this.textTheme,
    required this.primaryColor,
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
                  ? primaryColor.withOpacity(0.1)
                  : Colors.white, // Background changes based on isActive
          borderRadius: BorderRadius.circular(20.0), // Increased border radius
          border: Border.all(
            color:
                isActive
                    ? primaryColor.withOpacity(0.3)
                    : Colors.grey[300]!,
            width: 1.0,
          ),
        ),
        child: Text(
          text,
          style: textTheme.bodySmall?.copyWith(
            color:
                isActive
                    ? primaryColor
                    : Colors.grey[700], // Text color changes based on isActive
            fontWeight:
                isActive
                    ? FontWeight.bold
                    : FontWeight
                        .normal, // Font weight changes based on isActive
          ),
        ),
      ),
    );
  }
}

class _AudioRecordingBar extends StatefulWidget {
  final Color primaryColor;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _AudioRecordingBar({
    required this.primaryColor,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  State<_AudioRecordingBar> createState() => _AudioRecordingBarState();
}

class _AudioRecordingBarState extends State<_AudioRecordingBar> {
  // This value would typically come from an audio recording process
  // For UI demonstration, we'll keep it static or animate it if needed.
  // Represents the "progress" of the audio visualization, 0.0 to 1.0.
  double _audioProgress = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: widget.colorScheme.surface, // White background
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3), // Shadow above the bar
          ),
        ],
      ),
      child: Row(
        children: [
          // Trash Can Icon
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.grey[700]),
              onPressed: () {
                // Handle delete action
              },
            ),
          ),
          const SizedBox(width: 12.0),
          // Audio Waveform and Time
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 48, // Fixed height for the bar
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background for the waveform
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomPaint(
                      size: Size(double.infinity, 30), // Height for the waveform inside the container
                      painter: _WaveAudioBarPainter(
                        primaryColor: widget.primaryColor,
                        inactiveColor: Colors.grey[400]!,
                        progress: _audioProgress,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '0:06', // Static time for now
                    style: widget.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          // Up Arrow Icon (Send/Upload)
          Container(
            decoration: BoxDecoration(
              color: widget.primaryColor,
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_upward, color: widget.colorScheme.onPrimary),
              onPressed: () {
                // Handle send/upload action
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _WaveAudioBarPainter extends CustomPainter {
  final Color primaryColor;
  final Color inactiveColor;
  final double progress; // 0.0 to 1.0 to simulate playback progress

  _WaveAudioBarPainter({
    required this.primaryColor,
    required this.inactiveColor,
    this.progress = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    const int numBars = 30; // Number of vertical bars
    final double barWidth = (width / numBars) * 0.7; // Width of each bar
    final double gapWidth = (width / numBars) * 0.3; // Gap between bars

    final Random random = Random(0); // Use a fixed seed for consistent pattern

    for (int i = 0; i < numBars; i++) {
      final double x = i * (barWidth + gapWidth);
      // Generate a random height, scaled to look like an audio waveform
      final double barHeight = (0.3 + random.nextDouble() * 0.7) * height; // Vary height between 30% and 100% of available height

      // Determine bar color based on progress
      final double currentProgressPx = progress * width;
      final Color barColor = (x < currentProgressPx) ? primaryColor : inactiveColor;

      final Paint paint = Paint()..color = barColor;

      // Draw the bar. Rect.fromLTWH(left, top, width, height)
      // Top calculated from bottom, so it grows upwards.
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, height - barHeight, barWidth, barHeight),
          const Radius.circular(2), // Slight rounded corners for bars
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WaveAudioBarPainter oldDelegate) {
    return oldDelegate.primaryColor != primaryColor ||
        oldDelegate.inactiveColor != inactiveColor ||
        oldDelegate.progress != progress;
  }
}