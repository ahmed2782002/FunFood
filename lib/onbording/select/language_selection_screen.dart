import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funfoodapp/onbording/select/provider_lan.dart';

import 'package:provider/provider.dart';

class LanguageSelectionScreen extends StatefulWidget {
  static const String routeName = "language-selection";
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage; // 'en' or 'ar'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0B192C),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAssetImage('assets/languages 1.png', width: 180.w, height: 180.h),
                    SizedBox(height: 32.h),
                    Text(
                      'Fun Food اهلا بيك في    \nمن فضلك اختر اللغة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Welcome to Fun Food , Please\nChoose your Language',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLanguageCard(
                          langCode: 'en',
                          flagAsset: 'assets/en.png',
                          label: 'ENGLISH',
                          isSelected: selectedLanguage == 'en',
                        ),
                        SizedBox(width: 25.w),
                        _buildLanguageCard(
                          langCode: 'ar',
                          flagAsset: 'assets/arb.png',
                          label: 'العربية',
                          isSelected: selectedLanguage == 'ar',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 70.h,
              child: Center(
                child: SizedBox(
                  width: 320.w,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedLanguage != null) {
                        // تغيير اللغة باستخدام Provider
                        final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
                        languageProvider.setLocale(Locale(selectedLanguage!));

                        // الانتقال إلى الصفحة التالية
                        Navigator.pushNamed(context, 'account-choice');
                      } else {
                        // نعرض رسالة الخطأ - نستخدم نص ثابت هنا لأن الـ locale لم تُختر بعد
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              selectedLanguage == 'ar'
                                  ? 'يرجى اختيار لغة أولاً.'
                                  : 'Please select a language first.',
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1563FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      selectedLanguage == 'ar' ? 'استمرار' : 'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
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

  Widget _buildAssetImage(String assetPath, {double? width, double? height}) {
    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) =>
          Icon(Icons.broken_image, color: Colors.white54, size: 60.sp),
    );
  }

  Widget _buildLanguageCard({
    required String langCode,
    required String flagAsset,
    required String label,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = langCode;
        });
      },
      child: Container(
        width: 150.w,
        height: 130.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF1563FF) : Colors.transparent,
            width: 2.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: isSelected
                    ? Icon(Icons.check_circle, color: Color(0xFF1563FF), size: 22.sp)
                    : Icon(Icons.radio_button_unchecked, color: Colors.grey, size: 22.sp),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    flagAsset,
                    width: langCode == 'ar' ? 54.w : 46.w,
                    height: langCode == 'ar' ? 54.h : 46.h,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.broken_image, color: Colors.white54, size: 30.sp),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    label,
                    style: TextStyle(
                      color: Color(0xFF0B192C),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
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
