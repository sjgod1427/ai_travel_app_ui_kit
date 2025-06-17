import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart';
import 'package:flutter/material.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  String? _selectedCountryCode;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredCountries = [];

  final List<Map<String, String>> _allCountries = [
    {'name': 'Afghanistan', 'code': 'AF', 'flag': 'https://picsum.photos/30/30?random=af'},
    {'name': 'Albania', 'code': 'AL', 'flag': 'https://picsum.photos/30/30?random=al'},
    {'name': 'Algeria', 'code': 'DZ', 'flag': 'https://picsum.photos/30/30?random=dz'},
    {'name': 'Andorra', 'code': 'AD', 'flag': 'https://picsum.photos/30/30?random=ad'},
    {'name': 'Angola', 'code': 'AO', 'flag': 'https://picsum.photos/30/30?random=ao'},
    {'name': 'Argentina', 'code': 'AR', 'flag': 'https://picsum.photos/30/30?random=ar'},
    {'name': 'Armenia', 'code': 'AM', 'flag': 'https://picsum.photos/30/30?random=am'},
    {'name': 'Australia', 'code': 'AU', 'flag': 'https://picsum.photos/30/30?random=au'},
    {'name': 'Austria', 'code': 'AT', 'flag': 'https://picsum.photos/30/30?random=at'},
    {'name': 'Azerbaijan', 'code': 'AZ', 'flag': 'https://picsum.photos/30/30?random=az'},
    {'name': 'Bahamas', 'code': 'BS', 'flag': 'https://picsum.photos/30/30?random=bs'},
    {'name': 'Bahrain', 'code': 'BH', 'flag': 'https://picsum.photos/30/30?random=bh'},
    {'name': 'Bangladesh', 'code': 'BD', 'flag': 'https://picsum.photos/30/30?random=bd'},
    {'name': 'Barbados', 'code': 'BB', 'flag': 'https://picsum.photos/30/30?random=bb'},
    {'name': 'Belarus', 'code': 'BY', 'flag': 'https://picsum.photos/30/30?random=by'},
    {'name': 'Belgium', 'code': 'BE', 'flag': 'https://picsum.photos/30/30?random=be'},
    {'name': 'Belize', 'code': 'BZ', 'flag': 'https://picsum.photos/30/30?random=bz'},
    {'name': 'Benin', 'code': 'BJ', 'flag': 'https://picsum.photos/30/30?random=bj'},
  ];

  @override
  void initState() {
    super.initState();
    _filteredCountries = _allCountries;
    _searchController.addListener(_filterCountries);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCountries);
    _searchController.dispose();
    super.dispose();
  }

  void _filterCountries() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCountries = _allCountries.where((country) {
        return country['name']!.toLowerCase().contains(query) ||
               country['code']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[800], // Dark grey for back arrow
            size: 24, // Consistent icon size
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Select Your Country',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800], // Dark grey for title
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[500],
                ),
                filled: true,
                fillColor: Colors.grey[100], // Light grey background
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: Icon(Icons.search, color: Colors.grey[600]), // Grey search icon
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), // More rounded corners
                  borderSide: BorderSide.none, // No border line
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[850]),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemCount: _filteredCountries.length,
              itemBuilder: (context, index) {
                final country = _filteredCountries[index];
                final isSelected = _selectedCountryCode == country['code'];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _CountryListItem(
                    countryName: country['name']!,
                    countryCode: country['code']!,
                    flagUrl: country['flag']!,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        _selectedCountryCode = country['code'];
                      });
                    },
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                    primaryColor: primaryColor,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: PrimaryTextButton(
              text: 'Continue',
              onPressed: _selectedCountryCode != null
                  ? () {
                      // Handle continue action, e.g., navigate to next screen
                      print('Selected country: $_selectedCountryCode');
                    }
                  : null, // Disable button if no country is selected
            ),
          ),
        ],
      ),
    );
  }
}

class _CountryListItem extends StatelessWidget {
  final String countryName;
  final String countryCode;
  final String flagUrl;
  final bool isSelected;
  final VoidCallback onTap;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final Color primaryColor;

  const _CountryListItem({
    required this.countryName,
    required this.countryCode,
    required this.flagUrl,
    required this.isSelected,
    required this.onTap,
    required this.textTheme,
    required this.colorScheme,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Make Material transparent
      child: Ink(
        decoration: BoxDecoration(
          color: colorScheme.surface, // White background
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: isSelected ? 1.5 : 1.0,
            color: isSelected ? primaryColor : Colors.grey[200]!, // Border color based on selection
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15.0),
          hoverColor: primaryColor.withOpacity(0.06),
          splashColor: primaryColor.withOpacity(0.12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners for flag
                  child: Image.network(
                    flagUrl,
                    width: 30, // Fixed width for flag
                    height: 20, // Fixed height for flag
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 30,
                      height: 20,
                      color: Colors.grey[300],
                      child: Icon(Icons.flag_outlined, size: 16, color: Colors.grey[600]),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Text(
                  countryCode,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    countryName,
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 16.0),
                // Custom radio button style
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? primaryColor : Colors.transparent, // Fill with primary color if selected
                    border: Border.all(
                      color: isSelected ? primaryColor : Colors.grey[400]!, // Primary color border if selected, else grey
                      width: 2.0,
                    ),
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.circle, // Small circle inside when selected
                          color: Colors.white, // White circle
                          size: 10,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}