import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../data/provider.dart';
import '../../l10n/app_localizations.dart';
import '../dailyactivity.dart';
import 'health/health_condition_screen.dart';



class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});
  static const String routeName = 'gender-selection';

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0XFF0B192C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                local.whatAboutYou,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
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
              SizedBox(height: 30.h),
              Text(
                local.selectYourGender,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                local.genderInfoHint,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 40.h),
              _buildGenderOption(context, 'man', 'assets/man.png', local.man),
              SizedBox(height: 30.h),
              _buildGenderOption(context, 'woman', 'assets/woman.png', local.woman),
              SizedBox(height: 30.h),
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: local.enterYourAge,
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedGender == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(local.selectGenderToContinue),
                          backgroundColor: Colors.grey,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      return;
                    }

                    if (_ageController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(local.enterYourAge),
                          backgroundColor: Colors.grey,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      return;
                    }

                    final age = int.tryParse(_ageController.text.trim());
                    if (age == null || age < 1 || age > 120) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(local.enterValidAge),
                          backgroundColor: Colors.grey,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      return;
                    }

                    final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
                    provider.setGender(selectedGender!);
                    provider.setAge(age);

                    Navigator.pushNamed(context, ActivityLevelScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1563FF),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    local.ccontinue,
                    style: TextStyle(
                      fontSize: 16.sp,
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
      width: isActive ? 10.w : 8.w,
      height: isActive ? 10.w : 8.w,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFF06292) : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildGenderOption(BuildContext context, String genderValue, String imagePath, String label) {
    final isSelected = selectedGender == genderValue;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = genderValue;
        });
      },
      child: Container(
        width: 150.w,
        height: 150.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? const Color(0xFF0B58DC) : Colors.transparent,
            width: 4.w,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 80.w, height: 80.w),
            SizedBox(height: 10.h),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
