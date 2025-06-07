import 'package:ai_travel_app_ui_kit/screens/ai_chat_section.dart';
import 'package:ai_travel_app_ui_kit/screens/app_ai_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/book_hotel_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/date_timeline_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/explore_hotels_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/hotel_details_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/hotel_filter_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/onboarding_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/order_status_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/phone_input_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/profile_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/reservation_details_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/settings_screen.dart';
import 'package:ai_travel_app_ui_kit/screens/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:pixel_preview/pixel_app/pixel_group.dart';
import 'package:pixel_preview/pixel_preview.dart';
import 'package:google_fonts/google_fonts.dart'; // Import google_fonts

import 'package:ai_travel_app_ui_kit/screens/home_screen.dart'; // Import the new home screen
import 'package:ai_travel_app_ui_kit/screens/booking_pending_screen.dart'; // Import the new booking pending screen
import 'package:ai_travel_app_ui_kit/screens/ai_chat_screen2.dart'; // Import the new AI chat screen 2
import 'package:ai_travel_app_ui_kit/screens/login_screen.dart'; // Import login screen
import 'package:ai_travel_app_ui_kit/screens/signup_screen.dart'; // Import signup screen
import 'package:ai_travel_app_ui_kit/screens/otp_screen.dart'; // Import OTP screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF7356FF); // User's chosen primary color
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starter App', // Updated title
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: ThemeData.light().brightness,
          onPrimary: Colors.white,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryColor),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryColor),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryColor,
            side: const BorderSide(color: primaryColor),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
        textTheme:
            GoogleFonts.plusJakartaSansTextTheme(), // Apply user's text theme
      ),
      home: PixelApp(
        iFrameMode: true,
        groups: [
          PixelGroup(
            title: 'Screens',
            children: [
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const OnboardingScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const LoginScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const SignupScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const PhoneInputScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const OtpScreen(), // Set as the initial screen
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const HomeScreen(),
              ),

              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const AIChatSection(),
              ),

              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const AIChatScreen2(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const AppAIScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const BookHotelScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const DateTimelineScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const ExploreHotelsScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const HotelDetailsScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const HotelFilterScreen(),
              ),

              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const OrderStatusScreen(),
              ),

              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const ReservationDetailsScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const BookingPendingScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const ProfileScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const SettingsScreen(),
              ),
              PixelPreview(
                presets: ScreenPresets(),
                enabled: true,
                child: const SubscriptionScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
