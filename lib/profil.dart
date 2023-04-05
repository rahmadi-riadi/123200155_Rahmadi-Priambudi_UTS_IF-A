import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/OIP.GlXqxcR9EmviN5kuwaUsMQHaIB?pid=ImgDet&rs=1'),
                ),
                SizedBox(height: 10),
                Text(
                  'Nama : Rahmadi Priambudi Riadi',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 5),
                Text(
                  'NIM : 123200155',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileDetail()),
              );
            },
            child: Text('Detail'),
          ),
        ],
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Profil'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.GlXqxcR9EmviN5kuwaUsMQHaIB?pid=ImgDet&rs=1'),
            ),
            SizedBox(height: 10),
            Text(
              'Nama : Rahmadi Priambudi Riadi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'NIM: 123200155',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Kelas: IF-A',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Tempat Lahir: Semarang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Tanggal Lahir: 04-07-2001',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Harapan/Cita-cita: dipermudah jalan mencapai keinginan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
