// 📁 lib/screens/plan_ready_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../auth/sign_in_2.dart';
import '../l10n/app_localizations.dart';
import '../data/provider.dart';


class PlanReadyScreen extends StatelessWidget {
  const PlanReadyScreen({super.key});
  static const String routeName = '/plan_ready';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserOnboardingProvider>(context);
    final local = AppLocalizations.of(context)!;

    final rawGoal = provider.data.goal ?? "Unknown";
    final weight = provider.data.weight ?? 70;
    final height = provider.data.height ?? 170;
    final rawGender = provider.data.gender?.toLowerCase() ?? "not set";
    final age = provider.data.age ?? 25;
    final increaseRate = provider.data.weeklyIncreaseRate ?? 0.5;
    final decreaseRate = provider.data.weeklyDecreaseRate ?? 0.5;
    final rawActivityLevel = provider.data.activityLevel?.toLowerCase() ?? "low";

    final gender = _normalizeGender(rawGender);
    final activityLevel = _normalizeActivityLevel(rawActivityLevel);
    final goal = rawGoal.toLowerCase();

    final disease = provider.data.hasHealthCondition == true
        ? (provider.data.selectedDisease ?? local.healthCondition("Has condition"))
        : local.healthCondition("No condition");

    final bmi = weight / ((height / 100) * (height / 100));
    final now = DateTime.now();
    final requiredWeeks = 12.0;
    final endDate = now.add(Duration(days: 7 * requiredWeeks.toInt()));

    double targetWeight = weight;
    if (goal == 'gain weight') {
      targetWeight = weight + (increaseRate * requiredWeeks);
    } else if (goal == 'loss weight') {
      targetWeight = weight - (decreaseRate * requiredWeeks);
    }

    final bmr = _calculateBMR(gender: gender, age: age, weight: weight, height: height);
    final tdee = bmr * _getActivityFactor(activityLevel);
    final adjustedCalories = _adjustCaloriesForGoal(
      goal,
      tdee,
      increaseRate: increaseRate,
      decreaseRate: decreaseRate,
    );

    final weeksText = '12 ${local.weeksLabel}';
    String planDescription = '';

    if (goal == 'gain weight') {
      planDescription = local.goalGainWeight(
        increaseRate.toStringAsFixed(1),
        targetWeight.toStringAsFixed(1),
        weeksText,
      );
    } else if (goal == 'loss weight') {
      planDescription = local.goalLoseWeight(
        decreaseRate.toStringAsFixed(1),
        targetWeight.toStringAsFixed(1),
        weeksText,
      );
    } else if (goal == 'stay fit') {
      planDescription = local.goalStayFit(weeksText);
    } else if (goal == 'build muscle') {
      planDescription = local.goalBuildMuscle(weeksText);
    }

    if (bmi < 18.5) {
      planDescription += '\n\n${local.bmiUnderweight}';
    } else if (bmi >= 25) {
      planDescription += '\n\n${local.bmiOverweight}';
    } else {
      planDescription += '\n\n${local.bmiHealthy}';
    }

    if (provider.data.hasHealthCondition == true) {
      planDescription += '\n\n${local.specialCareCondition(disease)}';
    }

    return Scaffold(
      backgroundColor: const Color(0XFF0B192C),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0XFF0B192C),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              local.yourPlanIsReady,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(false),
                const SizedBox(width: 8),
                _buildDot(false),
                const SizedBox(width: 8),
                _buildDot(true),
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoCard(Icons.info_outline, planDescription),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildDateCard(local.endDate, DateFormat('yyyy-MM-dd').format(endDate)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDateCard(local.startDate, DateFormat('yyyy-MM-dd').format(now), rightAlign: true),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoCard(Icons.local_fire_department, local.dailyCalories(adjustedCalories.toStringAsFixed(0))),
            _buildInfoCard(Icons.person, local.genderAndAge(gender, age.toString())),
            _buildInfoCard(Icons.height, local.height(height.toStringAsFixed(1))),
            _buildInfoCard(Icons.monitor_weight, local.weight(weight.toStringAsFixed(1))),
            _buildInfoCard(Icons.local_hospital, local.healthCondition(disease)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, SignIn2.routeName),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007BFF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              ),
              child: Text(local.continueLabel, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  String _normalizeGender(String gender) {
    if (gender == 'man' || gender == 'ذكر') return 'male';
    if (gender == 'woman' || gender == 'أنثى') return 'female';
    return gender;
  }

  String _normalizeActivityLevel(String level) {
    if (level.contains('منخفض')) return 'low';
    if (level.contains('متوسط')) return 'moderate';
    if (level.contains('عالي') || level.contains('مرتفع')) return 'high';
    return level;
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

  /// ✅ الطريقة الصحيحة لحساب السعرات بناءً على الهدف
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

  Widget _buildDot(bool isActive) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.pinkAccent : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String text) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.black54),
            const SizedBox(width: 16),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }

  Widget _buildDateCard(String label, String date, {bool rightAlign = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: rightAlign ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
          const SizedBox(height: 4),
          Text(date, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
