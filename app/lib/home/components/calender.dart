import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({
    super.key,
  });

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  // 선택한 날짜
  DateTime _isSelectedDay = DateTime.now();
  // 현재 보여지는 날짜
  DateTime _focusDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime(2024, 1, 1),
      lastDay: DateTime(2024, 12, 31),
      headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
      calendarStyle:
          CalendarStyle(weekendTextStyle: TextStyle(color: Colors.blue)),
      selectedDayPredicate: (day) {
        return isSameDay(_isSelectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _isSelectedDay = selectedDay;
          _focusDay = focusedDay;
        });
      },
      locale: 'ko_KR',
    );
  }
}
