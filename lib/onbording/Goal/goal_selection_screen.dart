import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funfoodapp/onbording/Goal/weekly_decrease_rate_screen.dart';
import 'package:funfoodapp/onbording/Goal/weekly_increase_rate_screen.dart';

import '../../data/provider.dart';
import '../../l10n/app_localizations.dart';

import '../select/gender_selection_screen.dart';
import 'package:provider/provider.dart';


class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({super.key});
  static const String routeName = '/goal-selection';

  @override
  State<GoalSelectionScreen> createState() => _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedGoal = Provider.of<UserOnboardingProvider>(context).data.goal;
    final local = AppLocalizations.of(context)!;

    final List<Map<String, dynamic>> goals = [
      {
        'key': 'loss Weight',
        'label': local.lossWeight,
        'iconPath': 'assets/loss.png',
      },
      {
        'key': 'maintain Weight',
        'label': local.maintainWeight,
        'iconPath': 'assets/maintain.png',
      },
      {
        'key': 'gain Weight',
        'label': local.gainWeight,
        'iconPath': 'assets/weight-gain 1.png',
      },
      {
        'key': 'building Muscles',
        'label': local.buildingMuscles,
        'iconPath': 'assets/muscle_1616442 1.png',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0XFF0B192C),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            local.yourGoalFromTheApp,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(true),
                  const SizedBox(width: 5),
                  _buildDot(false),
                  const SizedBox(width: 5),
                  _buildDot(false),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  local.whatIsYourMainGoal,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  local.goalInfoHint,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: goals.length,
                  itemBuilder: (context, index) {
                    final goal = goals[index];
                    final key = goal['key'];
                    final label = goal['label'];
                    final isSelected = selectedGoal == key;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: InkWell(
                        onTap: () {
                          Provider.of<UserOnboardingProvider>(context, listen: false)
                              .setGoal(key);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? const Color(0xFF1563FF) : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(goal['iconPath'], width: 45, height: 45),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  label,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                              isSelected
                                  ? const Icon(Icons.check_circle,
                                  color: Color(0xFF1F1BA2), size: 28)
                                  : Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey, width: 2.w),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final selectedGoal =
                          Provider.of<UserOnboardingProvider>(context, listen: false).data.goal;

                      if (selectedGoal == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              local.pleaseSelectGoal,
                              style: const TextStyle(fontFamily: 'Poppins'),
                            ),
                            backgroundColor: Colors.grey,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        return;
                      }

                      if (selectedGoal == 'gain Weight') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WeeklyIncreaseRateScreen()),
                        );
                      } else if (selectedGoal == 'loss Weight') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WeeklyDecreaseRateScreen()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GenderSelectionScreen()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1563FF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      local.ccontinue,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: isActive ? 10 : 8,
      height: isActive ? 10 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFF06292) : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
