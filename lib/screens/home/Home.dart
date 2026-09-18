import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/provider.dart';
import '../../l10n/app_localizations.dart';

import '../exercises/Exercises_muc.dart';
import '../exercises/ex_loss.dart';
import 'CaloriesPage.dart';
import 'cbackdoc.dart';
import 'diet.dart';
import 'model_deit_diseases.dart';
import 'weight.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Stream<StepCount> _stepCountStream;
  int _steps = 0;

  double posX = 20;
  double posY = 500;

  @override
  void initState() {
    super.initState();
    _initPermissions();
  }

  Future<void> _initPermissions() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _startListening();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.permissionMessage),
        ),
      );
    }
  }

  void _startListening() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(
      _onStepCount,
      onError: _onStepCountError,
      cancelOnError: true,
    );
  }

  void _onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps;
    });
  }

  void _onStepCountError(error) {
    print("Step count error: $error");
  }

  Future<void> _launchWhatsApp() async {
    final Uri url = Uri.parse("https://wa.me/+201098402352");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final userProvider = Provider.of<UserOnboardingProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0B192C),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/Steps.png',
                          width: 350.w,
                          height: 280.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/walk 1.png',
                              width: 30.w,
                              height: 30.h,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              local.todaySteps,
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 16.sp),
                            ),
                            Text(
                              '$_steps',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 20.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    children: [
                      _buildFeatureTile(
                        context,
                        'assets/icon/diet (1) 1.png',
                        local.diet,
                        userProvider.data.hasHealthCondition == true
                            ? const DietPageDiseases()
                            : const DietPage(),
                      ),
                      _buildFeatureTile(
                        context,
                        'assets/icon/calories 1.png',
                        local.calories,
                        userProvider.data.hasHealthCondition == true
                            ? const ConsultDoctorScreen()
                            : const CaloriesPage(),
                      ),
                      _buildFeatureTile(
                        context,
                        'assets/icon/weigh-scale 1.png',
                        local.wweight,
                        const WeightPage(),
                      ),
                      _buildFeatureTile(
                        context,
                        'assets/icon/exercise 1.png',
                        local.exercises,
                        _getExercisePage(userProvider),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// زرار "اسأل طبيبك" العائم
          Positioned(
            left: posX,
            top: posY,
            child: GestureDetector(
              onPanUpdate: (details) {
                final screenWidth = MediaQuery.of(context).size.width;
                final screenHeight = MediaQuery.of(context).size.height;

                setState(() {
                  posX += details.delta.dx;
                  posY += details.delta.dy;

                  if (posX < 0) posX = 0;
                  if (posX > screenWidth - 70) posX = screenWidth - 70;

                  if (posY < 0) posY = 0;
                  if (posY > screenHeight - 150) posY = screenHeight - 150;
                });
              },
              onTap: _launchWhatsApp,
              child: Column(
                children: [
                  ClipOval(
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      color: Colors.white,
                      child: Image.asset(
                        'assets/qq.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      local.askYourDoctor,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getExercisePage(UserOnboardingProvider provider) {
    switch (provider.data.goal?.toLowerCase()) {
      case 'loss weight':
        return LossPage();
      case 'building muscles':
      case 'gain weight':
      case 'maintain weight':
        return ExercisesPage();
      default:
        return Builder(
          builder: (ctx) => Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                AppLocalizations.of(ctx)!.noDataAvailable,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        );
    }
  }

  Widget _buildFeatureTile(
      BuildContext context,
      String imagePath,
      String label,
      Widget destinationPage,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 80.w, height: 80.h),
            SizedBox(height: 10.h),
            Text(
              label,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
