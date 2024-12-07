import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class DateCard extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color activeColor;
  final Color? inactiveBackgroundColor;
  final Color? inactiveTextColor;

  const DateCard({
    super.key,
    required this.date,
    required this.isSelected,
    this.onTap,
    required this.activeColor,
    this.inactiveBackgroundColor,
    this.inactiveTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //width: 90,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: _buildDecoration(),
        child: _buildDateContent(),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: isSelected 
        ? activeColor 
        : inactiveBackgroundColor,
      borderRadius: BorderRadius.circular(10),
      
      
      boxShadow: !isSelected 
        ? [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            )
          ]
        : null,
    );
  }

  Widget _buildDateContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDateText(
          text: DateFormat('MMM').format(date),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 4),
        _buildDateText(
          text: date.day.toString(),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 4),
        _buildDateText(
          text: DateFormat('EEE').format(date),
          fontSize: 12,
        ),
      ],
    );
  }

  Widget _buildDateText({
    required String text,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: isSelected 
          ? Colors.white 
          : inactiveTextColor,
      ),
    );
  }
}


