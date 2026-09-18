import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/provider.dart';
import '../../l10n/app_localizations.dart';


class CaloriesPage extends StatefulWidget {
  const CaloriesPage({super.key});

  @override
  State<CaloriesPage> createState() => _CaloriesPageState();
}

class _CaloriesPageState extends State<CaloriesPage> {
  double consumedCalories = 0;
  double adjustedCalories = 0;

  @override
  void initState() {
    super.initState();
    _loadCaloriesAndCalculate();
  }

  Future<void> _loadCaloriesAndCalculate() async {
    final prefs = await SharedPreferences.getInstance();
    final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
    final documentId = provider.data.documentId ?? 'defaultUser';

    final today = DateTime.now();
    final key = "consumedCalories-$documentId-${today.year}-${today.month}-${today.day}";

    final storedConsumed = prefs.getDouble(key) ?? 0;

    final gender = _normalizeGender(provider.data.gender ?? "not set");
    final age = provider.data.age ?? 25;
    final weight = provider.data.weight ?? 70;
    final height = provider.data.height ?? 170;
    final goal = provider.data.goal?.toLowerCase() ?? "unknown";
    final activityLevel = _normalizeActivityLevel(provider.data.activityLevel ?? "low");
    final increaseRate = provider.data.weeklyIncreaseRate ?? 0.5;
    final decreaseRate = provider.data.weeklyDecreaseRate ?? 0.5;

    final bmr = _calculateBMR(gender: gender, age: age, weight: weight, height: height);
    final tdee = bmr * _getActivityFactor(activityLevel);
    final adjCalories = _adjustCaloriesForGoal(goal, tdee, increaseRate: increaseRate, decreaseRate: decreaseRate);

    setState(() {
      consumedCalories = storedConsumed;
      adjustedCalories = adjCalories;
    });
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    double progress = (consumedCalories / adjustedCalories).clamp(0.0, 1.0);

    return Scaffold(
      backgroundColor: const Color(0xFF001427),
      appBar: AppBar(
        backgroundColor: const Color(0xFF001427),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(local.calories, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                local.caloriesProgress,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 12,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${consumedCalories.toStringAsFixed(0)} / ${adjustedCalories.toStringAsFixed(0)}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text("kcal"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                progress >= 1.0 ? local.targetReached : local.keepGoing,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: progress >= 1.0 ? Colors.green : Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _normalizeGender(String gender) {
    if (gender.toLowerCase() == 'man' || gender == 'ذكر') return 'male';
    if (gender.toLowerCase() == 'woman' || gender == 'أنثى') return 'female';
    return gender.toLowerCase();
  }

  String _normalizeActivityLevel(String level) {
    if (level.contains('منخفض')) return 'low';
    if (level.contains('متوسط')) return 'moderate';
    if (level.contains('عالي') || level.contains('مرتفع')) return 'high';
    return level.toLowerCase();
  }

  double _calculateBMR({
    required String gender,
    required int age,
    required double weight,
    required double height,
  }) {
    return gender == 'male'
        ? 10 * weight + 6.25 * height - 5 * age + 5
        : 10 * weight + 6.25 * height - 5 * age - 161;
  }

  double _getActivityFactor(String level) {
    switch (level) {
      case 'low':
        return 1.2;
      case 'moderate':
        return 1.55;
      case 'high':
        return 1.9;
      default:
        return 1.2;
    }
  }

  double _adjustCaloriesForGoal(
      String goal,
      double tdee, {
        double increaseRate = 0.5,
        double decreaseRate = 0.5,
      }) {
    const caloriesPerKg = 7700;
    if (goal == 'gain weight') {
      return tdee + (increaseRate * caloriesPerKg / 7);
    }
    if (goal == 'loss weight') {
      return tdee - (decreaseRate * caloriesPerKg / 7);
    }
    return tdee;
  }
}
