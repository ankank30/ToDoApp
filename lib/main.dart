import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _getTodayDate () {
    DateTime dateTime = DateTime.now();     //DateTime.now() get system date and time
    return dateTime.day.toString() + '-' + dateTime.month.toString() + '-' + dateTime.year.toString();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      //Add Appbar
      appBar: AppBar(
        title: Text("TODO"),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 40.0),
            child: Icon(
              Icons.account_circle,
              size: 50.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
            child: Text(
              "Hello Ankesh",
              style: TextStyle(color: Colors.white, fontSize: 32.0),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
            child: Text(
              "Looks like feel good. \nYou have 3 tasks to do today.",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
            child: Text(
              'Today : ' + _getTodayDate(),
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,                           //Returns width of context from Widget build(context)
                                                                                // i.e. here in this case width of the phone screen
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                cardBuilder("Personal", 9, 11),
                cardBuilder("Work", 2, 20),
                cardBuilder("Home", 5, 8)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardBuilder(String title, int doneTask, int totalTask) {
    return Card(
      child: Container(
        height: 250.0,
        width: 180.0,
        padding: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      '$totalTask' + ' Tasks',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                      title,
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.black
                    ),
                  ),
                  LinearProgressIndicator(
                    value: (doneTask / totalTask),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Icon(Icons.account_circle),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.more_vert),
            )
          ],
        ),
      ),
    );
  }
}
