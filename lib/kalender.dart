import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:intl/intl.dart';

class Location {
  final String name;
  final String zone;

  const Location(this.name, this.zone);
}

List<Location> locations = [  Location('Jakarta', 'Asia/Jakarta'),  Location('Makassar', 'Asia/Makassar'),  Location('Jayapura', 'Asia/Jayapura'),];

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late String _zone;
  late tz.Location _selectedLocation;
  late String _time;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    _zone = 'Asia/Jakarta';
    _selectedLocation = tz.getLocation(_zone);
    _setTime();
  }

  void _setZone(String zone) {
    setState(() {
      _zone = zone;
      _selectedLocation = tz.getLocation(_zone);
      _setTime();
    });
  }

  void _setTime() {
    initializeDateFormatting('id', null).then((_) {
      final now = tz.TZDateTime.now(_selectedLocation);
      final formatter = DateFormat('EEEE, d MMMM yyyy, HH:mm:ss', 'id');
      setState(() {
        _time = formatter.format(now);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Waktu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  _time,
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zona Waktu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _setZone('Asia/Jakarta');
                      },
                      child: Text('WIB'),
                      style: ElevatedButton.styleFrom(
                        primary: _zone == 'Asia/Jakarta' ? Colors.blue : null,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        _setZone('Asia/Makassar');
                      },
                      child: Text('WITA'),
                      style: ElevatedButton.styleFrom(
                        primary: _zone == 'Asia/Makassar' ? Colors.blue : null,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        _setZone('Asia/Jayapura');
                      },
                      child: Text('WIT'),
                      style: ElevatedButton.styleFrom(
                        primary: _zone == 'Asia/Jayapura' ? Colors.blue : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
