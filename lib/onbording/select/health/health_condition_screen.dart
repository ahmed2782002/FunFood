import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


import '../../../data/provider.dart';
import '../../../l10n/app_localizations.dart';

import '../../heightandweight/height_selection_screen.dart';
import 'diseases_selection_screen.dart';

class HealthConditionScreen extends StatefulWidget {
  static const String routeName = '/health-condition';
  final bool isGainWeight;

  const HealthConditionScreen({
    Key? key,
    required this.isGainWeight,
  }) : super(key: key);

  @override
  State<HealthConditionScreen> createState() => _HealthConditionScreenState();
}

class _HealthConditionScreenState extends State<HealthConditionScreen> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0XFF0B192C),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0XFF0B192C),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    local.what_about_you,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(true),
                      SizedBox(width: 6.w),
                      _buildDot(true),
                      SizedBox(width: 6.w),
                      _buildDot(false),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    local.inform_health_condition,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    local.suffer_any_disease,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 80.h),
                  Row(
                    children: [
                      Expanded(child: _buildOption('yes', local.yes)),
                      SizedBox(width: 16.w),
                      Expanded(child: _buildOption('no', local.no)),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 24.w,
              right: 24.w,
              bottom: 100.h,
              child: SizedBox(
                width: double.infinity,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: _onContinuePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1563FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    local.continue_button,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onContinuePressed() {
    final local = AppLocalizations.of(context)!;

    if (selectedOption == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            local.please_select_health_condition,
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
          backgroundColor: Colors.grey,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
    provider.setHasHealthCondition(selectedOption == 'yes');

    if (selectedOption == 'yes') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const DiseasesSelectionScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HeightSelectionScreen()),
      );
    }
  }

  Widget _buildDot(bool active) {
    return Container(
      width: 10.w,
      height: 10.h,
      decoration: BoxDecoration(
        color: active ? const Color(0xFFF06292) : Colors.white24,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildOption(String value, String label) {
    final bool isSelected = selectedOption == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = value;
        });
      },
      child: Container(
        height: 130.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF1563FF) : Colors.transparent,
            width: 3.w,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10.h,
              right: 10.w,
              child: Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF1563FF) : Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: isSelected
                    ? Icon(Icons.check, color: Colors.white, size: 16.sp)
                    : null,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    value == 'yes'
                        ? 'assets/sad-face 1.png'
                        : 'assets/healthcare 1.png',
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    label,
                    style: TextStyle(
                      color: const Color(0xFF0B192C),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
