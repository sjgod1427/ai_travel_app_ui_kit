import 'package:ai_travel_app_ui_kit/screens/select_country_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _emailNotificationEnabled = true;
  bool _darkModeEnabled = false;
  bool _locationServicesEnabled = true;

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
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 20,
          ), // Back icon primary color
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Settings',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [const SizedBox(width: 8.0)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            _SettingsSection(
              title: 'General',
              textTheme: textTheme,
              colorScheme: colorScheme,
              children: [
                _SettingsTile(
                  title: 'Edit Profile',
                  icon: Icons.person_outline,
                  onTap: () {},
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                ),
                _SettingsTile(
                  title: 'Change Password',
                  icon: Icons.lock_outline,
                  onTap: () {},
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                ),
                _SettingsTile(
                  title: 'Language',
                  icon: Icons.language,
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => SelectCountryScreen(),
                      ),
                    );
                  },
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            _SettingsSection(
              title: 'Notifications',
              textTheme: textTheme,
              colorScheme: colorScheme,
              children: [
                _SettingsToggleTile(
                  title: 'Push Notifications',
                  icon: Icons.notifications_none,
                  value: _notificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                  colorScheme: colorScheme,
                ),
                _SettingsToggleTile(
                  title: 'Email Notifications',
                  icon: Icons.email_outlined,
                  value:
                      _emailNotificationEnabled, // Use same state for example
                  onChanged: (bool value) {
                    setState(() {
                      _emailNotificationEnabled = value;
                    });
                  },
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                  colorScheme: colorScheme,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            _SettingsSection(
              title: 'Privacy & Security',
              textTheme: textTheme,
              colorScheme: colorScheme,
              children: [
                _SettingsToggleTile(
                  title: 'Location Services',
                  icon: Icons.location_on_outlined,
                  value: _locationServicesEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _locationServicesEnabled = value;
                    });
                  },
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                  colorScheme: colorScheme,
                ),
                _SettingsToggleTile(
                  title: 'Dark Mode',
                  icon: Icons.dark_mode_outlined,
                  value: _darkModeEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _darkModeEnabled = value;
                    });
                  },
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                  colorScheme: colorScheme,
                ),
                _SettingsTile(
                  title: 'Privacy Policy',
                  icon: Icons.policy_outlined,
                  onTap: () {},
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            _SettingsSection(
              title: 'About',
              textTheme: textTheme,
              colorScheme: colorScheme,
              children: [
                _SettingsTile(
                  title: 'App Version',
                  subtitle: '1.0.0',
                  icon: Icons.info_outline,
                  onTap: () {},
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                ),
                _SettingsTile(
                  title: 'Licenses',
                  icon: Icons.description_outlined,
                  onTap: () {},
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            _SettingsSection(
              title: 'Help & Support',
              textTheme: textTheme,
              colorScheme: colorScheme,
              children: [
                _SettingsTile(
                  title: 'Contact Us',
                  icon: Icons.support_agent_outlined,
                  onTap: () {},
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                ),
                _SettingsTile(
                  title: 'FAQ',
                  icon: Icons.live_help_outlined,
                  onTap: () {},
                  textTheme: textTheme,
                  primaryColor: primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _SettingsSection({
    required this.title,
    required this.children,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.surface, // White background for the section
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
            children: List.generate(children.length, (index) {
              return Column(
                children: [
                  children[index],
                  if (index < children.length - 1)
                    Divider(
                      height: 0,
                      thickness: 1,
                      color: Colors.grey[200],
                      indent: 16,
                      endIndent: 16,
                    ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final TextTheme textTheme;
  final Color primaryColor;

  const _SettingsTile({
    required this.title,
    this.subtitle,
    required this.icon,
    required this.onTap,
    required this.textTheme,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Make Material transparent
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          15.0,
        ), // Apply borderRadius to InkWell
        child: Ink(
          // Use Ink to provide the visual surface for the splash
          decoration: BoxDecoration(
            // Add decoration to Ink
            borderRadius: BorderRadius.circular(
              15.0,
            ), // Match the parent container's border radius
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.grey[700]),
            title: Text(
              title,
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
            ),
            subtitle:
                subtitle != null
                    ? Text(
                      subtitle!,
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    )
                    : null,
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[400],
              size: 16,
            ),
            // onTap is handled by InkWell
          ),
        ),
      ),
    );
  }
}

class _SettingsToggleTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;
  final TextTheme textTheme;
  final Color primaryColor;
  final ColorScheme colorScheme;

  const _SettingsToggleTile({
    required this.title,
    required this.icon,
    required this.value,
    required this.onChanged,
    required this.textTheme,
    required this.primaryColor,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, // <-- Set a color to allow splash effect
      borderRadius: BorderRadius.circular(15.0),
      clipBehavior: Clip.antiAlias, // <-- Fix splash overflow
      child: InkWell(
        onTap: () => onChanged(!value),
        borderRadius: BorderRadius.circular(15.0),
        child: Ink(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
          child: SwitchListTile(
            secondary: Icon(icon, color: Colors.grey[700]),
            title: Text(
              title,
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
            ),
            value: value,
            onChanged: onChanged,
            activeColor: primaryColor,
            activeTrackColor: primaryColor,
            inactiveThumbColor: Colors.grey[200],
            inactiveTrackColor: Colors.grey[100],
            thumbColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return Colors.white;
              }
              return Colors.grey[400]!;
            }),
          ),
        ),
      ),
    );
  }
}
