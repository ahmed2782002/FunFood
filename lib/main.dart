import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'auth/hive_storage.dart';
import 'auth/sign_in_2.dart';
import 'data/provider.dart';
import 'l10n/app_localizations.dart';
import 'onbording/dailyactivity.dart';
import 'onbording/select/provider_lan.dart';
import 'splash.dart';
import 'onbording/select/language_selection_screen.dart';
import 'onbording/select/account_choice_screen.dart';
import 'onbording/select/gender_selection_screen.dart';
import 'onbording/select/health/health_condition_screen.dart';
import 'onbording/select/health/diseases_selection_screen.dart';
import 'onbording/Goal/goal_selection_screen.dart';
import 'onbording/Goal/weekly_increase_rate_screen.dart';
import 'onbording/Goal/weekly_decrease_rate_screen.dart';
import 'onbording/heightandweight/height_selection_screen.dart';
import 'onbording/heightandweight/weight_selection_screen.dart';
import 'onbording/select/select_food.dart';
import 'onbording/physical_level_summary_screen.dart';
import 'onbording/plan_ready_screen.dart';
import 'screens/home_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // نبدأ بواجهة خفيفة (Splash) أولًا بدون انتظار تحميل Firebase
  runApp(const InitialApp());

  // نحمل Firebase و Hive في الخلفية
  await Future.wait([
    Firebase.initializeApp(),
    HiveStorage.init(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  ]);

  // بعد التحميل، نشغّل التطبيق الكامل
  runApp(const MyApp());
}


class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserOnboardingProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          final languageProvider = Provider.of<LanguageProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: languageProvider.locale,
            supportedLocales: L10n.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => const SplashScreen(),
              LanguageSelectionScreen.routeName: (context) =>
              const LanguageSelectionScreen(),
              AccountChoiceScreen.routeName: (context) =>
              const AccountChoiceScreen(),
              GoalSelectionScreen.routeName: (context) => GoalSelectionScreen(),
              WeightSelectionScreen.routeName: (context) =>
                  WeightSelectionScreen(),
              HeightSelectionScreen.routeName: (context) =>
              const HeightSelectionScreen(),
              DiseasesSelectionScreen.routeName: (context) =>
              const DiseasesSelectionScreen(),
              WeeklyIncreaseRateScreen.routeName: (context) =>
              const WeeklyIncreaseRateScreen(),
              WeeklyDecreaseRateScreen.routeName: (context) =>
              const WeeklyDecreaseRateScreen(),
              GenderSelectionScreen.routeName: (context) =>
              const GenderSelectionScreen(),
              HealthConditionScreen.routeName: (context) =>
              const HealthConditionScreen(isGainWeight: false),
              SelectFood.routeName: (context) => SelectFood(),
              PhysicalLevelSummaryScreen.routeName: (context) =>
              const PhysicalLevelSummaryScreen(),
              PlanReadyScreen.routeName: (context) => const PlanReadyScreen(),
              SignIn2.routeName: (context) => SignIn2(),
              ActivityLevelScreen.routeName: (context) =>
                  ActivityLevelScreen(),
              HomeLayout.routeName: (context) => HomeLayout(),
            },
          );
        },
      ),
    );
  }
}
