class UserOnboardingData {
  String? documentId; // ✅ جديد
  String? goal;
  double? weeklyIncreaseRate;
  double? weeklyDecreaseRate;
  String? gender;
  int? age;
  double? height;
  double? weight;
  bool? hasHealthCondition;
  String? selectedDisease;
  String? foodPreference;
  double? weeklyRate;
  String? activityLevel; // ✅
  double? calories; // ✅ جديد
  String? planDescription;
  String? nutritionPlan;
  String? exercisePlan;
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (goal != null) data['goal'] = goal;
    if (weeklyIncreaseRate != null) data['weeklyIncreaseRate'] = weeklyIncreaseRate;
    if (weeklyDecreaseRate != null) data['weeklyDecreaseRate'] = weeklyDecreaseRate;
    if (gender != null) data['gender'] = gender;
    if (age != null) data['age'] = age;
    if (height != null) data['height'] = height;
    if (weight != null) data['weight'] = weight;
    if (hasHealthCondition != null) data['hasHealthCondition'] = hasHealthCondition;
    if (selectedDisease != null) data['selectedDisease'] = selectedDisease;
    if (foodPreference != null) data['foodPreference'] = foodPreference;
    if (activityLevel != null) data['activityLevel'] = activityLevel;
    if (calories != null) data['calories'] = calories;

    return data;
  }

  void clear() {
    documentId = null;
    goal = null;
    weeklyIncreaseRate = null;
    weeklyDecreaseRate = null;
    gender = null;
    age = null;
    height = null;
    weight = null;
    hasHealthCondition = null;
    selectedDisease = null;
    foodPreference = null;
    activityLevel = null;
    calories = null;
  }
}
