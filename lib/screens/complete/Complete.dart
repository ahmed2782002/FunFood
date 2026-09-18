import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/provider.dart';
import '../../l10n/app_localizations.dart';
import '../home/model_deit.dart';

class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  List<Meal> completedMeals = [];

  @override
  void initState() {
    super.initState();
    _loadCompletedMeals();
  }

  Future<void> _loadCompletedMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
    final documentId = provider.data.documentId ?? 'defaultUser';
    final today = DateTime.now();
    final key = "completedMeals-$documentId-${today.year}-${today.month}-${today.day}";

    final mealList = prefs.getStringList(key) ?? [];
    setState(() {
      completedMeals = mealList.map((e) => Meal.fromMap(jsonDecode(e))).toList();
    });
  }

  // يمكنك إضافة دالة لإعادة تحميل الوجبات عند العودة للصفحة (اختياري)
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // لتحديث الوجبات في حال رجوع المستخدم من DietPage
    _loadCompletedMeals();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFF001427),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Center(child: Text(local.completeTitle, style: const TextStyle(color: Colors.white))),
        ),
        elevation: 0,
      ),
      body: completedMeals.isEmpty
          ? Center(
        child: Text(
          local.noMealsSelected,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: completedMeals.length,
        itemBuilder: (context, index) {
          final meal = completedMeals[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(meal.description),
                      const SizedBox(height: 6),
                      Text(
                        local.caloriesDisplay(meal.calories.toString()),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
