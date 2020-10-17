import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar/res/event_firestore_service.dart';
import 'package:flutter_calendar/ui/pages/add_event.dart';
import 'package:flutter_calendar/ui/pages/view_event.dart';
import 'package:table_calendar/table_calendar.dart';
import 'model/event.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _controller;
  Map<DateTime,List<dynamic>> _events;
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
      DateTime date = DateTime(event.eventDate.year, event.eventDate.month, event.eventDate.day, 12);
      if(data[date] = null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('My Calendar')
        ),
        body: StreamBuilder<List<EventModel>>(
            stream: eventDBS.streamList(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                List<EventModel> allEvents = snapshot.data;
                if(allEvents.isNotEmpty) {
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
                      calendarController: _controller,
                    ),
                    ... _selectedEvents.map((event) => ListTile(
                        title: Text(event.title),
                        onTap() {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (_) => EventDetailsPage(
                    event: event,
                    )));
                    }
                    ))
                  ],
                ),
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _showAddDialog,
        )
    );
  }
