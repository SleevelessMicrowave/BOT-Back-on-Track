import 'dart:convert';
import 'package:bot_back_on_track/UI/Path/view_event.dart';
import 'package:bot_back_on_track/constants.dart';
import 'package:bot_back_on_track/constants.dart';
import 'package:bot_back_on_track/model/event.dart';
import 'package:bot_back_on_track/res/event_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
  }

  Map<DateTime, List<dynamic>> _groupEvents(List<EventModel> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = DateTime(
          event.eventDate.year, event.eventDate.month, event.eventDate.day, 12);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Calendar')),
        body: StreamBuilder<List<EventModel>>(
            stream: eventDBS.streamList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<EventModel> allEvents = snapshot.data;
                if (allEvents.isNotEmpty) {
                  _events = _groupEvents(allEvents);
                } else {
                  _events = {};
                  _selectedEvents = [];
                }
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TableCalendar(
                      events: _events,
                      calendarStyle: CalendarStyle(
                          todayColor: kPrimaryColor,
                          selectedColor: Theme.of(context).primaryColor,
                          todayStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white)),
                      headerStyle: HeaderStyle(
                        centerHeaderTitle: true,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        formatButtonTextStyle: TextStyle(color: Colors.white),
                        formatButtonShowsNext: false,
                      ),
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      onDaySelected: (date, events) {
                        setState(() {
                          _selectedEvents = events;
                        });
                        print(date.toIso8601String());
                      },
                      builders: CalendarBuilders(
                          selectedDayBuilder: (context, date, events) =>
                              Container(
                                  margin: const EdgeInsets.all(4.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      shape: BoxShape.circle),
                                  child: Text(
                                    date.day.toString(),
                                    style: TextStyle(color: Colors.white),
                                  )),
                          todayDayBuilder: (context, date, events) => Container(
                              margin: const EdgeInsets.all(4.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.amber, shape: BoxShape.circle),
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(color: Colors.white),
                              ))),
                      calendarController: _controller,
                    ),
                    ..._selectedEvents.map((event) => ListTile(
                      title: Text(event.title),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EventDetailsPage(
                                  event: event,
                                )));
                      },
                    ))
                  ],
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, 'add_event'),
        ));
  }
/*
  _showAddDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: _eventController,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Save"),
              onPressed: () {
                if (_eventController.text.isEmpty) return;
                setState(() {
                  if (_events[_controller.selectedDay] != null) {
                    _events[_controller.selectedDay]
                        .add(_eventController.text);
                  } else {
                    _events[_controller.selectedDay] = [
                      _eventController.text
                    ];
                  }
                  prefs.setString(
                      "events", json.encode(jsonEncode(_events)));
                  _eventController.clear();
                  Navigator.pop(context);
                });
              },
            )
          ],
        ));
  } */
}