import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/provider.dart';
import '../../l10n/app_localizations.dart';


import '../complete/Complete.dart';
import 'dart:convert';

class DiseaseDietModel {
  static final Map<String, Map<String, MealItem>> diseaseMeals = {
    'Anemia': {
      'فطور': MealItem('بيض + خبز بني + عصير برتقال مدعّم بالحديد'),
      'سناك 1': MealItem('تمر + كوب لبن'),
      'غداء': MealItem('كبدة مشوية + أرز بني + سلطة خضراء'),
      'سناك 2': MealItem('مكسرات + فواكه مجففة'),
      'عشاء': MealItem('عدس + خبز + خضار مطبوخة'),
    },
    'Diabetes': {
      'فطور': MealItem('توست بني + جبن قليل الدسم + خضروات'),
      'سناك 1': MealItem('تفاحة + حفنة لوز'),
      'غداء': MealItem('صدر دجاج مشوي + أرز بني + سلطة'),
      'سناك 2': MealItem('زبادي خالي الدسم'),
      'عشاء': MealItem('شوربة عدس + خبز أسمر + خضار مشوي'),
    },
    'Stomach Bacteria': {
      'فطور': MealItem('شوفان بالحليب خالي الدسم + موزة'),
      'سناك 1': MealItem('كوب زبادي طبيعي + ملعقة عسل'),
      'غداء': MealItem('أرز أبيض + صدر دجاج مسلوق + خضار مسلوقة'),
      'سناك 2': MealItem('تفاحة أو كمثرى + لوز غير مملح'),
      'عشاء': MealItem('خبز أبيض + جبن قريش + خيار'),
    },
    'Hypertension': {
      'فطور': MealItem('شوفان بالحليب + موزة'),
      'سناك 1': MealItem('خيار + جزر'),
      'غداء': MealItem('سمك مشوي + بطاطا مشوية + خضار سوتيه'),
      'سناك 2': MealItem('كوب زبادي + تفاح'),
      'عشاء': MealItem('سلطة تونة + خبز قمح كامل'),
    },
    'Obesity': {
      'فطور': MealItem('بيض مسلوق + خضار + شريحة توست'),
      'سناك 1': MealItem('برتقالة'),
      'غداء': MealItem('صدر دجاج مشوي + خضار مشوية'),
      'سناك 2': MealItem('كوب زبادي خالي الدسم'),
      'عشاء': MealItem('سلطة خضراء + شوربة خفيفة'),
    },
    'Underweight': {
      'فطور': MealItem('عجة بالجبن + توست + كوب حليب كامل الدسم'),
      'سناك 1': MealItem('موز + زبدة فول سوداني'),
      'غداء': MealItem('لحم + أرز أبيض + خضار مطبوخة'),
      'سناك 2': MealItem('مكسرات + عصير طبيعي'),
      'عشاء': MealItem('معكرونة بالكريمة + سلطة'),
    },
    'Heart Disease': {
      'فطور': MealItem('شوفان + حليب خالي الدسم + توت'),
      'سناك 1': MealItem('تفاح + مكسرات'),
      'غداء': MealItem('سمك مشوي + كينوا + خضار مطهوة'),
      'سناك 2': MealItem('زبادي + فواكه طازجة'),
      'عشاء': MealItem('سلطة الحمص + خبز كامل الحبوب'),
    },
    'Rickets': {
      'فطور': MealItem('بيض مسلوق + كوب حليب مدعّم بفيتامين D + خبز قمح كامل'),
      'سناك 1': MealItem('زبادي + تمرتين'),
      'غداء': MealItem('سمك مشوي (سلمون أو تونة) + أرز بني + خضار مطهية بالبخار'),
      'سناك 2': MealItem('مكسرات غير مملحة + كوب عصير برتقال طبيعي'),
      'عشاء': MealItem('جبن قريش + خبز بني + خيار أو خس'),
    },

  };
}

class MealItem {
  final String description;

  MealItem(this.description);
}

class DietPageDiseases extends StatefulWidget {
  const DietPageDiseases({super.key});

  @override
  State<DietPageDiseases> createState() => _DietPageDiseasesState();
}

class _DietPageDiseasesState extends State<DietPageDiseases> {
  int currentWater = 0;
  final int goalWater = 2000;
  final int cupVolume = 250;
  late String todayWaterKey;
  late String completedMealsKey;
  late List<String> mealKeys;
  List<bool> _mealCheckedStates = [];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
    final docId = provider.data.documentId ?? 'defaultUser';
    final selectedDiseaseKey = provider.data.selectedDisease ?? '';
    todayWaterKey = _getTodayWaterKey(docId);
    completedMealsKey =
    "completedDiseaseMeals-$docId-${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}-$selectedDiseaseKey";
    _loadWaterLocally();
    _loadCompletedMeals();
  }

  String _getTodayWaterKey(String documentId) {
    final today = DateTime.now();
    return "water-$documentId-${today.year}-${today.month}-${today.day}";
  }

  Future<void> _addWater() async {
    setState(() {
      if (currentWater + cupVolume <= goalWater) {
        currentWater += cupVolume;
      }
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(todayWaterKey, currentWater);
  }

  Future<void> _loadWaterLocally() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentWater = prefs.getInt(todayWaterKey) ?? 0;
    });
  }

  Future<void> _loadCompletedMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final savedStates = prefs.getStringList(completedMealsKey);
    if (mounted) {
      setState(() {
        _mealCheckedStates = savedStates?.map((e) => e == 'true').toList() ?? [];
      });
    }
  }

  Future<void> _saveCompletedMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final stateStrings = _mealCheckedStates.map((e) => e.toString()).toList();
    await prefs.setStringList(completedMealsKey, stateStrings);
  }

  Future<void> _addMealToCompleteList(String mealTime, String details) async {
    final prefs = await SharedPreferences.getInstance();
    final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
    final documentId = provider.data.documentId ?? 'defaultUser';
    final today = DateTime.now();
    final key = "completedMeals-$documentId-${today.year}-${today.month}-${today.day}";

    List<String> meals = prefs.getStringList(key) ?? [];

    final mealMap = {
      "name": mealTime,
      "description": details,
      "calories": 0,
    };

    final jsonMeal = jsonEncode(mealMap);

    if (!meals.contains(jsonMeal)) {
      meals.add(jsonMeal);
      await prefs.setStringList(key, meals);
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final provider = Provider.of<UserOnboardingProvider>(context);
    final selectedDiseaseKey = provider.data.selectedDisease;
    final meals = DiseaseDietModel.diseaseMeals[selectedDiseaseKey ?? ''];
    final diseaseLabel = _getLocalizedDiseaseLabel(context, selectedDiseaseKey ?? '');
    double progress = currentWater / goalWater;

    if (meals == null) {
      return Scaffold(
        backgroundColor: const Color(0xFF001427),
        body: Center(
          child: Text(local.please_select_disease,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
        ),
      );
    }

    mealKeys = meals.keys.toList();
    if (_mealCheckedStates.length != mealKeys.length) {
      _mealCheckedStates = List.generate(mealKeys.length, (index) => false);
    }

    return Scaffold(
      backgroundColor: const Color(0xFF001427),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(diseaseLabel,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        actions: [
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
            children: [
              const SizedBox(height: 10),
              ...List.generate(mealKeys.length, (index) {
                final mealTime = mealKeys[index];
                final MealItem mealItem = meals[mealTime]!;
                final isChecked = _mealCheckedStates[index];
                String emoji = "🍽️";
                if (mealTime.contains("فطور")) emoji = "🍳";
                else if (mealTime.contains("غداء")) emoji = "🍗";
                else if (mealTime.contains("عشاء")) emoji = "🥗";
                else if (mealTime.contains("سناك")) emoji = "🍎";

                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(emoji, style: const TextStyle(fontSize: 30)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mealTime,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            Text(
                              "${mealItem.description} ",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            _mealCheckedStates[index] = !_mealCheckedStates[index];
                          });

                          await _saveCompletedMeals();

                          if (_mealCheckedStates[index]) {
                            await _addMealToCompleteList(mealTime, mealItem.description);
                          }
                        },
                        child: Icon(
                          isChecked ? Icons.check_circle : Icons.check_circle_outline,
                          color: isChecked ? Colors.green : Colors.grey,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
              _buildWaterTracker(progress, local),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  String _getLocalizedDiseaseLabel(BuildContext context, String key) {
    final local = AppLocalizations.of(context)!;
    switch (key) {
      case 'Anemia':
        return local.anemia;
      case 'Diabetes':
        return local.type2_diabetes;
      case 'Stomach Bacteria':
        return local.stomach_bacteria;
      case 'Hypertension':
        return local.hypertension;
      case 'Obesity':
        return local.obesity;
      case 'Underweight':
        return local.underweight;
      case 'Heart Disease':
        return local.heart_disease;
      default:
        return key;
    }
  }



  Widget _buildWaterTracker(double progress, AppLocalizations local) {
    int filledCups = (currentWater / cupVolume).floor();
    int totalCups = (goalWater / cupVolume).floor();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF002b50), borderRadius: BorderRadius.circular(16)),
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
}
