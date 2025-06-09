import 'package:flutter/material.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart';

class DateTimelineScreen extends StatefulWidget {
  const DateTimelineScreen({super.key});

  @override
  State<DateTimelineScreen> createState() => _DateTimelineScreenState();
}

class _DateTimelineScreenState extends State<DateTimelineScreen> {
  DateTime _focusedDay = DateTime.now(); // Current month for display
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  @override
  void initState() {
    super.initState();
    // Initialize to March 2025 as per image reference
    _focusedDay = DateTime(2025, 3, 1);
    // Initialize selected dates as per image reference
    _selectedStartDate = DateTime(2025, 3, 10);
    _selectedEndDate = DateTime(2025, 3, 13);
  }

  void _onDaySelected(DateTime selectedDay) {
    setState(() {
      if (_selectedStartDate == null || _selectedEndDate != null) {
        // No dates selected, or a range is already selected (start a new one)
        _selectedStartDate = selectedDay;
        _selectedEndDate = null;
      } else if (selectedDay.isBefore(_selectedStartDate!)) {
        // Selected a day before the start date, make it the new start date
        _selectedEndDate = _selectedStartDate;
        _selectedStartDate = selectedDay;
      } else if (selectedDay.isAfter(_selectedStartDate!)) {
        // Selected a day after the start date, make it the end date
        _selectedEndDate = selectedDay;
      } else {
        // Tapped the same start date, deselect
        _selectedStartDate = null;
        _selectedEndDate = null;
      }
    });
  }

  bool _isDaySelected(DateTime day) {
    if (_selectedStartDate == null) return false;
    if (_selectedEndDate == null) {
      return day.year == _selectedStartDate!.year &&
          day.month == _selectedStartDate!.month &&
          day.day == _selectedStartDate!.day;
    }
    return (day.isAtSameMomentAs(_selectedStartDate!) ||
            day.isAtSameMomentAs(_selectedEndDate!)) ||
        (day.isAfter(_selectedStartDate!) && day.isBefore(_selectedEndDate!));
  }

  bool _isRangeMiddle(DateTime day) {
    if (_selectedStartDate == null || _selectedEndDate == null) return false;
    return day.isAfter(_selectedStartDate!) && day.isBefore(_selectedEndDate!);
  }

  void _goToPreviousMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color primaryColor = Theme.of(context).primaryColor;

    // Determine the first day of the month and its weekday
    final DateTime firstDayOfMonth = DateTime(
      _focusedDay.year,
      _focusedDay.month,
      1,
    );
    final int daysInMonth =
        DateTime(_focusedDay.year, _focusedDay.month + 1, 0).day;
    final int blankDays =
        firstDayOfMonth.weekday %
        7; // Sunday = 0, Monday = 1, ..., Saturday = 6

    return Scaffold(
      backgroundColor: Colors.white, // Light grey background matching the image
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Match scaffold background
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor,
            size: 20,
          ), // Back arrow icon with size 20 and primary color
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
        title: Text(
          'Date & Timeline',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 18, // Title font size 18
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            Text(
              'Select Date & Stay Timeline?',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600, // Semi-bold
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: colorScheme.surface, // White background
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 5), // Subtle shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Month Navigation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                          color: Colors.grey[700],
                        ),
                        onPressed: _goToPreviousMonth,
                      ),
                      Text(
                        '${_focusedDay.monthName} ${_focusedDay.year}',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey[700],
                        ),
                        onPressed: _goToNextMonth,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Weekdays
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _WeekdayText('Sun'),
                      _WeekdayText('Mon'),
                      _WeekdayText('Tue'),
                      _WeekdayText('Wed'),
                      _WeekdayText('Thu'),
                      _WeekdayText('Fri'),
                      _WeekdayText('Sat'),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  // Days Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          childAspectRatio: 1.0,
                        ),
                    itemCount:
                        blankDays +
                        daysInMonth +
                        (7 - ((blankDays + daysInMonth) % 7)) %
                            7, // Ensure full weeks
                    itemBuilder: (context, index) {
                      if (index < blankDays) {
                        return const SizedBox.shrink(); // Empty cells for preceding days
                      }
                      final int dayNumber = index - blankDays + 1;
                      if (dayNumber > daysInMonth) {
                        return const SizedBox.shrink(); // Empty cells for succeeding days
                      }

                      final DateTime day = DateTime(
                        _focusedDay.year,
                        _focusedDay.month,
                        dayNumber,
                      );
                      final bool isSelected = _isDaySelected(day);
                      final bool isRangeMiddle = _isRangeMiddle(day);
                      final bool isStartDate =
                          _selectedStartDate != null &&
                          day.isAtSameMomentAs(_selectedStartDate!);
                      final bool isEndDate =
                          _selectedEndDate != null &&
                          day.isAtSameMomentAs(_selectedEndDate!);

                      Color textColor = Colors.grey[800]!;
                      Color backgroundColor = Colors.transparent;
                      BorderRadius borderRadius = BorderRadius.circular(
                        8.0,
                      ); // Default radius

                      if (isSelected) {
                        if (isStartDate || isEndDate) {
                          backgroundColor =
                              primaryColor; // Use primaryColor for start/end
                          textColor =
                              colorScheme
                                  .onPrimary; // Use onPrimary for text on primary color
                          if (isStartDate && isEndDate) {
                            borderRadius = BorderRadius.circular(8.0);
                          } else if (isStartDate && _selectedEndDate != null) {
                            borderRadius = const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                            );
                          } else if (isEndDate && _selectedStartDate != null) {
                            borderRadius = const BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            );
                          } else {
                            borderRadius = BorderRadius.circular(8.0);
                          }
                        } else if (isRangeMiddle) {
                          backgroundColor = primaryColor.withValues(
                            alpha: 0.1,
                          ); // Lighter primary color for middle
                          textColor =
                              primaryColor; // Primary color for text in middle
                          borderRadius =
                              BorderRadius
                                  .zero; // No specific rounding for middle
                        }
                      }

                      return GestureDetector(
                        onTap: () => _onDaySelected(day),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 1.0),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: borderRadius,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$dayNumber',
                            style: textTheme.bodyMedium?.copyWith(
                              color: textColor,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight
                                          .normal, // Bold for all selected dates
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Spacer(), // Pushes the button to the bottom
            PrimaryTextButton(text: 'Next', onPressed: () {}),
            const SizedBox(height: 40.0), // Bottom padding
          ],
        ),
      ),
    );
  }
}

class _WeekdayText extends StatelessWidget {
  final String text;
  const _WeekdayText(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

extension on DateTime {
  String get monthName {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
