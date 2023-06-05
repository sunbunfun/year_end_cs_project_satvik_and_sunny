import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:table_calendar/table_calendar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Keep Trac'), centerTitle: true),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Text("Selected Day = " + today.toString().split(" ")[0]),
        Container(
          child: TableCalendar(
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2008, 5, 28),
            lastDay: DateTime.utc(2040, 3, 16),
            onDaySelected: _onDaySelected,
          ),
        )
      ],
    );
  }
}
