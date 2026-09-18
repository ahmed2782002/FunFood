import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';


import '../../data/provider.dart';
import '../../l10n/app_localizations.dart';

import '../select/select_food.dart';

class WeightSelectionScreen extends StatefulWidget {
  static const String routeName = 'weight-selection';
  const WeightSelectionScreen({super.key});

  @override
  State<WeightSelectionScreen> createState() => _WeightSelectionScreenState();
}

class _WeightSelectionScreenState extends State<WeightSelectionScreen> {
  double selectedWeight = 70.0;
  String selectedUnit = 'kilogram';
  final FixedExtentScrollController _scrollController = FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpToItem(70);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Container(
      color: const Color(0XFF0B192C),
      child: Scaffold(
        backgroundColor: const Color(0xFF0B182C),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF061420),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  local.what_about_you,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(true),
                    SizedBox(width: 6.w),
                    _buildDot(true),
                    SizedBox(width: 6.w),
                    _buildDot(false),
                  ],
                ),
                SizedBox(height: 30.h),
                Text(
                  local.what_is_your_weight,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListWheelScrollView(
                    controller: _scrollController,
                    itemExtent: 50.h,
                    diameterRatio: 1.5,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedWeight = index.toDouble();
                      });
                    },
                    children: List.generate(
                      300,
                          (index) => Center(
                        child: Text(
                          selectedUnit == 'kilogram'
                              ? '$index ${local.kg_unit}'
                              : '${(index * 2.20462).toStringAsFixed(1)} ${local.lb_unit}',
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: selectedWeight == index
                                ? const Color(0xFF1563FF)
                                : Colors.grey,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildUnitOption('kilogram', local.kg_unit),
                      _buildUnitOption('pound', local.lb_unit),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
                      final selectedIndex = _scrollController.selectedItem;

                      double weightToStore;
                      String displayWeight;

                      if (selectedUnit == 'kilogram') {
                        weightToStore = selectedIndex.toDouble();
                        displayWeight = '$selectedIndex ${local.kg_unit}';
                      } else {
                        double lb = selectedIndex * 2.20462;
                        weightToStore = selectedIndex.toDouble(); // still in kg
                        displayWeight = '${lb.toStringAsFixed(1)} ${local.lb_unit}';
                      }

                      provider.setWeight(weightToStore);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SelectFood()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1563FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      local.continue_button,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDot(bool active) {
    return Container(
      width: 10.w,
      height: 10.h,
      decoration: BoxDecoration(
        color: active ? const Color(0xFFF06292) : Colors.white24,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildUnitOption(String unit, String label) {
    final isSelected = selectedUnit == unit;
    return InkWell(
      onTap: () {
        setState(() {
          selectedUnit = unit;
          selectedWeight = 70.0;
          _scrollController.jumpToItem(70);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1563FF) : Colors.white,
          borderRadius: BorderRadius.horizontal(
            left: unit == 'kilogram' ? Radius.circular(12.r) : Radius.zero,
            right: unit == 'pound' ? Radius.circular(12.r) : Radius.zero,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            color: isSelected ? Colors.white : Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
