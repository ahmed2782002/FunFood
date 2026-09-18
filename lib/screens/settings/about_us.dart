import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    final List<String> imagePaths = [
      'assets/face.jpg',
      'assets/gmail.png',
      'assets/calls.png',
    ];

    final List<Size> imageSizes = [
      Size(40.w, 50.w), // Face
      Size(60.w, 60.w), // Gmail
      Size(70.w, 70.w), // Call
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0C1B2A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1B2A),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Padding(
          padding: EdgeInsets.only(left: 80.w),
          child: Text(
            local.aboutUsTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    local.aboutUsDescription,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.sp,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(imagePaths.length, (index) {
                    return InkWell(
                      onTap: () => handleActionByIndex(index),
                      child: Container(
                        width: imageSizes[index].width,
                        height: imageSizes[index].height,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.w),
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> handleActionByIndex(int index) async {
  final facebookUrl = Uri.parse("https://www.facebook.com/share/19WUnkwrfk/?mibextid=wwXIfr");
  final email = Uri(
    scheme: 'mailto',
    path: 'example@example.com',
    query: 'subject=Hello&body=Write your message here',
  );
  final phone = Uri(scheme: 'tel', path: '+201234567890');

  Uri uri;

  switch (index) {
    case 0:
      uri = facebookUrl;
      break;
    case 1:
      uri = email;
      break;
    case 2:
      uri = phone;
      break;
    default:
      throw Exception('Invalid index: $index');
  }

  if (!await launchUrl(uri)) {
    throw 'Could not launch $uri';
  }
}
