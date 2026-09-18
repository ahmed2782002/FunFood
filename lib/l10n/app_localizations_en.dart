// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get doYouAlreadyHaveAnAccount => 'Do you already have an account?';

  @override
  String get no_not_yet => 'No, not yet.';

  @override
  String get yes_I_have_an_account => 'Yes I have an account';

  @override
  String get yourGoalFromTheApp => 'Your goal from the application';

  @override
  String get whatIsYourMainGoal => 'What is your main goal?';

  @override
  String get goalInfoHint =>
      'This information helps us customize your user\nexperience to suit your needs.';

  @override
  String get pleaseSelectGoal => 'Please select your goal to continue';

  @override
  String get ccontinue => 'Continue';

  @override
  String get lossWeight => 'Loss weight';

  @override
  String get maintainWeight => 'Maintain weight';

  @override
  String get gainWeight => 'Gain weight';

  @override
  String get buildingMuscles => 'Building muscles';

  @override
  String get weekly_increase_title => 'Weekly increase rates';

  @override
  String increase_kilograms(Object kg) {
    return 'Increase $kg kilograms';
  }

  @override
  String get select_rate_warning =>
      'Please select a weekly increase rate to continue';

  @override
  String get weeklyDecreaseRate => 'Weekly decrease rate';

  @override
  String get pleaseSelectRate =>
      'Please select a weekly decrease rate to continue';

  @override
  String get lose => 'Lose';

  @override
  String get kgPerWeek => 'KG/week';

  @override
  String get whatAboutYou => 'What about you';

  @override
  String get selectYourGender => 'Please select your gender';

  @override
  String get genderInfoHint =>
      'This information will help us calculate your weight.';

  @override
  String get enterYourAge => 'Enter your age';

  @override
  String get selectGenderToContinue => 'Please select your gender to continue';

  @override
  String get enterValidAge => 'Please enter a valid age between 1 and 120';

  @override
  String get man => 'Man';

  @override
  String get woman => 'Woman';

  @override
  String get your_daily_activity_level => 'Your Daily Activity Level';

  @override
  String get what_is_your_daily_activity_level =>
      'What is your daily activity level?';

  @override
  String get daily_activity_level_hint =>
      'This helps us determine your calorie needs.\nChoose the level that best fits your routine.';

  @override
  String get please_select_activity =>
      'Please select your activity level to continue';

  @override
  String get sedentary_or_minimal => 'Sedentary or minimal';

  @override
  String get light => 'Light';

  @override
  String get moderate => 'Moderate';

  @override
  String get good_activity => 'Good activity';

  @override
  String get high => 'High';

  @override
  String get inform_health_condition =>
      'Please inform us about your health condition.';

  @override
  String get suffer_any_disease =>
      'Do you suffer from any diseases that require a special diet?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get continue_button => 'Continue';

  @override
  String get please_select_health_condition =>
      'Please select your health condition to continue';

  @override
  String get what_about_you => 'What about you';

  @override
  String get diseases_title => 'Diseases';

  @override
  String get diabetes => 'Diabetes';

  @override
  String get high_blood_pressure => 'High Blood Pressure\n(Hypertension)';

  @override
  String get nutritional_deficiency => 'Nutritional Deficiency';

  @override
  String get anemia => 'Anemia';

  @override
  String get please_select_disease => 'Please select one disease to continue';

  @override
  String get what_is_your_weight => 'What is your weight?';

  @override
  String get kg_unit => 'kg';

  @override
  String get lb_unit => 'lb';

  @override
  String get what_is_your_height => 'What is your height?';

  @override
  String get cm_unit => 'cm';

  @override
  String get m_unit => 'm';

  @override
  String get what_kind_of_food => 'What kind of food do you like?';

  @override
  String get vegetarian_label => 'Vegetarian';

  @override
  String get varied_diet_label => 'Varied diet';

  @override
  String get select_food_warning => 'Please select a food preference.';

  @override
  String get physical_level_summary => 'Summary of your physical level';

  @override
  String get mass_factor => 'Mass factor';

  @override
  String get bmi_label => 'Your own rate BMI';

  @override
  String get healthy_weight => 'Healthy weight';

  @override
  String get your_plan_based_on_data => 'Your plan based on your data:';

  @override
  String get your_goal => 'Your Goal';

  @override
  String get current_weight => 'Current Weight';

  @override
  String get current_height => 'Current Height';

  @override
  String get health_condition => 'Health Condition';

  @override
  String get start_plan => 'Start your plan now';

  @override
  String get firebase_error => 'Error uploading to Firebase:';

  @override
  String get firebase_upload_error_message =>
      'An error occurred while uploading the data';

  @override
  String get home => 'Home';

  @override
  String get complete => 'Complete';

  @override
  String get articles => 'Articles';

  @override
  String get settings => 'Settings';

  @override
  String get yourPlanIsReady => 'Your plan is ready';

  @override
  String get noInternetConnection => 'Please check your internet connection';

  @override
  String get endDate => 'End Date';

  @override
  String get startDate => 'Start Date';

  @override
  String dailyCalories(Object calories) {
    return 'Daily Calories: $calories kcal';
  }

  @override
  String genderAndAge(Object age, Object gender) {
    return 'Gender: $gender | Age: $age';
  }

  @override
  String height(Object height) {
    return 'Height: $height cm';
  }

  @override
  String weight(Object weight) {
    return 'Weight: $weight kg';
  }

  @override
  String healthCondition(Object condition) {
    return 'Health Condition: $condition';
  }

  @override
  String get continueLabel => 'Continue';

  @override
  String get todaySteps => 'Today\'s Steps';

  @override
  String get diet => 'Diet';

  @override
  String get calories => 'Calories';

  @override
  String get wweight => 'Weight';

  @override
  String get exercises => 'Exercises';

  @override
  String get exercisesPage => 'Exercises Page';

  @override
  String get permissionMessage =>
      'Access to the steps account must be allowed.';

  @override
  String get underweight => 'Underweight';

  @override
  String get overweight => 'Overweight';

  @override
  String get obese => 'Obese';

  @override
  String goalGainWeight(Object rate, Object target, Object weeks) {
    return 'Your goal is to gain $rate kg/week. Your target weight is $target kg over $weeks.';
  }

  @override
  String goalLoseWeight(Object rate, Object target, Object weeks) {
    return 'Your goal is to lose $rate kg/week. Your target weight is $target kg over $weeks.';
  }

  @override
  String goalStayFit(Object weeks) {
    return 'Your plan is to maintain your current fitness level for $weeks.';
  }

  @override
  String goalBuildMuscle(Object weeks) {
    return 'Your plan focuses on building muscle over $weeks.';
  }

  @override
  String get bmiUnderweight => 'Note: Your BMI is considered underweight.';

  @override
  String get bmiHealthy => 'Great! Your BMI is in the healthy range.';

  @override
  String get bmiOverweight => 'Note: Your BMI is considered overweight.';

  @override
  String specialCareCondition(Object condition) {
    return 'Because of your health condition ($condition), your plan has been adjusted.';
  }

  @override
  String get weeksLabel => 'weeks';

  @override
  String get profile => 'Profile';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get aboutUs => 'About us';

  @override
  String get logout => 'Log out';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get weight_update_failed => 'Plan not found to save weight';

  @override
  String get changePlan => 'Change Diet Plan';

  @override
  String get todayMeal => 'Today\'s Meal';

  @override
  String get water => 'Water';

  @override
  String get caloriesProgress => 'Calories Progress';

  @override
  String get targetReached => 'Target Reached!';

  @override
  String get keepGoing => 'Keep Going!';

  @override
  String get health_categories => 'Health Categories';

  @override
  String get hydration => 'Hydration';

  @override
  String get sleep_recovery => 'Sleep & Recovery';

  @override
  String get nutrition => 'Nutrition';

  @override
  String get exercise_movement => 'Exercise & Movement';

  @override
  String get mental_health => 'Mental Health';

  @override
  String get skin_oral_care => 'Skin & Oral Care';

  @override
  String get health_prevention => 'Health Prevention';

  @override
  String get lifestyle_tips => 'Lifestyle Tips';

  @override
  String get hydration_tip_1_title => 'Hydration Tip 1';

  @override
  String get hydration_tip_1_body =>
      'Start your morning with a glass of water to activate your metabolism.';

  @override
  String get hydration_tip_2_title => 'Hydration Tip 2';

  @override
  String get hydration_tip_2_body =>
      'Drink at least 8 glasses of water daily for better skin and energy.';

  @override
  String get hydration_tip_3_title => 'Hydration Tip 3';

  @override
  String get hydration_tip_3_body =>
      'Add a slice of lemon to your water for a vitamin C boost.';

  @override
  String get hydration_tip_4_title => 'Hydration Tip 4';

  @override
  String get hydration_tip_4_body =>
      'Avoid sugary drinks and replace them with infused water.';

  @override
  String get hydration_tip_5_title => 'Hydration Tip 5';

  @override
  String get hydration_tip_5_body =>
      'Use a water reminder app to stay consistently hydrated.';

  @override
  String get hydration_tip_6_title => 'Hydration Tip 6';

  @override
  String get hydration_tip_6_body =>
      'Drink water before meals to aid digestion and control appetite.';

  @override
  String get hydration_tip_7_title => 'Hydration Tip 7';

  @override
  String get hydration_tip_7_body =>
      'Keep a reusable bottle with you to sip throughout the day.';

  @override
  String get hydration_tip_8_title => 'Hydration Tip 8';

  @override
  String get hydration_tip_8_body =>
      'Coconut water is a natural source of electrolytes — use it after workouts.';

  @override
  String get hydration_tip_9_title => 'Hydration Tip 9';

  @override
  String get hydration_tip_9_body =>
      'Limit caffeine intake to prevent dehydration.';

  @override
  String get hydration_tip_10_title => 'Hydration Tip 10';

  @override
  String get hydration_tip_10_body =>
      'Eat water-rich fruits like watermelon and cucumber.';

  @override
  String get sleep_tip_1_title => 'Sleep Tip 1';

  @override
  String get sleep_tip_1_body =>
      'Maintain a consistent sleep schedule for better rest.';

  @override
  String get sleep_tip_2_title => 'Sleep Tip 2';

  @override
  String get sleep_tip_2_body =>
      'Avoid screens at least 1 hour before bedtime.';

  @override
  String get sleep_tip_3_title => 'Sleep Tip 3';

  @override
  String get sleep_tip_3_body =>
      'Create a dark, cool environment to improve sleep quality.';

  @override
  String get sleep_tip_4_title => 'Sleep Tip 4';

  @override
  String get sleep_tip_4_body =>
      'Use a sleep tracker to monitor your sleep patterns.';

  @override
  String get sleep_tip_5_title => 'Sleep Tip 5';

  @override
  String get sleep_tip_5_body => 'Avoid heavy meals and caffeine before bed.';

  @override
  String get sleep_tip_6_title => 'Sleep Tip 6';

  @override
  String get sleep_tip_6_body =>
      'Practice deep breathing or meditation before sleep.';

  @override
  String get sleep_tip_7_title => 'Sleep Tip 7';

  @override
  String get sleep_tip_7_body => 'Keep your bedroom quiet and clutter-free.';

  @override
  String get sleep_tip_8_title => 'Sleep Tip 8';

  @override
  String get sleep_tip_8_body =>
      'Try reading a book to relax your mind before sleep.';

  @override
  String get sleep_tip_9_title => 'Sleep Tip 9';

  @override
  String get sleep_tip_9_body =>
      'Get exposure to natural light during the day.';

  @override
  String get sleep_tip_10_title => 'Sleep Tip 10';

  @override
  String get sleep_tip_10_body =>
      'Avoid long naps that can disturb night sleep.';

  @override
  String get nutrition_tip_1_title => 'Nutrition Tip 1';

  @override
  String get nutrition_tip_1_body =>
      'Eat a rainbow of fruits and vegetables for a variety of nutrients.';

  @override
  String get nutrition_tip_2_title => 'Nutrition Tip 2';

  @override
  String get nutrition_tip_2_body =>
      'Limit processed food and focus on whole ingredients.';

  @override
  String get nutrition_tip_3_title => 'Nutrition Tip 3';

  @override
  String get nutrition_tip_3_body =>
      'Include protein in every meal to stay full longer.';

  @override
  String get nutrition_tip_4_title => 'Nutrition Tip 4';

  @override
  String get nutrition_tip_4_body =>
      'Read food labels to avoid added sugars and trans fats.';

  @override
  String get nutrition_tip_5_title => 'Nutrition Tip 5';

  @override
  String get nutrition_tip_5_body => 'Choose whole grains over refined carbs.';

  @override
  String get nutrition_tip_6_title => 'Nutrition Tip 6';

  @override
  String get nutrition_tip_6_body =>
      'Plan your meals ahead to avoid unhealthy snacking.';

  @override
  String get nutrition_tip_7_title => 'Nutrition Tip 7';

  @override
  String get nutrition_tip_7_body =>
      'Use smaller plates to control portion sizes.';

  @override
  String get nutrition_tip_8_title => 'Nutrition Tip 8';

  @override
  String get nutrition_tip_8_body =>
      'Drink water before and during meals to help digestion.';

  @override
  String get nutrition_tip_9_title => 'Nutrition Tip 9';

  @override
  String get nutrition_tip_9_body =>
      'Limit added salt and season with herbs and spices.';

  @override
  String get nutrition_tip_10_title => 'Nutrition Tip 10';

  @override
  String get nutrition_tip_10_body =>
      'Practice mindful eating by chewing slowly and avoiding distractions.';

  @override
  String get exercise_tip_1_title => 'Exercise Tip 1';

  @override
  String get exercise_tip_1_body =>
      'Take a 10-minute walk after meals to aid digestion.';

  @override
  String get exercise_tip_2_title => 'Exercise Tip 2';

  @override
  String get exercise_tip_2_body =>
      'Stretch daily to improve flexibility and reduce injury.';

  @override
  String get exercise_tip_3_title => 'Exercise Tip 3';

  @override
  String get exercise_tip_3_body =>
      'Incorporate strength training twice a week for muscle health.';

  @override
  String get exercise_tip_4_title => 'Exercise Tip 4';

  @override
  String get exercise_tip_4_body =>
      'Use stairs instead of elevators to increase daily movement.';

  @override
  String get exercise_tip_5_title => 'Exercise Tip 5';

  @override
  String get exercise_tip_5_body =>
      'Try short home workouts if you\'re short on time.';

  @override
  String get exercise_tip_6_title => 'Exercise Tip 6';

  @override
  String get exercise_tip_6_body =>
      'Set movement reminders if you sit for long periods.';

  @override
  String get exercise_tip_7_title => 'Exercise Tip 7';

  @override
  String get exercise_tip_7_body =>
      'Find a workout buddy for motivation and accountability.';

  @override
  String get exercise_tip_8_title => 'Exercise Tip 8';

  @override
  String get exercise_tip_8_body =>
      'Choose enjoyable physical activities to stay consistent.';

  @override
  String get exercise_tip_9_title => 'Exercise Tip 9';

  @override
  String get exercise_tip_9_body =>
      'Warm up before and cool down after workouts.';

  @override
  String get exercise_tip_10_title => 'Exercise Tip 10';

  @override
  String get exercise_tip_10_body =>
      'Track your activity to monitor progress over time.';

  @override
  String get mental_health_tip_1_title => 'Mental Health Tip 1';

  @override
  String get mental_health_tip_1_body =>
      'Start a gratitude journal to boost your mood daily.';

  @override
  String get mental_health_tip_2_title => 'Mental Health Tip 2';

  @override
  String get mental_health_tip_2_body =>
      'Practice mindfulness for 5 minutes each morning.';

  @override
  String get mental_health_tip_3_title => 'Mental Health Tip 3';

  @override
  String get mental_health_tip_3_body =>
      'Talk to a friend or therapist when feeling overwhelmed.';

  @override
  String get mental_health_tip_4_title => 'Mental Health Tip 4';

  @override
  String get mental_health_tip_4_body =>
      'Take breaks from social media to improve focus.';

  @override
  String get mental_health_tip_5_title => 'Mental Health Tip 5';

  @override
  String get mental_health_tip_5_body =>
      'Engage in hobbies that make you feel good.';

  @override
  String get mental_health_tip_6_title => 'Mental Health Tip 6';

  @override
  String get mental_health_tip_6_body =>
      'Set boundaries to protect your mental space.';

  @override
  String get mental_health_tip_7_title => 'Mental Health Tip 7';

  @override
  String get mental_health_tip_7_body =>
      'Declutter your space to reduce mental stress.';

  @override
  String get mental_health_tip_8_title => 'Mental Health Tip 8';

  @override
  String get mental_health_tip_8_body =>
      'Laugh daily — it\'s powerful medicine.';

  @override
  String get mental_health_tip_9_title => 'Mental Health Tip 9';

  @override
  String get mental_health_tip_9_body =>
      'Accept your emotions without judgment.';

  @override
  String get mental_health_tip_10_title => 'Mental Health Tip 10';

  @override
  String get mental_health_tip_10_body =>
      'Sleep and nutrition directly affect your mental health — don\'t ignore them.';

  @override
  String get skin_care_tip_1_title => 'Care Tip 1';

  @override
  String get skin_care_tip_1_body =>
      'Wash your face twice a day to remove dirt and oil.';

  @override
  String get skin_care_tip_2_title => 'Care Tip 2';

  @override
  String get skin_care_tip_2_body =>
      'Use sunscreen daily to protect your skin from UV damage.';

  @override
  String get skin_care_tip_3_title => 'Care Tip 3';

  @override
  String get skin_care_tip_3_body =>
      'Brush your teeth at least twice a day and floss regularly.';

  @override
  String get skin_care_tip_4_title => 'Care Tip 4';

  @override
  String get skin_care_tip_4_body =>
      'Drink more water to maintain healthy, glowing skin.';

  @override
  String get skin_care_tip_5_title => 'Care Tip 5';

  @override
  String get skin_care_tip_5_body =>
      'Avoid touching your face to reduce acne risk.';

  @override
  String get skin_care_tip_6_title => 'Care Tip 6';

  @override
  String get skin_care_tip_6_body =>
      'Use a moisturizer suited for your skin type.';

  @override
  String get skin_care_tip_7_title => 'Care Tip 7';

  @override
  String get skin_care_tip_7_body =>
      'Visit a dentist every 6 months for a checkup.';

  @override
  String get skin_care_tip_8_title => 'Care Tip 8';

  @override
  String get skin_care_tip_8_body =>
      'Limit sugary snacks to protect your teeth from cavities.';

  @override
  String get skin_care_tip_9_title => 'Care Tip 9';

  @override
  String get skin_care_tip_9_body =>
      'Clean your tongue daily to maintain oral hygiene.';

  @override
  String get skin_care_tip_10_title => 'Care Tip 10';

  @override
  String get skin_care_tip_10_body =>
      'Use gentle, non-comedogenic skincare products.';

  @override
  String get prevention_tip_1_title => 'Prevention Tip 1';

  @override
  String get prevention_tip_1_body =>
      'Get regular checkups to catch health issues early.';

  @override
  String get prevention_tip_2_title => 'Prevention Tip 2';

  @override
  String get prevention_tip_2_body =>
      'Wash your hands frequently to avoid infections.';

  @override
  String get prevention_tip_3_title => 'Prevention Tip 3';

  @override
  String get prevention_tip_3_body => 'Stay up to date with vaccinations.';

  @override
  String get prevention_tip_4_title => 'Prevention Tip 4';

  @override
  String get prevention_tip_4_body =>
      'Maintain a healthy weight to prevent chronic illness.';

  @override
  String get prevention_tip_5_title => 'Prevention Tip 5';

  @override
  String get prevention_tip_5_body =>
      'Wear a mask in crowded or high-risk areas.';

  @override
  String get prevention_tip_6_title => 'Prevention Tip 6';

  @override
  String get prevention_tip_6_body =>
      'Manage stress to reduce the risk of heart disease.';

  @override
  String get prevention_tip_7_title => 'Prevention Tip 7';

  @override
  String get prevention_tip_7_body => 'Know your family health history.';

  @override
  String get prevention_tip_8_title => 'Prevention Tip 8';

  @override
  String get prevention_tip_8_body =>
      'Don\'t ignore unusual symptoms — consult a doctor.';

  @override
  String get prevention_tip_9_title => 'Prevention Tip 9';

  @override
  String get prevention_tip_9_body =>
      'Limit alcohol and quit smoking for long-term health.';

  @override
  String get prevention_tip_10_title => 'Prevention Tip 10';

  @override
  String get prevention_tip_10_body =>
      'Get enough sleep to support immune function.';

  @override
  String get lifestyle_tip_1_title => 'Lifestyle Tip 1';

  @override
  String get lifestyle_tip_1_body =>
      'Start your day with 5 minutes of meditation.';

  @override
  String get lifestyle_tip_2_title => 'Lifestyle Tip 2';

  @override
  String get lifestyle_tip_2_body =>
      'Replace sugary drinks with water or herbal tea.';

  @override
  String get lifestyle_tip_3_title => 'Lifestyle Tip 3';

  @override
  String get lifestyle_tip_3_body =>
      'Take short breaks during work to stretch.';

  @override
  String get lifestyle_tip_4_title => 'Lifestyle Tip 4';

  @override
  String get lifestyle_tip_4_body =>
      'Sleep at the same time every night for better rest.';

  @override
  String get lifestyle_tip_5_title => 'Lifestyle Tip 5';

  @override
  String get lifestyle_tip_5_body =>
      'Spend time in nature weekly to boost your mood.';

  @override
  String get lifestyle_tip_6_title => 'Lifestyle Tip 6';

  @override
  String get lifestyle_tip_6_body => 'Turn off screens 1 hour before sleep.';

  @override
  String get lifestyle_tip_7_title => 'Lifestyle Tip 7';

  @override
  String get lifestyle_tip_7_body => 'Eat at regular times to balance energy.';

  @override
  String get lifestyle_tip_8_title => 'Lifestyle Tip 8';

  @override
  String get lifestyle_tip_8_body =>
      'Write down 3 things you\'re thankful for daily.';

  @override
  String get lifestyle_tip_9_title => 'Lifestyle Tip 9';

  @override
  String get lifestyle_tip_9_body => 'Keep your space tidy to clear your mind.';

  @override
  String get lifestyle_tip_10_title => 'Lifestyle Tip 10';

  @override
  String get lifestyle_tip_10_body =>
      'Avoid multitasking to reduce stress and improve focus.';

  @override
  String get arm_scissors_name => 'Arm Scissors';

  @override
  String get arm_scissors_description =>
      'Arm scissors is a great way to work on shoulder and chest muscles.';

  @override
  String get incline_push_ups_name => 'Incline Push-ups';

  @override
  String get incline_push_ups_description =>
      'Incline push-ups help strengthen your upper body with less strain.';

  @override
  String get jumping_jacks_name => 'Jumping Jacks';

  @override
  String get jumping_jacks_description =>
      'Jumping jacks are a great full-body warm-up and cardio exercise.';

  @override
  String get knee_push_ups_name => 'Knee Push-ups';

  @override
  String get knee_push_ups_description =>
      'Knee push-ups reduce strain and help build upper body strength.';

  @override
  String get wide_arm_push_ups_name => 'Wide Arm Push-ups';

  @override
  String get wide_arm_push_ups_description =>
      'Wide arm push-ups focus more on the chest muscles.';

  @override
  String get quad_stretch_name => 'Quad Stretch';

  @override
  String get quad_stretch_description =>
      'Helps stretch and strengthen the quads.';

  @override
  String get side_lunges_name => 'Side Lunges';

  @override
  String get side_lunges_description =>
      'Great for inner and outer thigh strength.';

  @override
  String get standing_bicycle_crunches_name => 'Standing Bicycle Crunches';

  @override
  String get standing_bicycle_crunches_description =>
      'Works your core while standing.';

  @override
  String get standing_glute_kickbacks_name => 'Standing Glute Kickbacks';

  @override
  String get standing_glute_kickbacks_description =>
      'Targets your glutes and hamstrings.';

  @override
  String get standing_hip_circle_name => 'Standing Hip Circle';

  @override
  String get standing_hip_circle_description =>
      'Loosens and strengthens the hip area.';

  @override
  String get standing_knee_to_chest_name => 'Standing Knee to Chest';

  @override
  String get standing_knee_to_chest_description =>
      'Improves balance and hip mobility.';

  @override
  String get shareApp => 'Share App';

  @override
  String get thinness => 'Thinness';

  @override
  String get obesity => 'Obesity';

  @override
  String get rickets => 'Rickets';

  @override
  String get type2_diabetes => 'Type 2 Diabetes';

  @override
  String get water_intake => 'Water Intake';

  @override
  String get add_water => 'Add Water';

  @override
  String get complete_plan => 'Complete Plan';

  @override
  String get stomach_bacteria => 'Stomach Bacteria';

  @override
  String get consultDoctor => 'Please consult your specialist doctor.';

  @override
  String get aboutUsTitle => 'About Us';

  @override
  String get aboutUsDescription =>
      'Welcome to Fun Food!\n\nAt Fun Food, we believe that achieving your health goals should be an enjoyable journey, not a stressful one.\nOur app is designed to help you lose weight, gain weight, stay fit, and embrace a healthier lifestyle — all in a fun and easy way!\n\nWe offer you:\n- Personalized meal plans for healthy eating.\n- Customized workout programs tailored to your goals.\n- Expert tips for sustainable weight management.\n- A supportive community that motivates you every step of the way.\n\nWhether you want to slim down, bulk up, or simply live a healthier life, Fun Food is your trusted companion.\nStart your journey with us today — because taking care of your body should always be fun!';

  @override
  String get no_internet_message => 'Check your internet connection';

  @override
  String get hypertension => 'Hypertension';

  @override
  String get heart_disease => 'Heart Disease';

  @override
  String get insulin_resistance => 'Insulin Resistance';

  @override
  String get pcos => 'Polycystic Ovary Syndrome (PCOS)';

  @override
  String get loginWithGoogle => 'Login with Google';

  @override
  String get continueAsGuest => 'Continue as guest';

  @override
  String get googleSignInFailed => 'Google Sign-In Failed';

  @override
  String welcomeBack(Object name) {
    return 'Welcome back, $name';
  }

  @override
  String get selectLanguageFirst => 'Please select a language first.';

  @override
  String get lossExercises => 'Loss Exercises';

  @override
  String get askYourDoctor => 'Ask your doctor';

  @override
  String get noDataAvailable => 'No data available';

  @override
  String get noMealsSelected => 'No meals have been selected yet';

  @override
  String caloriesDisplay(Object cal) {
    return 'Calories: $cal kcal';
  }

  @override
  String get completeTitle => 'Complete';

  @override
  String get videoErrorTitle => 'Error';

  @override
  String get videoErrorContent =>
      'Could not play the video. Please check the file path.';

  @override
  String get ok => 'OK';

  @override
  String get exerciseDoneTitle => 'Exercise Done!';

  @override
  String get exerciseDoneContent =>
      'Well done! You have completed the required sets.';

  @override
  String get back => 'Back';

  @override
  String get exerciseTimerDoneTitle => 'Exercise Done!';

  @override
  String get exerciseTimerDoneContent =>
      'Well done! You have completed the exercise successfully.';

  @override
  String secondsRemaining(Object seconds) {
    return '$seconds seconds remaining';
  }

  @override
  String repetitionProgress(Object current, Object total) {
    return 'Rep $current of $total';
  }
}
