import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/provider.dart';
import '../../l10n/app_localizations.dart';

import '../select/gender_selection_screen.dart';

class WeeklyIncreaseRateScreen extends StatefulWidget {
  static const String routeName = 'weekly-increase-rate';
  const WeeklyIncreaseRateScreen({Key? key}) : super(key: key);

  @override
  State<WeeklyIncreaseRateScreen> createState() => _WeeklyIncreaseRateScreenState();
}

class _WeeklyIncreaseRateScreenState extends State<WeeklyIncreaseRateScreen> {
  double? selectedRate;

  final List<double> weeklyRates = [.25, 0.5, 0.75, 1.0];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0XFF0B192C),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32.h),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 25.sp),
                ),
              ),
              Text(
                localizations.weekly_increase_title,
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
              SizedBox(height: 32.h),
              Flexible(
                child: ListView.builder(
                  itemCount: weeklyRates.length,
                  itemBuilder: (context, index) {
                    final rate = weeklyRates[index];
                    return _buildRateOption(rate, localizations);
                  },
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedRate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(localizations.select_rate_warning),
                          backgroundColor: Colors.grey,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      return;
                    }

                    Provider.of<UserOnboardingProvider>(context, listen: false)
                        .setWeeklyIncreaseRate(selectedRate!);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GenderSelectionScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1563FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    localizations.ccontinue,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
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

  Widget _buildRateOption(double rate, AppLocalizations localizations) {
    final bool isSelected = selectedRate == rate;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRate = rate;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF1563FF) : Colors.transparent,
            width: 2.w,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFF0B192C),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'KG',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                localizations.increase_kilograms(rate.toString().replaceAll(RegExp(r'\.0*$'), '')),
                style: TextStyle(
                  color: const Color(0xFF0B192C),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? const Color(0xFF1563FF) : const Color(0xFF808080),
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
