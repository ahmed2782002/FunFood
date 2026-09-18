import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funfoodapp/onbording/heightandweight/weight_selection_screen.dart';

import 'package:provider/provider.dart';


import '../../data/provider.dart';
import '../../l10n/app_localizations.dart';


class HeightSelectionScreen extends StatefulWidget {
  static const String routeName = 'height-selection';
  const HeightSelectionScreen({super.key});

  @override
  State<HeightSelectionScreen> createState() => _HeightSelectionScreenState();
}

class _HeightSelectionScreenState extends State<HeightSelectionScreen> {
  String selectedUnit = 'centimeter';
  double selectedHeight = 160.0;
  FixedExtentScrollController _scrollController = FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpToItem(_initialIndex());
    });
  }

  int _initialIndex() {
    if (selectedUnit == 'centimeter') {
      return selectedHeight.toInt() - 100;
    } else {
      return ((selectedHeight - 1.0) * 100).toInt();
    }
  }

  List<Widget> _buildHeightItems(AppLocalizations local) {
    if (selectedUnit == 'centimeter') {
      return List.generate(151, (index) {
        int value = index + 100;
        return Center(
          child: Text(
            '$value ${local.cm_unit}',
            style: TextStyle(
              fontSize: 24.sp,
              color: selectedHeight == value ? const Color(0xFF1563FF) : Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),
        );
      });
    } else {
      return List.generate(151, (index) {
        double value = 1.0 + index / 100;
        return Center(
          child: Text(
            '${value.toStringAsFixed(2)} ${local.m_unit}',
            style: TextStyle(
              fontSize: 24.sp,
              color: selectedHeight == value ? const Color(0xFF1563FF) : Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0XFF0B192C),
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
                local.what_is_your_height,
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
                      if (selectedUnit == 'centimeter') {
                        selectedHeight = index + 100.0;
                      } else {
                        selectedHeight = 1.0 + index / 100;
                      }
                    });
                  },
                  children: _buildHeightItems(local),
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
                    _buildUnitOption('centimeter', local.cm_unit),
                    _buildUnitOption('meter', local.m_unit),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () {
                    final provider = Provider.of<UserOnboardingProvider>(context, listen: false);
                    double heightToStore = selectedUnit == 'centimeter'
                        ? selectedHeight
                        : selectedHeight * 100;

                    provider.setHeight(heightToStore);
                    Navigator.pushNamed(context, WeightSelectionScreen.routeName);
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
          selectedHeight = (unit == 'centimeter') ? 160.0 : 1.6;
          _scrollController = FixedExtentScrollController(initialItem: _initialIndex());
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1563FF) : Colors.white,
          borderRadius: BorderRadius.horizontal(
            left: unit == 'centimeter' ? Radius.circular(12.r) : Radius.zero,
            right: unit == 'meter' ? Radius.circular(12.r) : Radius.zero,
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
