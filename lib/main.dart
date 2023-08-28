import 'package:flutter/material.dart';
import 'cupertino_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { //화면이 변경 될 일이 없는것.
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CupertinoPage()
    );
  }
}

class HelloPage extends StatefulWidget {  //상태를 가질 수 있는 위젯의 기본 형태이다.

  final String title;

  HelloPage(this.title): super();

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {

  String _message = 'hello World';
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _changeMessage),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_message, style: TextStyle(fontSize: 30)),
              Text('$_counter', style: TextStyle(fontSize: 30)),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CupertinoPage()));
              }, child: Text('화면 이동'))
            ],
          ))
      );Text(widget.title, style: TextStyle(fontSize: 30));
  }

  void _changeMessage() {
    setState(() {
      _message = '헬로 월드';
      _counter++;
    });
  }
}
