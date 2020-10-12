import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('My Calendar')
        ),
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TableCalendar(
                  calendarStyle: CalendarStyle(
                      todayColor: Colors.blueAccent,
                      selectedColor: Theme.of(context).primaryColor,
                      todayStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white
                      )
                  ),
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    formatButtonTextStyle: TextStyle(
                        color: Colors.white
                    ),
                    formatButtonShowsNext: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  onDaySelected: (date, events){
                    print(date.toIso8601String());
                  },
                  builders: CalendarBuilders(
                      selectedDayBuilder: (context, date, events) =>
                          Container(
                              margin: const EdgeInsets.all(4.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle
                              ),

                              child: Text(date.day.toString(), style: TextStyle
                                (color: Colors.white),)),
                      todayDayBuilder: (context, date, events) =>
                          Container(
                              margin: const EdgeInsets.all(4.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle
                              ),

                              child: Text(date.day.toString(), style: TextStyle
                                (color: Colors.white),))
                  ),
                  calendarController: _controller,)
              ],
            )
        )
    );
  }
}