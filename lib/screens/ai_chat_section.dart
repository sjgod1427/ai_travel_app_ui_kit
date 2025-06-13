import 'package:ai_travel_app_ui_kit/screens/date_timeline_screen.dart';
import 'package:flutter/material.dart';

class AIChatSection extends StatefulWidget {
  const AIChatSection({super.key});

  @override
  State<AIChatSection> createState() => _AIChatSectionState();
}

class _AIChatSectionState extends State<AIChatSection> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white, // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.white, // Match scaffold background
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: primaryColor, size: 20),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'App AI',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_month, color: primaryColor, size: 20),
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => DateTimelineScreen(),
                ),
              );
            },
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
            child: ListView(
              reverse: true, // Make messages start from bottom
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 24.0,
                bottom: 24.0,
              ), // Added bottom padding here
              children:
                  [
                    // Display messages in reverse order of how they appear in the image
                    // Latest message (from user) first, then AI's response, then audio.
                    _UserMessageBubble(
                      text:
                          'Suggest me some hotels with good rating minimum 4 star, under 20,000 BDT Budget, Wifi Available, Complimentary Breakfast Added, Location will be near Mirabazar Centar.',
                      textTheme: textTheme,
                      primaryColor: primaryColor,
                    ),
                    const SizedBox(height: 16.0),
                    _AIMessageBubble(
                      text:
                          'Got it! Searching for hotels in Sylhet from March 20 for three nights. What\'s your budget range?',
                      textTheme: textTheme,
                      colorScheme: colorScheme,
                    ),
                    const SizedBox(height: 16.0),
                    // Audio message player (will be at the top of the list, thus bottom of screen)
                    Align(
                      alignment: Alignment.centerRight,
                      child: _AudioMessagePlayer(primaryColor: primaryColor),
                    ),
                  ].reversed.toList(), // Reverse the list to match image order from top-to-bottom
            ),
          ),
          // Message input bar at the bottom
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            color: colorScheme.surface,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add, color: Colors.grey[600]),
                  onPressed: () {},
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message...',
                      hintStyle: textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[500],
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 16.0,
                        top: 12.0,
                        bottom: 12.0,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(Icons.mic, color: Colors.grey[600]),
                      ),
                    ),
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[850],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: colorScheme.onPrimary),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AudioMessagePlayer extends StatefulWidget {
  final Color primaryColor;
  const _AudioMessagePlayer({required this.primaryColor});

  @override
  State<_AudioMessagePlayer> createState() => _AudioMessagePlayerState();
}

class _AudioMessagePlayerState extends State<_AudioMessagePlayer> {
  double _currentSliderValue = 0.5; // Initial value for the slider
  bool _isPlaying = false; // State for play/pause button

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color:
            widget
                .primaryColor, // Use primary color for audio message background
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: EdgeInsets.zero, // Remove default IconButton padding
            constraints:
                const BoxConstraints(), // Remove default IconButton constraints
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              setState(() {
                _isPlaying = !_isPlaying; // Toggle play/pause state
              });
            },
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 2.0,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 6.0,
                ),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 10.0,
                ),
                activeTrackColor: Colors.white, // White for active part
                inactiveTrackColor: Colors.white.withValues(
                  alpha: 0.5,
                ), // Lighter white for inactive
                thumbColor: Colors.white, // White thumb
                overlayColor: Colors.white.withValues(alpha: 0.2),
              ),
              child: Slider(
                value: _currentSliderValue,
                min: 0.0,
                max: 1.0,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            '0:21',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _AIMessageBubble extends StatelessWidget {
  final String text;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _AIMessageBubble({
    required this.text,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, color: Colors.grey[600], size: 20),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: colorScheme.surface, // White background for AI message
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(4.0),
              ),
            ),
            child: Text(
              text,
              style: textTheme.bodyMedium?.copyWith(color: Colors.grey[800]),
            ),
          ),
        ),
      ],
    );
  }
}

class _UserMessageBubble extends StatelessWidget {
  final String text;
  final TextTheme textTheme;
  final Color primaryColor;

  const _UserMessageBubble({
    required this.text,
    required this.textTheme,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(left: 50.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: primaryColor, // Use primary color for user message background
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(4.0),
          ),
        ),
        child: Text(
          text,
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ), // White text on primary background
        ),
      ),
    );
  }
}
