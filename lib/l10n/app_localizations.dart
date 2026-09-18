import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @doYouAlreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you already have an account?'**
  String get doYouAlreadyHaveAnAccount;

  /// No description provided for @no_not_yet.
  ///
  /// In en, this message translates to:
  /// **'No, not yet.'**
  String get no_not_yet;

  /// No description provided for @yes_I_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Yes I have an account'**
  String get yes_I_have_an_account;

  /// No description provided for @yourGoalFromTheApp.
  ///
  /// In en, this message translates to:
  /// **'Your goal from the application'**
  String get yourGoalFromTheApp;

  /// No description provided for @whatIsYourMainGoal.
  ///
  /// In en, this message translates to:
  /// **'What is your main goal?'**
  String get whatIsYourMainGoal;

  /// No description provided for @goalInfoHint.
  ///
  /// In en, this message translates to:
  /// **'This information helps us customize your user\nexperience to suit your needs.'**
  String get goalInfoHint;

  /// No description provided for @pleaseSelectGoal.
  ///
  /// In en, this message translates to:
  /// **'Please select your goal to continue'**
  String get pleaseSelectGoal;

  /// No description provided for @ccontinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get ccontinue;

  /// No description provided for @lossWeight.
  ///
  /// In en, this message translates to:
  /// **'Loss weight'**
  String get lossWeight;

  /// No description provided for @maintainWeight.
  ///
  /// In en, this message translates to:
  /// **'Maintain weight'**
  String get maintainWeight;

  /// No description provided for @gainWeight.
  ///
  /// In en, this message translates to:
  /// **'Gain weight'**
  String get gainWeight;

  /// No description provided for @buildingMuscles.
  ///
  /// In en, this message translates to:
  /// **'Building muscles'**
  String get buildingMuscles;

  /// No description provided for @weekly_increase_title.
  ///
  /// In en, this message translates to:
  /// **'Weekly increase rates'**
  String get weekly_increase_title;

  /// No description provided for @increase_kilograms.
  ///
  /// In en, this message translates to:
  /// **'Increase {kg} kilograms'**
  String increase_kilograms(Object kg);

  /// No description provided for @select_rate_warning.
  ///
  /// In en, this message translates to:
  /// **'Please select a weekly increase rate to continue'**
  String get select_rate_warning;

  /// No description provided for @weeklyDecreaseRate.
  ///
  /// In en, this message translates to:
  /// **'Weekly decrease rate'**
  String get weeklyDecreaseRate;

  /// No description provided for @pleaseSelectRate.
  ///
  /// In en, this message translates to:
  /// **'Please select a weekly decrease rate to continue'**
  String get pleaseSelectRate;

  /// No description provided for @lose.
  ///
  /// In en, this message translates to:
  /// **'Lose'**
  String get lose;

  /// No description provided for @kgPerWeek.
  ///
  /// In en, this message translates to:
  /// **'KG/week'**
  String get kgPerWeek;

  /// No description provided for @whatAboutYou.
  ///
  /// In en, this message translates to:
  /// **'What about you'**
  String get whatAboutYou;

  /// No description provided for @selectYourGender.
  ///
  /// In en, this message translates to:
  /// **'Please select your gender'**
  String get selectYourGender;

  /// No description provided for @genderInfoHint.
  ///
  /// In en, this message translates to:
  /// **'This information will help us calculate your weight.'**
  String get genderInfoHint;

  /// No description provided for @enterYourAge.
  ///
  /// In en, this message translates to:
  /// **'Enter your age'**
  String get enterYourAge;

  /// No description provided for @selectGenderToContinue.
  ///
  /// In en, this message translates to:
  /// **'Please select your gender to continue'**
  String get selectGenderToContinue;

  /// No description provided for @enterValidAge.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid age between 1 and 120'**
  String get enterValidAge;

  /// No description provided for @man.
  ///
  /// In en, this message translates to:
  /// **'Man'**
  String get man;

  /// No description provided for @woman.
  ///
  /// In en, this message translates to:
  /// **'Woman'**
  String get woman;

  /// No description provided for @your_daily_activity_level.
  ///
  /// In en, this message translates to:
  /// **'Your Daily Activity Level'**
  String get your_daily_activity_level;

  /// No description provided for @what_is_your_daily_activity_level.
  ///
  /// In en, this message translates to:
  /// **'What is your daily activity level?'**
  String get what_is_your_daily_activity_level;

  /// No description provided for @daily_activity_level_hint.
  ///
  /// In en, this message translates to:
  /// **'This helps us determine your calorie needs.\nChoose the level that best fits your routine.'**
  String get daily_activity_level_hint;

  /// No description provided for @please_select_activity.
  ///
  /// In en, this message translates to:
  /// **'Please select your activity level to continue'**
  String get please_select_activity;

  /// No description provided for @sedentary_or_minimal.
  ///
  /// In en, this message translates to:
  /// **'Sedentary or minimal'**
  String get sedentary_or_minimal;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @moderate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get moderate;

  /// No description provided for @good_activity.
  ///
  /// In en, this message translates to:
  /// **'Good activity'**
  String get good_activity;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @inform_health_condition.
  ///
  /// In en, this message translates to:
  /// **'Please inform us about your health condition.'**
  String get inform_health_condition;

  /// No description provided for @suffer_any_disease.
  ///
  /// In en, this message translates to:
  /// **'Do you suffer from any diseases that require a special diet?'**
  String get suffer_any_disease;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @continue_button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_button;

  /// No description provided for @please_select_health_condition.
  ///
  /// In en, this message translates to:
  /// **'Please select your health condition to continue'**
  String get please_select_health_condition;

  /// No description provided for @what_about_you.
  ///
  /// In en, this message translates to:
  /// **'What about you'**
  String get what_about_you;

  /// No description provided for @diseases_title.
  ///
  /// In en, this message translates to:
  /// **'Diseases'**
  String get diseases_title;

  /// No description provided for @diabetes.
  ///
  /// In en, this message translates to:
  /// **'Diabetes'**
  String get diabetes;

  /// No description provided for @high_blood_pressure.
  ///
  /// In en, this message translates to:
  /// **'High Blood Pressure\n(Hypertension)'**
  String get high_blood_pressure;

  /// No description provided for @nutritional_deficiency.
  ///
  /// In en, this message translates to:
  /// **'Nutritional Deficiency'**
  String get nutritional_deficiency;

  /// No description provided for @anemia.
  ///
  /// In en, this message translates to:
  /// **'Anemia'**
  String get anemia;

  /// No description provided for @please_select_disease.
  ///
  /// In en, this message translates to:
  /// **'Please select one disease to continue'**
  String get please_select_disease;

  /// No description provided for @what_is_your_weight.
  ///
  /// In en, this message translates to:
  /// **'What is your weight?'**
  String get what_is_your_weight;

  /// No description provided for @kg_unit.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kg_unit;

  /// No description provided for @lb_unit.
  ///
  /// In en, this message translates to:
  /// **'lb'**
  String get lb_unit;

  /// No description provided for @what_is_your_height.
  ///
  /// In en, this message translates to:
  /// **'What is your height?'**
  String get what_is_your_height;

  /// No description provided for @cm_unit.
  ///
  /// In en, this message translates to:
  /// **'cm'**
  String get cm_unit;

  /// No description provided for @m_unit.
  ///
  /// In en, this message translates to:
  /// **'m'**
  String get m_unit;

  /// No description provided for @what_kind_of_food.
  ///
  /// In en, this message translates to:
  /// **'What kind of food do you like?'**
  String get what_kind_of_food;

  /// No description provided for @vegetarian_label.
  ///
  /// In en, this message translates to:
  /// **'Vegetarian'**
  String get vegetarian_label;

  /// No description provided for @varied_diet_label.
  ///
  /// In en, this message translates to:
  /// **'Varied diet'**
  String get varied_diet_label;

  /// No description provided for @select_food_warning.
  ///
  /// In en, this message translates to:
  /// **'Please select a food preference.'**
  String get select_food_warning;

  /// No description provided for @physical_level_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary of your physical level'**
  String get physical_level_summary;

  /// No description provided for @mass_factor.
  ///
  /// In en, this message translates to:
  /// **'Mass factor'**
  String get mass_factor;

  /// No description provided for @bmi_label.
  ///
  /// In en, this message translates to:
  /// **'Your own rate BMI'**
  String get bmi_label;

  /// No description provided for @healthy_weight.
  ///
  /// In en, this message translates to:
  /// **'Healthy weight'**
  String get healthy_weight;

  /// No description provided for @your_plan_based_on_data.
  ///
  /// In en, this message translates to:
  /// **'Your plan based on your data:'**
  String get your_plan_based_on_data;

  /// No description provided for @your_goal.
  ///
  /// In en, this message translates to:
  /// **'Your Goal'**
  String get your_goal;

  /// No description provided for @current_weight.
  ///
  /// In en, this message translates to:
  /// **'Current Weight'**
  String get current_weight;

  /// No description provided for @current_height.
  ///
  /// In en, this message translates to:
  /// **'Current Height'**
  String get current_height;

  /// No description provided for @health_condition.
  ///
  /// In en, this message translates to:
  /// **'Health Condition'**
  String get health_condition;

  /// No description provided for @start_plan.
  ///
  /// In en, this message translates to:
  /// **'Start your plan now'**
  String get start_plan;

  /// No description provided for @firebase_error.
  ///
  /// In en, this message translates to:
  /// **'Error uploading to Firebase:'**
  String get firebase_error;

  /// No description provided for @firebase_upload_error_message.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while uploading the data'**
  String get firebase_upload_error_message;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @articles.
  ///
  /// In en, this message translates to:
  /// **'Articles'**
  String get articles;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @yourPlanIsReady.
  ///
  /// In en, this message translates to:
  /// **'Your plan is ready'**
  String get yourPlanIsReady;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get noInternetConnection;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @dailyCalories.
  ///
  /// In en, this message translates to:
  /// **'Daily Calories: {calories} kcal'**
  String dailyCalories(Object calories);

  /// No description provided for @genderAndAge.
  ///
  /// In en, this message translates to:
  /// **'Gender: {gender} | Age: {age}'**
  String genderAndAge(Object age, Object gender);

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height: {height} cm'**
  String height(Object height);

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight: {weight} kg'**
  String weight(Object weight);

  /// No description provided for @healthCondition.
  ///
  /// In en, this message translates to:
  /// **'Health Condition: {condition}'**
  String healthCondition(Object condition);

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @todaySteps.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Steps'**
  String get todaySteps;

  /// No description provided for @diet.
  ///
  /// In en, this message translates to:
  /// **'Diet'**
  String get diet;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get calories;

  /// No description provided for @wweight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get wweight;

  /// No description provided for @exercises.
  ///
  /// In en, this message translates to:
  /// **'Exercises'**
  String get exercises;

  /// No description provided for @exercisesPage.
  ///
  /// In en, this message translates to:
  /// **'Exercises Page'**
  String get exercisesPage;

  /// No description provided for @permissionMessage.
  ///
  /// In en, this message translates to:
  /// **'Access to the steps account must be allowed.'**
  String get permissionMessage;

  /// No description provided for @underweight.
  ///
  /// In en, this message translates to:
  /// **'Underweight'**
  String get underweight;

  /// No description provided for @overweight.
  ///
  /// In en, this message translates to:
  /// **'Overweight'**
  String get overweight;

  /// No description provided for @obese.
  ///
  /// In en, this message translates to:
  /// **'Obese'**
  String get obese;

  /// No description provided for @goalGainWeight.
  ///
  /// In en, this message translates to:
  /// **'Your goal is to gain {rate} kg/week. Your target weight is {target} kg over {weeks}.'**
  String goalGainWeight(Object rate, Object target, Object weeks);

  /// No description provided for @goalLoseWeight.
  ///
  /// In en, this message translates to:
  /// **'Your goal is to lose {rate} kg/week. Your target weight is {target} kg over {weeks}.'**
  String goalLoseWeight(Object rate, Object target, Object weeks);

  /// No description provided for @goalStayFit.
  ///
  /// In en, this message translates to:
  /// **'Your plan is to maintain your current fitness level for {weeks}.'**
  String goalStayFit(Object weeks);

  /// No description provided for @goalBuildMuscle.
  ///
  /// In en, this message translates to:
  /// **'Your plan focuses on building muscle over {weeks}.'**
  String goalBuildMuscle(Object weeks);

  /// No description provided for @bmiUnderweight.
  ///
  /// In en, this message translates to:
  /// **'Note: Your BMI is considered underweight.'**
  String get bmiUnderweight;

  /// No description provided for @bmiHealthy.
  ///
  /// In en, this message translates to:
  /// **'Great! Your BMI is in the healthy range.'**
  String get bmiHealthy;

  /// No description provided for @bmiOverweight.
  ///
  /// In en, this message translates to:
  /// **'Note: Your BMI is considered overweight.'**
  String get bmiOverweight;

  /// No description provided for @specialCareCondition.
  ///
  /// In en, this message translates to:
  /// **'Because of your health condition ({condition}), your plan has been adjusted.'**
  String specialCareCondition(Object condition);

  /// No description provided for @weeksLabel.
  ///
  /// In en, this message translates to:
  /// **'weeks'**
  String get weeksLabel;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get aboutUs;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @weight_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Plan not found to save weight'**
  String get weight_update_failed;

  /// No description provided for @changePlan.
  ///
  /// In en, this message translates to:
  /// **'Change Diet Plan'**
  String get changePlan;

  /// No description provided for @todayMeal.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Meal'**
  String get todayMeal;

  /// No description provided for @water.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get water;

  /// No description provided for @caloriesProgress.
  ///
  /// In en, this message translates to:
  /// **'Calories Progress'**
  String get caloriesProgress;

  /// No description provided for @targetReached.
  ///
  /// In en, this message translates to:
  /// **'Target Reached!'**
  String get targetReached;

  /// No description provided for @keepGoing.
  ///
  /// In en, this message translates to:
  /// **'Keep Going!'**
  String get keepGoing;

  /// No description provided for @health_categories.
  ///
  /// In en, this message translates to:
  /// **'Health Categories'**
  String get health_categories;

  /// No description provided for @hydration.
  ///
  /// In en, this message translates to:
  /// **'Hydration'**
  String get hydration;

  /// No description provided for @sleep_recovery.
  ///
  /// In en, this message translates to:
  /// **'Sleep & Recovery'**
  String get sleep_recovery;

  /// No description provided for @nutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get nutrition;

  /// No description provided for @exercise_movement.
  ///
  /// In en, this message translates to:
  /// **'Exercise & Movement'**
  String get exercise_movement;

  /// No description provided for @mental_health.
  ///
  /// In en, this message translates to:
  /// **'Mental Health'**
  String get mental_health;

  /// No description provided for @skin_oral_care.
  ///
  /// In en, this message translates to:
  /// **'Skin & Oral Care'**
  String get skin_oral_care;

  /// No description provided for @health_prevention.
  ///
  /// In en, this message translates to:
  /// **'Health Prevention'**
  String get health_prevention;

  /// No description provided for @lifestyle_tips.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tips'**
  String get lifestyle_tips;

  /// No description provided for @hydration_tip_1_title.
  ///
  /// In en, this message translates to:
  /// **'Hydration Tip 1'**
  String get hydration_tip_1_title;

  /// No description provided for @hydration_tip_1_body.
  ///
  /// In en, this message translates to:
  /// **'Start your morning with a glass of water to activate your metabolism.'**
  String get hydration_tip_1_body;

  /// No description provided for @hydration_tip_2_title.
  ///
  /// In en, this message translates to:
  /// **'Hydration Tip 2'**
  String get hydration_tip_2_title;

  /// No description provided for @hydration_tip_2_body.
  ///
  /// In en, this message translates to:
  /// **'Drink at least 8 glasses of water daily for better skin and energy.'**
  String get hydration_tip_2_body;

  /// No description provided for @hydration_tip_3_title.
  ///
  /// In en, this message translates to:
  /// **'Hydration Tip 3'**
  String get hydration_tip_3_title;

  /// No description provided for @hydration_tip_3_body.
  ///
  /// In en, this message translates to:
  /// **'Add a slice of lemon to your water for a vitamin C boost.'**
  String get hydration_tip_3_body;

  /// No description provided for @hydration_tip_4_title.
  ///
  /// In en, this message translates to:
  /// **'Hydration Tip 4'**
  String get hydration_tip_4_title;

  /// No description provided for @hydration_tip_4_body.
  ///
  /// In en, this message translates to:
  /// **'Avoid sugary drinks and replace them with infused water.'**
  String get hydration_tip_4_body;

  /// No description provided for @hydration_tip_5_title.
  ///
  /// In en, this message translates to:
  /// **'Hydration Tip 5'**
  String get hydration_tip_5_title;

  /// No description provided for @hydration_tip_5_body.
  ///
  /// In en, this message translates to:
  /// **'Use a water reminder app to stay consistently hydrated.'**
  String get hydration_tip_5_body;

  /// No description provided for @hydration_tip_6_title.
  ///
  /// In en, this message translates to:
  /// **'Hydration Tip 6'**
  String get hydration_tip_6_title;

  /// No description provided for @hydration_tip_6_body.
  ///
  /// In en, this message translates to:
  /// **'Drink water before meals to aid digestion and control appetite.'**
  String get hydration_tip_6_body;

  /// No description provided for @hydration_tip_7_title.
  ///
  /// In en, this message translates to:
  /// **'Hydration Tip 7'**
  String get hydration_tip_7_title;

  /// No description provided for @hydration_tip_7_body.
  ///
  /// In en, this message translates to:
  /// **'Keep a reusable bottle with you to sip throughout the day.'**
  String get hydration_tip_7_body;

  /// No description provided for @hydration_tip_8_title.
  ///
  /// In en, this message translates to:
  /// **'Hydration Tip 8'**
  String get hydration_tip_8_title;

  /// No description provided for @hydration_tip_8_body.
  ///
  /// In en, this message translates to:
  /// **'Coconut water is a natural source of electrolytes — use it after workouts.'**
  String get hydration_tip_8_body;

  /// No description provided for @hydration_tip_9_title.
  ///
  /// In en, this message translates to:
  /// **'Hydration Tip 9'**
  String get hydration_tip_9_title;

  /// No description provided for @hydration_tip_9_body.
  ///
  /// In en, this message translates to:
  /// **'Limit caffeine intake to prevent dehydration.'**
  String get hydration_tip_9_body;

  /// No description provided for @hydration_tip_10_title.
  ///
  /// In en, this message translates to:
  /// **'Hydration Tip 10'**
  String get hydration_tip_10_title;

  /// No description provided for @hydration_tip_10_body.
  ///
  /// In en, this message translates to:
  /// **'Eat water-rich fruits like watermelon and cucumber.'**
  String get hydration_tip_10_body;

  /// No description provided for @sleep_tip_1_title.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tip 1'**
  String get sleep_tip_1_title;

  /// No description provided for @sleep_tip_1_body.
  ///
  /// In en, this message translates to:
  /// **'Maintain a consistent sleep schedule for better rest.'**
  String get sleep_tip_1_body;

  /// No description provided for @sleep_tip_2_title.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tip 2'**
  String get sleep_tip_2_title;

  /// No description provided for @sleep_tip_2_body.
  ///
  /// In en, this message translates to:
  /// **'Avoid screens at least 1 hour before bedtime.'**
  String get sleep_tip_2_body;

  /// No description provided for @sleep_tip_3_title.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tip 3'**
  String get sleep_tip_3_title;

  /// No description provided for @sleep_tip_3_body.
  ///
  /// In en, this message translates to:
  /// **'Create a dark, cool environment to improve sleep quality.'**
  String get sleep_tip_3_body;

  /// No description provided for @sleep_tip_4_title.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tip 4'**
  String get sleep_tip_4_title;

  /// No description provided for @sleep_tip_4_body.
  ///
  /// In en, this message translates to:
  /// **'Use a sleep tracker to monitor your sleep patterns.'**
  String get sleep_tip_4_body;

  /// No description provided for @sleep_tip_5_title.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tip 5'**
  String get sleep_tip_5_title;

  /// No description provided for @sleep_tip_5_body.
  ///
  /// In en, this message translates to:
  /// **'Avoid heavy meals and caffeine before bed.'**
  String get sleep_tip_5_body;

  /// No description provided for @sleep_tip_6_title.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tip 6'**
  String get sleep_tip_6_title;

  /// No description provided for @sleep_tip_6_body.
  ///
  /// In en, this message translates to:
  /// **'Practice deep breathing or meditation before sleep.'**
  String get sleep_tip_6_body;

  /// No description provided for @sleep_tip_7_title.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tip 7'**
  String get sleep_tip_7_title;

  /// No description provided for @sleep_tip_7_body.
  ///
  /// In en, this message translates to:
  /// **'Keep your bedroom quiet and clutter-free.'**
  String get sleep_tip_7_body;

  /// No description provided for @sleep_tip_8_title.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tip 8'**
  String get sleep_tip_8_title;

  /// No description provided for @sleep_tip_8_body.
  ///
  /// In en, this message translates to:
  /// **'Try reading a book to relax your mind before sleep.'**
  String get sleep_tip_8_body;

  /// No description provided for @sleep_tip_9_title.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tip 9'**
  String get sleep_tip_9_title;

  /// No description provided for @sleep_tip_9_body.
  ///
  /// In en, this message translates to:
  /// **'Get exposure to natural light during the day.'**
  String get sleep_tip_9_body;

  /// No description provided for @sleep_tip_10_title.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tip 10'**
  String get sleep_tip_10_title;

  /// No description provided for @sleep_tip_10_body.
  ///
  /// In en, this message translates to:
  /// **'Avoid long naps that can disturb night sleep.'**
  String get sleep_tip_10_body;

  /// No description provided for @nutrition_tip_1_title.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Tip 1'**
  String get nutrition_tip_1_title;

  /// No description provided for @nutrition_tip_1_body.
  ///
  /// In en, this message translates to:
  /// **'Eat a rainbow of fruits and vegetables for a variety of nutrients.'**
  String get nutrition_tip_1_body;

  /// No description provided for @nutrition_tip_2_title.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Tip 2'**
  String get nutrition_tip_2_title;

  /// No description provided for @nutrition_tip_2_body.
  ///
  /// In en, this message translates to:
  /// **'Limit processed food and focus on whole ingredients.'**
  String get nutrition_tip_2_body;

  /// No description provided for @nutrition_tip_3_title.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Tip 3'**
  String get nutrition_tip_3_title;

  /// No description provided for @nutrition_tip_3_body.
  ///
  /// In en, this message translates to:
  /// **'Include protein in every meal to stay full longer.'**
  String get nutrition_tip_3_body;

  /// No description provided for @nutrition_tip_4_title.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Tip 4'**
  String get nutrition_tip_4_title;

  /// No description provided for @nutrition_tip_4_body.
  ///
  /// In en, this message translates to:
  /// **'Read food labels to avoid added sugars and trans fats.'**
  String get nutrition_tip_4_body;

  /// No description provided for @nutrition_tip_5_title.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Tip 5'**
  String get nutrition_tip_5_title;

  /// No description provided for @nutrition_tip_5_body.
  ///
  /// In en, this message translates to:
  /// **'Choose whole grains over refined carbs.'**
  String get nutrition_tip_5_body;

  /// No description provided for @nutrition_tip_6_title.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Tip 6'**
  String get nutrition_tip_6_title;

  /// No description provided for @nutrition_tip_6_body.
  ///
  /// In en, this message translates to:
  /// **'Plan your meals ahead to avoid unhealthy snacking.'**
  String get nutrition_tip_6_body;

  /// No description provided for @nutrition_tip_7_title.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Tip 7'**
  String get nutrition_tip_7_title;

  /// No description provided for @nutrition_tip_7_body.
  ///
  /// In en, this message translates to:
  /// **'Use smaller plates to control portion sizes.'**
  String get nutrition_tip_7_body;

  /// No description provided for @nutrition_tip_8_title.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Tip 8'**
  String get nutrition_tip_8_title;

  /// No description provided for @nutrition_tip_8_body.
  ///
  /// In en, this message translates to:
  /// **'Drink water before and during meals to help digestion.'**
  String get nutrition_tip_8_body;

  /// No description provided for @nutrition_tip_9_title.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Tip 9'**
  String get nutrition_tip_9_title;

  /// No description provided for @nutrition_tip_9_body.
  ///
  /// In en, this message translates to:
  /// **'Limit added salt and season with herbs and spices.'**
  String get nutrition_tip_9_body;

  /// No description provided for @nutrition_tip_10_title.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Tip 10'**
  String get nutrition_tip_10_title;

  /// No description provided for @nutrition_tip_10_body.
  ///
  /// In en, this message translates to:
  /// **'Practice mindful eating by chewing slowly and avoiding distractions.'**
  String get nutrition_tip_10_body;

  /// No description provided for @exercise_tip_1_title.
  ///
  /// In en, this message translates to:
  /// **'Exercise Tip 1'**
  String get exercise_tip_1_title;

  /// No description provided for @exercise_tip_1_body.
  ///
  /// In en, this message translates to:
  /// **'Take a 10-minute walk after meals to aid digestion.'**
  String get exercise_tip_1_body;

  /// No description provided for @exercise_tip_2_title.
  ///
  /// In en, this message translates to:
  /// **'Exercise Tip 2'**
  String get exercise_tip_2_title;

  /// No description provided for @exercise_tip_2_body.
  ///
  /// In en, this message translates to:
  /// **'Stretch daily to improve flexibility and reduce injury.'**
  String get exercise_tip_2_body;

  /// No description provided for @exercise_tip_3_title.
  ///
  /// In en, this message translates to:
  /// **'Exercise Tip 3'**
  String get exercise_tip_3_title;

  /// No description provided for @exercise_tip_3_body.
  ///
  /// In en, this message translates to:
  /// **'Incorporate strength training twice a week for muscle health.'**
  String get exercise_tip_3_body;

  /// No description provided for @exercise_tip_4_title.
  ///
  /// In en, this message translates to:
  /// **'Exercise Tip 4'**
  String get exercise_tip_4_title;

  /// No description provided for @exercise_tip_4_body.
  ///
  /// In en, this message translates to:
  /// **'Use stairs instead of elevators to increase daily movement.'**
  String get exercise_tip_4_body;

  /// No description provided for @exercise_tip_5_title.
  ///
  /// In en, this message translates to:
  /// **'Exercise Tip 5'**
  String get exercise_tip_5_title;

  /// No description provided for @exercise_tip_5_body.
  ///
  /// In en, this message translates to:
  /// **'Try short home workouts if you\'re short on time.'**
  String get exercise_tip_5_body;

  /// No description provided for @exercise_tip_6_title.
  ///
  /// In en, this message translates to:
  /// **'Exercise Tip 6'**
  String get exercise_tip_6_title;

  /// No description provided for @exercise_tip_6_body.
  ///
  /// In en, this message translates to:
  /// **'Set movement reminders if you sit for long periods.'**
  String get exercise_tip_6_body;

  /// No description provided for @exercise_tip_7_title.
  ///
  /// In en, this message translates to:
  /// **'Exercise Tip 7'**
  String get exercise_tip_7_title;

  /// No description provided for @exercise_tip_7_body.
  ///
  /// In en, this message translates to:
  /// **'Find a workout buddy for motivation and accountability.'**
  String get exercise_tip_7_body;

  /// No description provided for @exercise_tip_8_title.
  ///
  /// In en, this message translates to:
  /// **'Exercise Tip 8'**
  String get exercise_tip_8_title;

  /// No description provided for @exercise_tip_8_body.
  ///
  /// In en, this message translates to:
  /// **'Choose enjoyable physical activities to stay consistent.'**
  String get exercise_tip_8_body;

  /// No description provided for @exercise_tip_9_title.
  ///
  /// In en, this message translates to:
  /// **'Exercise Tip 9'**
  String get exercise_tip_9_title;

  /// No description provided for @exercise_tip_9_body.
  ///
  /// In en, this message translates to:
  /// **'Warm up before and cool down after workouts.'**
  String get exercise_tip_9_body;

  /// No description provided for @exercise_tip_10_title.
  ///
  /// In en, this message translates to:
  /// **'Exercise Tip 10'**
  String get exercise_tip_10_title;

  /// No description provided for @exercise_tip_10_body.
  ///
  /// In en, this message translates to:
  /// **'Track your activity to monitor progress over time.'**
  String get exercise_tip_10_body;

  /// No description provided for @mental_health_tip_1_title.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Tip 1'**
  String get mental_health_tip_1_title;

  /// No description provided for @mental_health_tip_1_body.
  ///
  /// In en, this message translates to:
  /// **'Start a gratitude journal to boost your mood daily.'**
  String get mental_health_tip_1_body;

  /// No description provided for @mental_health_tip_2_title.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Tip 2'**
  String get mental_health_tip_2_title;

  /// No description provided for @mental_health_tip_2_body.
  ///
  /// In en, this message translates to:
  /// **'Practice mindfulness for 5 minutes each morning.'**
  String get mental_health_tip_2_body;

  /// No description provided for @mental_health_tip_3_title.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Tip 3'**
  String get mental_health_tip_3_title;

  /// No description provided for @mental_health_tip_3_body.
  ///
  /// In en, this message translates to:
  /// **'Talk to a friend or therapist when feeling overwhelmed.'**
  String get mental_health_tip_3_body;

  /// No description provided for @mental_health_tip_4_title.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Tip 4'**
  String get mental_health_tip_4_title;

  /// No description provided for @mental_health_tip_4_body.
  ///
  /// In en, this message translates to:
  /// **'Take breaks from social media to improve focus.'**
  String get mental_health_tip_4_body;

  /// No description provided for @mental_health_tip_5_title.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Tip 5'**
  String get mental_health_tip_5_title;

  /// No description provided for @mental_health_tip_5_body.
  ///
  /// In en, this message translates to:
  /// **'Engage in hobbies that make you feel good.'**
  String get mental_health_tip_5_body;

  /// No description provided for @mental_health_tip_6_title.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Tip 6'**
  String get mental_health_tip_6_title;

  /// No description provided for @mental_health_tip_6_body.
  ///
  /// In en, this message translates to:
  /// **'Set boundaries to protect your mental space.'**
  String get mental_health_tip_6_body;

  /// No description provided for @mental_health_tip_7_title.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Tip 7'**
  String get mental_health_tip_7_title;

  /// No description provided for @mental_health_tip_7_body.
  ///
  /// In en, this message translates to:
  /// **'Declutter your space to reduce mental stress.'**
  String get mental_health_tip_7_body;

  /// No description provided for @mental_health_tip_8_title.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Tip 8'**
  String get mental_health_tip_8_title;

  /// No description provided for @mental_health_tip_8_body.
  ///
  /// In en, this message translates to:
  /// **'Laugh daily — it\'s powerful medicine.'**
  String get mental_health_tip_8_body;

  /// No description provided for @mental_health_tip_9_title.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Tip 9'**
  String get mental_health_tip_9_title;

  /// No description provided for @mental_health_tip_9_body.
  ///
  /// In en, this message translates to:
  /// **'Accept your emotions without judgment.'**
  String get mental_health_tip_9_body;

  /// No description provided for @mental_health_tip_10_title.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Tip 10'**
  String get mental_health_tip_10_title;

  /// No description provided for @mental_health_tip_10_body.
  ///
  /// In en, this message translates to:
  /// **'Sleep and nutrition directly affect your mental health — don\'t ignore them.'**
  String get mental_health_tip_10_body;

  /// No description provided for @skin_care_tip_1_title.
  ///
  /// In en, this message translates to:
  /// **'Care Tip 1'**
  String get skin_care_tip_1_title;

  /// No description provided for @skin_care_tip_1_body.
  ///
  /// In en, this message translates to:
  /// **'Wash your face twice a day to remove dirt and oil.'**
  String get skin_care_tip_1_body;

  /// No description provided for @skin_care_tip_2_title.
  ///
  /// In en, this message translates to:
  /// **'Care Tip 2'**
  String get skin_care_tip_2_title;

  /// No description provided for @skin_care_tip_2_body.
  ///
  /// In en, this message translates to:
  /// **'Use sunscreen daily to protect your skin from UV damage.'**
  String get skin_care_tip_2_body;

  /// No description provided for @skin_care_tip_3_title.
  ///
  /// In en, this message translates to:
  /// **'Care Tip 3'**
  String get skin_care_tip_3_title;

  /// No description provided for @skin_care_tip_3_body.
  ///
  /// In en, this message translates to:
  /// **'Brush your teeth at least twice a day and floss regularly.'**
  String get skin_care_tip_3_body;

  /// No description provided for @skin_care_tip_4_title.
  ///
  /// In en, this message translates to:
  /// **'Care Tip 4'**
  String get skin_care_tip_4_title;

  /// No description provided for @skin_care_tip_4_body.
  ///
  /// In en, this message translates to:
  /// **'Drink more water to maintain healthy, glowing skin.'**
  String get skin_care_tip_4_body;

  /// No description provided for @skin_care_tip_5_title.
  ///
  /// In en, this message translates to:
  /// **'Care Tip 5'**
  String get skin_care_tip_5_title;

  /// No description provided for @skin_care_tip_5_body.
  ///
  /// In en, this message translates to:
  /// **'Avoid touching your face to reduce acne risk.'**
  String get skin_care_tip_5_body;

  /// No description provided for @skin_care_tip_6_title.
  ///
  /// In en, this message translates to:
  /// **'Care Tip 6'**
  String get skin_care_tip_6_title;

  /// No description provided for @skin_care_tip_6_body.
  ///
  /// In en, this message translates to:
  /// **'Use a moisturizer suited for your skin type.'**
  String get skin_care_tip_6_body;

  /// No description provided for @skin_care_tip_7_title.
  ///
  /// In en, this message translates to:
  /// **'Care Tip 7'**
  String get skin_care_tip_7_title;

  /// No description provided for @skin_care_tip_7_body.
  ///
  /// In en, this message translates to:
  /// **'Visit a dentist every 6 months for a checkup.'**
  String get skin_care_tip_7_body;

  /// No description provided for @skin_care_tip_8_title.
  ///
  /// In en, this message translates to:
  /// **'Care Tip 8'**
  String get skin_care_tip_8_title;

  /// No description provided for @skin_care_tip_8_body.
  ///
  /// In en, this message translates to:
  /// **'Limit sugary snacks to protect your teeth from cavities.'**
  String get skin_care_tip_8_body;

  /// No description provided for @skin_care_tip_9_title.
  ///
  /// In en, this message translates to:
  /// **'Care Tip 9'**
  String get skin_care_tip_9_title;

  /// No description provided for @skin_care_tip_9_body.
  ///
  /// In en, this message translates to:
  /// **'Clean your tongue daily to maintain oral hygiene.'**
  String get skin_care_tip_9_body;

  /// No description provided for @skin_care_tip_10_title.
  ///
  /// In en, this message translates to:
  /// **'Care Tip 10'**
  String get skin_care_tip_10_title;

  /// No description provided for @skin_care_tip_10_body.
  ///
  /// In en, this message translates to:
  /// **'Use gentle, non-comedogenic skincare products.'**
  String get skin_care_tip_10_body;

  /// No description provided for @prevention_tip_1_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention Tip 1'**
  String get prevention_tip_1_title;

  /// No description provided for @prevention_tip_1_body.
  ///
  /// In en, this message translates to:
  /// **'Get regular checkups to catch health issues early.'**
  String get prevention_tip_1_body;

  /// No description provided for @prevention_tip_2_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention Tip 2'**
  String get prevention_tip_2_title;

  /// No description provided for @prevention_tip_2_body.
  ///
  /// In en, this message translates to:
  /// **'Wash your hands frequently to avoid infections.'**
  String get prevention_tip_2_body;

  /// No description provided for @prevention_tip_3_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention Tip 3'**
  String get prevention_tip_3_title;

  /// No description provided for @prevention_tip_3_body.
  ///
  /// In en, this message translates to:
  /// **'Stay up to date with vaccinations.'**
  String get prevention_tip_3_body;

  /// No description provided for @prevention_tip_4_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention Tip 4'**
  String get prevention_tip_4_title;

  /// No description provided for @prevention_tip_4_body.
  ///
  /// In en, this message translates to:
  /// **'Maintain a healthy weight to prevent chronic illness.'**
  String get prevention_tip_4_body;

  /// No description provided for @prevention_tip_5_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention Tip 5'**
  String get prevention_tip_5_title;

  /// No description provided for @prevention_tip_5_body.
  ///
  /// In en, this message translates to:
  /// **'Wear a mask in crowded or high-risk areas.'**
  String get prevention_tip_5_body;

  /// No description provided for @prevention_tip_6_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention Tip 6'**
  String get prevention_tip_6_title;

  /// No description provided for @prevention_tip_6_body.
  ///
  /// In en, this message translates to:
  /// **'Manage stress to reduce the risk of heart disease.'**
  String get prevention_tip_6_body;

  /// No description provided for @prevention_tip_7_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention Tip 7'**
  String get prevention_tip_7_title;

  /// No description provided for @prevention_tip_7_body.
  ///
  /// In en, this message translates to:
  /// **'Know your family health history.'**
  String get prevention_tip_7_body;

  /// No description provided for @prevention_tip_8_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention Tip 8'**
  String get prevention_tip_8_title;

  /// No description provided for @prevention_tip_8_body.
  ///
  /// In en, this message translates to:
  /// **'Don\'t ignore unusual symptoms — consult a doctor.'**
  String get prevention_tip_8_body;

  /// No description provided for @prevention_tip_9_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention Tip 9'**
  String get prevention_tip_9_title;

  /// No description provided for @prevention_tip_9_body.
  ///
  /// In en, this message translates to:
  /// **'Limit alcohol and quit smoking for long-term health.'**
  String get prevention_tip_9_body;

  /// No description provided for @prevention_tip_10_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention Tip 10'**
  String get prevention_tip_10_title;

  /// No description provided for @prevention_tip_10_body.
  ///
  /// In en, this message translates to:
  /// **'Get enough sleep to support immune function.'**
  String get prevention_tip_10_body;

  /// No description provided for @lifestyle_tip_1_title.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tip 1'**
  String get lifestyle_tip_1_title;

  /// No description provided for @lifestyle_tip_1_body.
  ///
  /// In en, this message translates to:
  /// **'Start your day with 5 minutes of meditation.'**
  String get lifestyle_tip_1_body;

  /// No description provided for @lifestyle_tip_2_title.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tip 2'**
  String get lifestyle_tip_2_title;

  /// No description provided for @lifestyle_tip_2_body.
  ///
  /// In en, this message translates to:
  /// **'Replace sugary drinks with water or herbal tea.'**
  String get lifestyle_tip_2_body;

  /// No description provided for @lifestyle_tip_3_title.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tip 3'**
  String get lifestyle_tip_3_title;

  /// No description provided for @lifestyle_tip_3_body.
  ///
  /// In en, this message translates to:
  /// **'Take short breaks during work to stretch.'**
  String get lifestyle_tip_3_body;

  /// No description provided for @lifestyle_tip_4_title.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tip 4'**
  String get lifestyle_tip_4_title;

  /// No description provided for @lifestyle_tip_4_body.
  ///
  /// In en, this message translates to:
  /// **'Sleep at the same time every night for better rest.'**
  String get lifestyle_tip_4_body;

  /// No description provided for @lifestyle_tip_5_title.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tip 5'**
  String get lifestyle_tip_5_title;

  /// No description provided for @lifestyle_tip_5_body.
  ///
  /// In en, this message translates to:
  /// **'Spend time in nature weekly to boost your mood.'**
  String get lifestyle_tip_5_body;

  /// No description provided for @lifestyle_tip_6_title.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tip 6'**
  String get lifestyle_tip_6_title;

  /// No description provided for @lifestyle_tip_6_body.
  ///
  /// In en, this message translates to:
  /// **'Turn off screens 1 hour before sleep.'**
  String get lifestyle_tip_6_body;

  /// No description provided for @lifestyle_tip_7_title.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tip 7'**
  String get lifestyle_tip_7_title;

  /// No description provided for @lifestyle_tip_7_body.
  ///
  /// In en, this message translates to:
  /// **'Eat at regular times to balance energy.'**
  String get lifestyle_tip_7_body;

  /// No description provided for @lifestyle_tip_8_title.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tip 8'**
  String get lifestyle_tip_8_title;

  /// No description provided for @lifestyle_tip_8_body.
  ///
  /// In en, this message translates to:
  /// **'Write down 3 things you\'re thankful for daily.'**
  String get lifestyle_tip_8_body;

  /// No description provided for @lifestyle_tip_9_title.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tip 9'**
  String get lifestyle_tip_9_title;

  /// No description provided for @lifestyle_tip_9_body.
  ///
  /// In en, this message translates to:
  /// **'Keep your space tidy to clear your mind.'**
  String get lifestyle_tip_9_body;

  /// No description provided for @lifestyle_tip_10_title.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle Tip 10'**
  String get lifestyle_tip_10_title;

  /// No description provided for @lifestyle_tip_10_body.
  ///
  /// In en, this message translates to:
  /// **'Avoid multitasking to reduce stress and improve focus.'**
  String get lifestyle_tip_10_body;

  /// No description provided for @arm_scissors_name.
  ///
  /// In en, this message translates to:
  /// **'Arm Scissors'**
  String get arm_scissors_name;

  /// No description provided for @arm_scissors_description.
  ///
  /// In en, this message translates to:
  /// **'Arm scissors is a great way to work on shoulder and chest muscles.'**
  String get arm_scissors_description;

  /// No description provided for @incline_push_ups_name.
  ///
  /// In en, this message translates to:
  /// **'Incline Push-ups'**
  String get incline_push_ups_name;

  /// No description provided for @incline_push_ups_description.
  ///
  /// In en, this message translates to:
  /// **'Incline push-ups help strengthen your upper body with less strain.'**
  String get incline_push_ups_description;

  /// No description provided for @jumping_jacks_name.
  ///
  /// In en, this message translates to:
  /// **'Jumping Jacks'**
  String get jumping_jacks_name;

  /// No description provided for @jumping_jacks_description.
  ///
  /// In en, this message translates to:
  /// **'Jumping jacks are a great full-body warm-up and cardio exercise.'**
  String get jumping_jacks_description;

  /// No description provided for @knee_push_ups_name.
  ///
  /// In en, this message translates to:
  /// **'Knee Push-ups'**
  String get knee_push_ups_name;

  /// No description provided for @knee_push_ups_description.
  ///
  /// In en, this message translates to:
  /// **'Knee push-ups reduce strain and help build upper body strength.'**
  String get knee_push_ups_description;

  /// No description provided for @wide_arm_push_ups_name.
  ///
  /// In en, this message translates to:
  /// **'Wide Arm Push-ups'**
  String get wide_arm_push_ups_name;

  /// No description provided for @wide_arm_push_ups_description.
  ///
  /// In en, this message translates to:
  /// **'Wide arm push-ups focus more on the chest muscles.'**
  String get wide_arm_push_ups_description;

  /// No description provided for @quad_stretch_name.
  ///
  /// In en, this message translates to:
  /// **'Quad Stretch'**
  String get quad_stretch_name;

  /// No description provided for @quad_stretch_description.
  ///
  /// In en, this message translates to:
  /// **'Helps stretch and strengthen the quads.'**
  String get quad_stretch_description;

  /// No description provided for @side_lunges_name.
  ///
  /// In en, this message translates to:
  /// **'Side Lunges'**
  String get side_lunges_name;

  /// No description provided for @side_lunges_description.
  ///
  /// In en, this message translates to:
  /// **'Great for inner and outer thigh strength.'**
  String get side_lunges_description;

  /// No description provided for @standing_bicycle_crunches_name.
  ///
  /// In en, this message translates to:
  /// **'Standing Bicycle Crunches'**
  String get standing_bicycle_crunches_name;

  /// No description provided for @standing_bicycle_crunches_description.
  ///
  /// In en, this message translates to:
  /// **'Works your core while standing.'**
  String get standing_bicycle_crunches_description;

  /// No description provided for @standing_glute_kickbacks_name.
  ///
  /// In en, this message translates to:
  /// **'Standing Glute Kickbacks'**
  String get standing_glute_kickbacks_name;

  /// No description provided for @standing_glute_kickbacks_description.
  ///
  /// In en, this message translates to:
  /// **'Targets your glutes and hamstrings.'**
  String get standing_glute_kickbacks_description;

  /// No description provided for @standing_hip_circle_name.
  ///
  /// In en, this message translates to:
  /// **'Standing Hip Circle'**
  String get standing_hip_circle_name;

  /// No description provided for @standing_hip_circle_description.
  ///
  /// In en, this message translates to:
  /// **'Loosens and strengthens the hip area.'**
  String get standing_hip_circle_description;

  /// No description provided for @standing_knee_to_chest_name.
  ///
  /// In en, this message translates to:
  /// **'Standing Knee to Chest'**
  String get standing_knee_to_chest_name;

  /// No description provided for @standing_knee_to_chest_description.
  ///
  /// In en, this message translates to:
  /// **'Improves balance and hip mobility.'**
  String get standing_knee_to_chest_description;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get shareApp;

  /// No description provided for @thinness.
  ///
  /// In en, this message translates to:
  /// **'Thinness'**
  String get thinness;

  /// No description provided for @obesity.
  ///
  /// In en, this message translates to:
  /// **'Obesity'**
  String get obesity;

  /// No description provided for @rickets.
  ///
  /// In en, this message translates to:
  /// **'Rickets'**
  String get rickets;

  /// No description provided for @type2_diabetes.
  ///
  /// In en, this message translates to:
  /// **'Type 2 Diabetes'**
  String get type2_diabetes;

  /// No description provided for @water_intake.
  ///
  /// In en, this message translates to:
  /// **'Water Intake'**
  String get water_intake;

  /// No description provided for @add_water.
  ///
  /// In en, this message translates to:
  /// **'Add Water'**
  String get add_water;

  /// No description provided for @complete_plan.
  ///
  /// In en, this message translates to:
  /// **'Complete Plan'**
  String get complete_plan;

  /// No description provided for @stomach_bacteria.
  ///
  /// In en, this message translates to:
  /// **'Stomach Bacteria'**
  String get stomach_bacteria;

  /// No description provided for @consultDoctor.
  ///
  /// In en, this message translates to:
  /// **'Please consult your specialist doctor.'**
  String get consultDoctor;

  /// No description provided for @aboutUsTitle.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUsTitle;

  /// No description provided for @aboutUsDescription.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Fun Food!\n\nAt Fun Food, we believe that achieving your health goals should be an enjoyable journey, not a stressful one.\nOur app is designed to help you lose weight, gain weight, stay fit, and embrace a healthier lifestyle — all in a fun and easy way!\n\nWe offer you:\n- Personalized meal plans for healthy eating.\n- Customized workout programs tailored to your goals.\n- Expert tips for sustainable weight management.\n- A supportive community that motivates you every step of the way.\n\nWhether you want to slim down, bulk up, or simply live a healthier life, Fun Food is your trusted companion.\nStart your journey with us today — because taking care of your body should always be fun!'**
  String get aboutUsDescription;

  /// No description provided for @no_internet_message.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection'**
  String get no_internet_message;

  /// No description provided for @hypertension.
  ///
  /// In en, this message translates to:
  /// **'Hypertension'**
  String get hypertension;

  /// No description provided for @heart_disease.
  ///
  /// In en, this message translates to:
  /// **'Heart Disease'**
  String get heart_disease;

  /// No description provided for @insulin_resistance.
  ///
  /// In en, this message translates to:
  /// **'Insulin Resistance'**
  String get insulin_resistance;

  /// No description provided for @pcos.
  ///
  /// In en, this message translates to:
  /// **'Polycystic Ovary Syndrome (PCOS)'**
  String get pcos;

  /// No description provided for @loginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get loginWithGoogle;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueAsGuest;

  /// No description provided for @googleSignInFailed.
  ///
  /// In en, this message translates to:
  /// **'Google Sign-In Failed'**
  String get googleSignInFailed;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, {name}'**
  String welcomeBack(Object name);

  /// No description provided for @selectLanguageFirst.
  ///
  /// In en, this message translates to:
  /// **'Please select a language first.'**
  String get selectLanguageFirst;

  /// No description provided for @lossExercises.
  ///
  /// In en, this message translates to:
  /// **'Loss Exercises'**
  String get lossExercises;

  /// No description provided for @askYourDoctor.
  ///
  /// In en, this message translates to:
  /// **'Ask your doctor'**
  String get askYourDoctor;

  /// No description provided for @noDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noDataAvailable;

  /// No description provided for @noMealsSelected.
  ///
  /// In en, this message translates to:
  /// **'No meals have been selected yet'**
  String get noMealsSelected;

  /// No description provided for @caloriesDisplay.
  ///
  /// In en, this message translates to:
  /// **'Calories: {cal} kcal'**
  String caloriesDisplay(Object cal);

  /// No description provided for @completeTitle.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get completeTitle;

  /// No description provided for @videoErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get videoErrorTitle;

  /// No description provided for @videoErrorContent.
  ///
  /// In en, this message translates to:
  /// **'Could not play the video. Please check the file path.'**
  String get videoErrorContent;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @exerciseDoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercise Done!'**
  String get exerciseDoneTitle;

  /// No description provided for @exerciseDoneContent.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have completed the required sets.'**
  String get exerciseDoneContent;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @exerciseTimerDoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercise Done!'**
  String get exerciseTimerDoneTitle;

  /// No description provided for @exerciseTimerDoneContent.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have completed the exercise successfully.'**
  String get exerciseTimerDoneContent;

  /// No description provided for @secondsRemaining.
  ///
  /// In en, this message translates to:
  /// **'{seconds} seconds remaining'**
  String secondsRemaining(Object seconds);

  /// No description provided for @repetitionProgress.
  ///
  /// In en, this message translates to:
  /// **'Rep {current} of {total}'**
  String repetitionProgress(Object current, Object total);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
