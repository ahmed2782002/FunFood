import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/provider.dart';
import '../../../l10n/app_localizations.dart';


// كلاس يمثل المرض (مفتاح + الاسم المترجم)
class DiseaseOption {
  final String key;
  final String label;

  DiseaseOption({required this.key, required this.label});
}

class DiseasesSelectionScreen extends StatefulWidget {
  static const String routeName = 'diseases-selection';
  const DiseasesSelectionScreen({super.key});

  @override
  State<DiseasesSelectionScreen> createState() => _DiseasesSelectionScreenState();
}

class _DiseasesSelectionScreenState extends State<DiseasesSelectionScreen> {
  late List<DiseaseOption> group1;
  late List<DiseaseOption> group2;
  String? selectedKey;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final local = AppLocalizations.of(context)!;

    group1 = [
      DiseaseOption(key: 'Anemia', label: local.anemia),
      DiseaseOption(key: 'Underweight', label: local.thinness),
    ];

    group2 = [
      DiseaseOption(key: 'Obesity', label: local.obesity),
      DiseaseOption(key: 'Heart Disease', label: local.heart_disease),
      DiseaseOption(key: 'Rickets', label: local.rickets),
      DiseaseOption(key: 'Diabetes', label: local.type2_diabetes),
      DiseaseOption(key: 'Stomach Bacteria', label: local.stomach_bacteria), // ✅ تمت الإضافة هنا
      DiseaseOption(key: 'PCOS', label: local.pcos), // ✅ تكيسات المبايض
    ];
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0XFF0B192C),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0XFF0B192C),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                Text(
                  local.diseases_title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 36),
                ...group1.map((option) => _buildDiseaseButton(option)).toList(),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.white,
                ),
                const SizedBox(height: 24),
                ...group2.map((option) => _buildDiseaseButton(option)).toList(),
                const SizedBox(height: 36),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedKey == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              local.please_select_disease,
                              style: const TextStyle(fontFamily: 'Poppins'),
                            ),
                            backgroundColor: Colors.grey,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        return;
                      }

                      final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
                      provider.setSelectedDisease(selectedKey); // استخدم المفتاح

                      Navigator.pushNamed(context, 'height-selection');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1563FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      local.continue_button,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseButton(DiseaseOption option) {
    final bool isSelected = selectedKey == option.key;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedKey = isSelected ? null : option.key;
          });
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? const Color(0xFF1563FF) : Colors.transparent,
              width: 3,
            ),
          ),
          child: Center(
            child: Text(
              option.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF0B192C),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
