import 'package:flutter/material.dart';

class AppAIScreen extends StatefulWidget {
  const AppAIScreen({super.key});

  @override
  State<AppAIScreen> createState() => _AppAIScreenState();
}

class _AppAIScreenState extends State<AppAIScreen> {
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
      backgroundColor: Colors.white, // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Match scaffold background
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
            icon: Icon(
              Icons.calendar_month,
              color: primaryColor,
              size: 20,
            ), // Calendar icon with primary color and size 20
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: primaryColor,
              size: 20,
            ), // More icon with primary color and size 20
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
                  SizedBox(height: 150),
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
          // Message input bar at the bottom
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            color: colorScheme.surface, // White background for the input bar
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
                      fillColor: Colors.grey[200], // Light grey background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ), // More rounded corners
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 16.0,
                        top: 12.0,
                        bottom: 12.0,
                      ), // Removed original right padding here
                      suffixIcon: Padding(
                        // Wrapped mic icon in Padding
                        padding: const EdgeInsets.only(
                          right: 16.0,
                        ), // Added right padding
                        child: Icon(
                          Icons.mic,
                          color: Colors.grey[600],
                        ), // Microphone icon
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
                    color: primaryColor, // Use primaryColor for send button
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: colorScheme.onPrimary,
                    ), // White send icon
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
                  ? primaryColor.withValues(alpha: 0.1)
                  : Colors.white, // Background changes based on isActive
          borderRadius: BorderRadius.circular(20.0), // Increased border radius
          border: Border.all(
            color:
                isActive
                    ? primaryColor.withValues(alpha: 0.3)
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
