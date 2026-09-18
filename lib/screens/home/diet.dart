import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/provider.dart';
import '../../l10n/app_localizations.dart';

import '../complete/Complete.dart';
import 'model_deit.dart';

class DietPage extends StatefulWidget {
  const DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  int currentWater = 0;
  final int goalWater = 2000;
  final int cupVolume = 250;
  late String todayWaterKey;
  late String _todayCaloriesKey;
  late String _completedMealsKey;

  List<bool> _expandedStates = [];
  List<bool> _mealCheckedStates = [];
  List<Meal> _completedMeals = [];
  double _consumedCalories = 0;
  double _adjustedCalories = 0;
  List<Meal> meals = [];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
    final documentId = provider.data.documentId ?? 'defaultUser';

    todayWaterKey = _getTodayWaterKey(documentId);
    _todayCaloriesKey = _getTodayCaloriesKey(documentId);
    _completedMealsKey =
    "completedMeals-$documentId-${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";

    _loadWaterLocally();
    _loadCompletedMeals().then((_) {
      _loadCalories();
      _generateMeals();
    });
  }

  void _generateMeals() {
    final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
    final gender = _normalizeGender(provider.data.gender ?? "not set");
    final age = provider.data.age ?? 25;
    final weight = provider.data.weight ?? 70;
    final height = provider.data.height ?? 170;
    final goal = provider.data.goal?.toLowerCase() ?? "unknown";
    final activityLevel = _normalizeActivityLevel(provider.data.activityLevel ?? "low");
    final increaseRate = provider.data.weeklyIncreaseRate ?? 0.5;
    final decreaseRate = provider.data.weeklyDecreaseRate ?? 0.5;
    final foodPref = provider.data.foodPreference ?? '';

    final bmr = _calculateBMR(gender: gender, age: age, weight: weight, height: height);
    final tdee = bmr * _getActivityFactor(activityLevel);
    _adjustedCalories = _adjustCaloriesForGoal(goal, tdee,
        increaseRate: increaseRate, decreaseRate: decreaseRate);

    meals = MealPlanGenerator.generateDailyDietPlanScaled(
      goal: goal,
      targetCalories: _adjustedCalories.round(),
      foodPreference: foodPref,
    );

    _mealCheckedStates = List.generate(meals.length, (index) {
      final meal = meals[index];
      return _completedMeals.any((m) => m.name == meal.name);
    });

    _expandedStates = List.generate(meals.length, (index) => false);
    setState(() {});
  }

  void _generateAlternateMeals() {
    final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
    final goal = provider.data.goal?.toLowerCase() ?? "unknown";

    meals = AlternateMealPlanGenerator.generateDailyDietPlan(
      goal: goal,
      targetCalories: _adjustedCalories.round(),
    );

    _mealCheckedStates = List.generate(meals.length, (index) => false);
    _expandedStates = List.generate(meals.length, (index) => false);
    _completedMeals.clear();
    _consumedCalories = 0;
    _saveCalories(_consumedCalories);
    _saveCompletedMeals();

    setState(() {});
  }

  String _getTodayWaterKey(String documentId) {
    final today = DateTime.now();
    return "water-$documentId-${today.year}-${today.month}-${today.day}";
  }

  String _getTodayCaloriesKey(String documentId) {
    final today = DateTime.now();
    return "consumedCalories-$documentId-${today.year}-${today.month}-${today.day}";
  }

  Future<void> _addWater() async {
    setState(() {
      if (currentWater + cupVolume <= goalWater) {
        currentWater += cupVolume;
      }
    });
    await _saveWaterLocally(currentWater);
  }

  Future<void> _saveWaterLocally(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(todayWaterKey, value);
  }

  Future<void> _loadWaterLocally() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getInt(todayWaterKey);
    setState(() {
      currentWater = stored ?? 0;
    });
  }

  Future<void> _saveCalories(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_todayCaloriesKey, value);
  }

  Future<void> _loadCalories() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getDouble(_todayCaloriesKey) ?? 0;
    setState(() {
      _consumedCalories = stored;
    });
  }

  Future<void> _saveCompletedMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final mealList = _completedMeals.map((meal) => jsonEncode(meal.toMap())).toList();
    await prefs.setStringList(_completedMealsKey, mealList);
  }

  Future<void> _loadCompletedMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final mealList = prefs.getStringList(_completedMealsKey) ?? [];
    _completedMeals = mealList.map((e) => Meal.fromMap(jsonDecode(e))).toList();
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentWater / goalWater;
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF001427),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(local.diet,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        actions: [
          TextButton.icon(
            onPressed: _generateAlternateMeals,
            icon: const Icon(Icons.refresh, color: Colors.orange),
            label: Text(
              local.changePlan, // هذا النص مترجم من l10n
              style: const TextStyle(color: Colors.orange),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.check, color: Colors.green),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Complete()));
            },
          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              Text(local.todayMeal, style: const TextStyle(fontSize: 18, color: Colors.white)),
              const SizedBox(height: 10),
              ...List.generate(meals.length, (index) {
                final meal = meals[index];
                final isExpanded = _expandedStates[index];
                final isChecked = _mealCheckedStates[index];
                return _buildMealCard(meal, isExpanded, isChecked, index);
              }),
              const SizedBox(height: 20),
              _buildWaterTracker(progress),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealCard(Meal meal, bool isExpanded, bool isChecked, int index) {
    final local = AppLocalizations.of(context)!;
    String emoji = "🍽️";

    if (meal.name.contains("الفطور")) emoji = "🍳";
    else if (meal.name.contains("الغداء")) emoji = "🍗";
    else if (meal.name.contains("العشاء")) emoji = "🥗";
    else if (meal.name.toLowerCase().contains("سناك")) emoji = "🍎";

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _expandedStates[index] = !_expandedStates[index];
              });
            },
            child: Row(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 30)),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(meal.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(meal.description,
                            style: const TextStyle(color: Colors.black, fontSize: 16)),
                        const SizedBox(height: 8),
                        Text("${local.calories}: ${meal.calories}",
                            style: const TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _mealCheckedStates[index] = !_mealCheckedStates[index];
                        if (_mealCheckedStates[index]) {
                          _completedMeals.add(meal);
                          _consumedCalories += meal.calories;
                        } else {
                          _completedMeals.removeWhere((m) => m.name == meal.name);
                          _consumedCalories -= meal.calories;
                        }
                        _saveCompletedMeals();
                        _saveCalories(_consumedCalories);
                      });
                    },
                    child: Icon(
                      isChecked ? Icons.check_circle : Icons.check_circle_outline,
                      color: isChecked ? Colors.green : Colors.grey,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildWaterTracker(double progress) {
    final local = AppLocalizations.of(context)!;
    int filledCups = (currentWater / cupVolume).floor();
    int totalCups = (goalWater / cupVolume).floor();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration:
      BoxDecoration(color: const Color(0xFF002b50), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(local.water, style: const TextStyle(fontSize: 16, color: Colors.white)),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(totalCups, (index) {
                if (index == filledCups && currentWater < goalWater) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: _buildAddWaterButton(),
                  );
                }
                bool filled = index < filledCups;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    width: 30,
                    height: 50,
                    decoration: BoxDecoration(
                      color: filled ? Colors.blueAccent : Colors.transparent,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      filled ? Icons.local_drink : Icons.local_drink_outlined,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 12),
          Text("$currentWater / $goalWater ml", style: const TextStyle(color: Colors.white)),
          Text("${(progress * 100).toStringAsFixed(0)}%", style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildAddWaterButton() {
    return GestureDetector(
      onTap: _addWater,
      child: Container(
        width: 40,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: const Center(
          child: Icon(Icons.add, size: 30, color: Colors.white),
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

  double _adjustCaloriesForGoal(String goal, double tdee,
      {double increaseRate = 0.5, double decreaseRate = 0.5}) {
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
