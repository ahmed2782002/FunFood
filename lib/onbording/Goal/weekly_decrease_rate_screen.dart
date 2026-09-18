import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../data/provider.dart';
import '../../l10n/app_localizations.dart';
import '../select/gender_selection_screen.dart';


class WeeklyDecreaseRateScreen extends StatefulWidget {
  static const String routeName = 'weekly-decrease-rate';
  const WeeklyDecreaseRateScreen({super.key});

  @override
  State<WeeklyDecreaseRateScreen> createState() => _WeeklyDecreaseRateScreenState();
}

class _WeeklyDecreaseRateScreenState extends State<WeeklyDecreaseRateScreen> {
  double? selectedRate;

  final List<double> rateOptions = [0.25, 0.5, 0.75, 1.0];

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0XFF0B192C),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 25.sp),
                ),
              ),
              Text(
                local.weeklyDecreaseRate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(true),
                  SizedBox(width: 5.w),
                  _buildDot(true),
                  SizedBox(width: 5.w),
                  _buildDot(false),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: rateOptions.length,
                  itemBuilder: (context, index) {
                    final rate = rateOptions[index];
                    final isSelected = selectedRate == rate;

                    return _buildRateOption(
                      "${local.lose} ${rate.toString().replaceAll(RegExp(r'\.0*$'), '')} ${local.kgPerWeek}",
                      isSelected,
                          () {
                        setState(() {
                          selectedRate = rate;
                        });
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedRate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(local.pleaseSelectRate),
                          backgroundColor: Colors.grey,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      return;
                    }

                    Provider.of<UserOnboardingProvider>(context, listen: false)
                        .setWeeklyDecreaseRate(selectedRate!);

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
                  ),
                  child: Text(
                    local.ccontinue,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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

  Widget _buildDot(bool isActive) {
    return Container(
      width: 10.w,
      height: 10.h,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFF06292) : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildRateOption(String name, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF1563FF) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0XFF0B192C),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'KG',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  color: const Color(0XFF0B192C),
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
