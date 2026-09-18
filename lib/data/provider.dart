import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model.dart';

class UserOnboardingProvider with ChangeNotifier {
  final UserOnboardingData _data = UserOnboardingData();

  UserOnboardingData get data => _data;

  void setGoal(String goal) {
    _data.goal = goal;
    notifyListeners();
  }

  void setWeeklyIncreaseRate(double rate) {
    _data.weeklyIncreaseRate = rate;
    notifyListeners();
  }

  void setWeeklyDecreaseRate(double rate) {
    _data.weeklyDecreaseRate = rate;
    notifyListeners();
  }

  void setGender(String gender) {
    _data.gender = gender;
    notifyListeners();
  }

  void setAge(int age) {
    _data.age = age;
    notifyListeners();
  }

  void setHeight(double height) {
    _data.height = height;
    notifyListeners();
  }

  void setWeight(double weight) {
    _data.weight = weight;
    notifyListeners();
  }

  void setHasHealthCondition(bool hasCondition) {
    _data.hasHealthCondition = hasCondition;
    notifyListeners();
  }

  void setSelectedDisease(String? disease) {
    _data.selectedDisease = disease;
    notifyListeners();
  }

  void setFoodPreference(String preference) {
    _data.foodPreference = preference;
    notifyListeners();
  }

  void setActivityLevel(String level) {
    _data.activityLevel = level;
    notifyListeners();
  }

  void setCalories(double calories) {
    _data.calories = calories;
    notifyListeners();
  }

  Future<void> fetchUserDataFromFirestore(String docId) async {
    final doc = await FirebaseFirestore.instance.collection('user_plans').doc(docId).get();
    if (doc.exists) {
      final data = doc.data()!;
      _data.documentId = docId;
      _data.goal = data['goal'];
      _data.weeklyIncreaseRate = (data['weeklyIncreaseRate'] ?? 0).toDouble();
      _data.weeklyDecreaseRate = (data['weeklyDecreaseRate'] ?? 0).toDouble();
      _data.gender = data['gender'];
      _data.age = data['age'];
      _data.height = (data['height'] ?? 0).toDouble();
      _data.weight = (data['weight'] ?? 0).toDouble();
      _data.hasHealthCondition = data['hasHealthCondition'];
      _data.selectedDisease = data['selectedDisease'];
      _data.foodPreference = data['foodPreference'];
      _data.activityLevel = data['activityLevel'];
      await _resetTodayWater(); // ✅ تصفير المياه عند تحميل خطة مستخدم جديدة
      notifyListeners(); // مهم جداً
    }
  }

  void clearAll() {
    _data.clear();
    notifyListeners();
  }

  // ✅ دالة تصفير المياه عند تحميل مستخدم جديد
  Future<void> _resetTodayWater() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();
    final key = "water-${_data.documentId ?? 'defaultUser'}-${today.year}-${today.month}-${today.day}";
    await prefs.setInt(key, 0);
  }
}
