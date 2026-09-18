import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../l10n/app_localizations.dart';
import '../Goal/goal_selection_screen.dart';


class AccountChoiceScreen extends StatelessWidget {
  static const String routeName = "account-choice";
  const AccountChoiceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0XFF0B192C),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 24.h),

              // Top illustration
              Image.asset(
                'assets/Illustration.png',
                width: 220.w,
                height: 220.h,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 32.h),

              // Question
              Text(
                localizations.doYouAlreadyHaveAnAccount,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),

              SizedBox(height: 36.h),

              // No, not yet. (blue button)
              SizedBox(
                width: 270.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, GoalSelectionScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1563FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    localizations.no_not_yet,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),

              SizedBox(height: 18.h),

              // Yes I have an account (outlined button)
              SizedBox(
                width: 270.w,
                height: 50.h,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'sign-in2');
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white, width: 2.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                   localizations.yes_I_have_an_account,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
