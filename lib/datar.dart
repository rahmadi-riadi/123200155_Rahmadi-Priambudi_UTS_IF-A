import 'dart:math';

import 'package:flutter/material.dart';

class DatarPage extends StatefulWidget {
  @override
  _DatarPageState createState() => _DatarPageState();
}

class _DatarPageState extends State<DatarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Bangun Datar"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrapesiumPage()),
                );
              },
              child: Text('Trapesium'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabungPage()),
                );
              },
              child: Text('Tabung'),
            ),
          ],
        ),
      ),
    );
  }
}

class TrapesiumPage extends StatefulWidget {
  @override
  _TrapesiumPageState createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  final _formKey = GlobalKey<FormState>();
  double _sisiAtas = 0;
  double _sisiBawah = 0;
  double _tinggi = 0;
  double _hasilLuas = 0;
  double _hasilKeliling = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trapesium'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Sisi atas'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Sisi atas harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _sisiAtas = double.parse(value!);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Sisi bawah'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Sisi bawah harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _sisiBawah = double.parse(value!);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Tinggi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tinggi harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _tinggi = double.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() {
                      _hasilLuas = 0.5 * (_sisiAtas + _sisiBawah) * _tinggi;
                      _hasilKeliling = _sisiAtas + _sisiBawah +
                          (2 * sqrt(pow((_sisiBawah - _sisiAtas) / 2, 2) +
                              pow(_tinggi, 2)));
                    });
                  }
                },
                child: Text('Hitung'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Hasil Luas: $_hasilLuas',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'Hasil Keliling: $_hasilKeliling',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabungPage extends StatefulWidget {
  @override
  _TabungPageState createState() => _TabungPageState();
}

class _TabungPageState extends State<TabungPage> {
  final _formKey = GlobalKey<FormState>();
  double? _jariJari;
  double? _tinggi;
  double? _hasilLuas;
  double? _hasilKeliling;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabung'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Jari-jari'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jari-jari harus diisi';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _jariJari = double.parse(value!);
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Tinggi'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tinggi harus diisi';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _tinggi = double.parse(value!);
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        _hasilLuas = 2 * pi * _jariJari! * (_jariJari! + _tinggi!);
                        _hasilKeliling = 2 * pi * _jariJari!;
                      });
                    }
                  },
                  child: Text('Hitung'),
                ),
                SizedBox(height: 16.0),
                if (_hasilLuas != null && _hasilKeliling != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Luas tabung: $_hasilLuas'),
                      SizedBox(height: 8.0),
                      Text('Keliling tabung: $_hasilKeliling'),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

