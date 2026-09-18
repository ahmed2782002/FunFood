import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:connectivity_plus/connectivity_plus.dart'; // ✅ جديد

import '../l10n/app_localizations.dart';
import '../data/provider.dart';
import 'plan_ready_screen.dart';

class PhysicalLevelSummaryScreen extends StatefulWidget {
  static const String routeName = '/physical_level_summary';
  const PhysicalLevelSummaryScreen({super.key});

  @override
  State<PhysicalLevelSummaryScreen> createState() => _PhysicalLevelSummaryScreenState();
}

class _PhysicalLevelSummaryScreenState extends State<PhysicalLevelSummaryScreen> {
  late Future<void> _loadDataFuture;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = Future.value(); // تحميل مباشر
  }

  String _bmiCategory(double bmi, AppLocalizations t) {
    if (bmi < 18.5) {
      return t.underweight;
    } else if (bmi < 25) {
      return t.healthy_weight;
    } else if (bmi < 30) {
      return t.overweight;
    } else {
      return t.obese;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserOnboardingProvider>(context);
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF0B192C),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0XFF0B192C),
      body: FutureBuilder(
        future: _loadDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          final height = provider.data.height ?? 1;
          final weight = provider.data.weight ?? 1;
          final goal = provider.data.goal ?? "Unknown";
          final disease = provider.data.hasHealthCondition == true
              ? (provider.data.selectedDisease ?? "Yes")
              : "No";

          final bmi = weight / ((height / 100) * (height / 100));
          double bmiAlignment = ((bmi - 10) / (40 - 10)) * 2 - 1;
          bmiAlignment = bmiAlignment.clamp(-1.0, 1.0);
          final bmiLabel = _bmiCategory(bmi, t);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    t.physical_level_summary,
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
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
                const SizedBox(height: 32),
                Text(
                  t.mass_factor,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(t.bmi_label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(bmi.toStringAsFixed(1),
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [Colors.green, Colors.yellow, Colors.red], stops: [0.0, 0.5, 1.0]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                            alignment: Alignment(bmiAlignment, 0),
                            child: Transform.rotate(
                              angle: 3.14 / 2,
                              child: const Icon(Icons.play_arrow, color: Colors.black, size: 20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(child: Text(bmiLabel, style: const TextStyle(fontSize: 14, color: Colors.grey))),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text(t.your_plan_based_on_data,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 50),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1- ${t.your_goal}: $goal', style: const TextStyle(fontSize: 22)),
                        const SizedBox(height: 8),
                        Text('2- ${t.current_weight}: ${weight.toStringAsFixed(1)} kg', style: const TextStyle(fontSize: 22)),
                        const SizedBox(height: 8),
                        Text('3- ${t.current_height}: ${height.toStringAsFixed(1)} cm', style: const TextStyle(fontSize: 22)),
                        const SizedBox(height: 8),
                        Text('4- ${t.health_condition}: $disease', style: const TextStyle(fontSize: 22)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final connectivityResult = await Connectivity().checkConnectivity();
                      final hasInternet = connectivityResult != ConnectivityResult.none;

                      if (!hasInternet) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(t.no_internet_message), // ← أضف الترجمة في ملف `arb`
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }

                      final data = provider.data.toJson();
                      final collection = FirebaseFirestore.instance.collection('user_plans');

                      try {
                        if (provider.data.documentId == null) {
                          final docRef = await collection.add(data);
                          provider.data.documentId = docRef.id;
                        } else {
                          await collection.doc(provider.data.documentId).update(data);
                        }

                        Navigator.pushNamed(context, PlanReadyScreen.routeName);
                      } catch (e) {
                        print("${t.firebase_error} $e");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.firebase_upload_error_message)),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007BFF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    ),
                    child: Text(
                      t.start_plan,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  static Widget _buildDot(bool isActive) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: isActive ? Colors.pinkAccent : Colors.grey, shape: BoxShape.circle),
    );
  }
}
