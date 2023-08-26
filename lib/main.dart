import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake campground',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text('Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
          FavWidget()
        ],
      ),
    );

    Widget buttonSection = SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
          _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(30),
      child: const Text(
        'Lake Osechinen lies at the foot of the Bluemlisalp in the Bernese Alps.Situated 1,578 meters above sea level,it is One of the largest Alpine Lakes.'
        'A gondola ride frome kandersteg,folled by a half-hour walk thriugh pastures and pine torest,leads you to the lake,Which warms to 20 degrees Celsius in the summer. Activeties enjoyed here include rowing,and'
        'ridding the summer toboggan run.',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lake View App'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lakeview.jpeg',
              width: 600,
              height: 250,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: color),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        ),
      ],
    );
  }
}

class FavWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  bool _isfav = true;
  int _favcount = 41;

  void _toggleFav() {
    setState(() {
      if (_isfav) {
        _favcount -= 1;
        _isfav = false;
      } else {
        _favcount += 1;
        _isfav = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(left: 100),
          child: IconButton(
            onPressed: _toggleFav,
            icon: (_isfav
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text(
              '$_favcount',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
