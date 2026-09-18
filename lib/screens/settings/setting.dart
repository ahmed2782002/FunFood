import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../auth/sign_in_2.dart';
import '../../l10n/app_localizations.dart';
import '../../onbording/select/provider_lan.dart';
import 'about_us.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C1B2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: const TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 100),

            /// Share App button (disabled for now)
            SettingButton(
              iconData: Icons.share,
              text: AppLocalizations.of(context)!.shareApp,
              onTap: () {
                const String appLink = 'https://drive.google.com/drive/u/0/folders/1-58-GyDcpRhAeRW1ZHWYSKsbAY0FFEiz'; // غير اللينك هنا
                Share.share('Try this amazing app!$appLink');
              },
              showCustomArrow: true,
            ),

            const SizedBox(height: 20),
            SettingButton(
              imagePath: 'assets/icon/languages 1.png',
              text: AppLocalizations.of(context)!.language,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: const Color(0xFF0C1B2A),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  builder: (context) {
                    final provider = Provider.of<LanguageProvider>(context, listen: false);
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.language, color: Colors.white),
                            title: Text(AppLocalizations.of(context)!.english,
                                style: const TextStyle(color: Colors.white)),
                            onTap: () {
                              provider.setLocale(const Locale('en'));
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.language, color: Colors.white),
                            title: Text(AppLocalizations.of(context)!.arabic,
                                style: const TextStyle(color: Colors.white)),
                            onTap: () {
                              provider.setLocale(const Locale('ar'));
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              showCustomArrow: true,
            ),
            const SizedBox(height: 20),
            SettingButton(
              imagePath: 'assets/icon/about 1.png',
              text: AppLocalizations.of(context)!.aboutUs,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUs()),
                );
              },
              showCustomArrow: true,
            ),
            const SizedBox(height: 20),
            SettingButton(
              imagePath: 'assets/icon/check-out 1.png',
              text: AppLocalizations.of(context)!.logout,
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn2()),
                      (route) => false,
                );
              },
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  final String? imagePath;
  final IconData? iconData; // جديد
  final String text;
  final VoidCallback onTap;
  final bool isLogout;
  final bool showCustomArrow;

  const SettingButton({
    super.key,
    this.imagePath,
    this.iconData,
    required this.text,
    required this.onTap,
    this.isLogout = false,
    this.showCustomArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget leadingWidget;

    if (iconData != null) {
      leadingWidget = Icon(iconData, color: Colors.white, size: 35);
    } else if (imagePath != null) {
      leadingWidget = Image.asset(imagePath!, width: 40, height: 40);
    } else {
      leadingWidget = const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            color: const Color(0xFF2258A1),
            border: Border.all(color: Colors.white, width: 1.6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: isLogout
              ? Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10),
                leadingWidget,
              ],
            ),
          )
              : Row(
            children: [
              leadingWidget,
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (showCustomArrow)
                Image.asset(
                  'assets/icon/right-arrow 4.png',
                  width: 20,
                  height: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
