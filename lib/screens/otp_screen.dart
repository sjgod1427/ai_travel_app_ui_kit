import 'package:flutter/material.dart';
import 'package:ai_travel_app_ui_kit/components/buttons/primary_text_button.dart';
import 'package:flutter/services.dart'; // Required for FilteringTextInputFormatter

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _otpFocusNodes =
      List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _otpControllers.length; i++) {
      _otpControllers[i].addListener(() {
        if (_otpControllers[i].text.length == 1 &&
            i < _otpControllers.length - 1) {
          _otpFocusNodes[i + 1].requestFocus();
        } else if (_otpControllers[i].text.isEmpty && i > 0) {
          _otpFocusNodes[i - 1].requestFocus();
        }
        // Optional: Trigger validation or enable button when all fields are filled
        setState(() {}); // Rebuild to update button state or visual cues
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _otpFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface, // White background
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor, size: 20),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Verification',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            Text(
              'Enter the code sent to your number',
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[850],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'We sent a 4-digit code to +88017XXXXXXXX',
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                _otpControllers.length,
                (index) => _OtpInputField(
                  controller: _otpControllers[index],
                  focusNode: _otpFocusNodes[index],
                  textTheme: textTheme,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // Handle resend code action
                },
                child: Text(
                  'Resend Code',
                  style: textTheme.bodyMedium?.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(),
            PrimaryTextButton(
              text: 'Verify',
              onPressed: () {
                // Read OTP: _otpControllers.map((c) => c.text).join()
                // Perform verification logic
              },
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}

class _OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextTheme textTheme;

  const _OtpInputField({
    required this.controller,
    required this.focusNode,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Fixed width for each OTP box
      height: 60, // Fixed height for each OTP box
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        border: Border.all(
          color: focusNode.hasFocus
              ? Theme.of(context).primaryColor
              : Colors.grey[300]!,
          width: focusNode.hasFocus ? 2.0 : 1.0,
        ),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1, // Only one digit per field
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Allow only digits
        ],
        style: textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.grey[850],
        ),
        decoration: const InputDecoration(
          counterText: '', // Hide maxLength counter
          border: InputBorder.none, // Hide default border
          contentPadding: EdgeInsets.zero,
        ),
        cursorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}