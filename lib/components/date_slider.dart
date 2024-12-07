import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/components/date_card.dart';

class dateSlider extends StatefulWidget {

  final Color activeColor;
  final Color? inactiveBackgroundColor;
  final Color? inactiveTextColor;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime)? onDateChanged;

  dateSlider({
    super.key, 
    this.activeColor = AppColors.myPrimary, 
    this.inactiveBackgroundColor = AppColors.myAccent,
    this.inactiveTextColor = Colors.black,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateChanged, 
  });

  @override
  State<dateSlider> createState() => _DateSliderState();
}

class _DateSliderState extends State<dateSlider> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLinePicker.itemBuilder(
      headerOptions: HeaderOptions(
        headerType: HeaderType.none
      ),
      firstDate: widget.firstDate ?? DateTime.now(),
      lastDate: widget.lastDate ?? DateTime(2024, 12, 12),
      focusedDate: _selectedDate,
      itemExtent: 64.0, 
      itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) {
        return DateCard(
          date: date,
          isSelected: isSelected,
          onTap: onTap,
          activeColor: widget.activeColor,
          inactiveBackgroundColor: widget.inactiveBackgroundColor,
          inactiveTextColor: widget.inactiveTextColor,
        );
      },
      onDateChange: (date) {
        setState(() {
          _selectedDate = date;
        });
        
        widget.onDateChanged?.call(date);
      },
    );
  }
}