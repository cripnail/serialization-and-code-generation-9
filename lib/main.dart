import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:build_runner/build_runner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  bool hasError = false;
  List<User> users;
  String errorMessage;

  @override
  void initState() {
    super.initState();
    getDataHttp();
  }

  getDataHttp() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http
          .get('https://run.mocky.io/v3/af5ffb01-5cc0-4b87-95b5-47b0fcce1c96');
      var data = json.decode(response.body);
      users = data.map<User>((user) => User.fromJson(user)).toList();
    } catch (e) {
      setState(() {
        hasError = false;
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
      // hasError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Preload'),
      ),
      body:
      isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
          ? Text('Page not found')
          : ListView(children: <Widget>[
        ...users.map((user) {
          return ListTile(
            title: Text(user.email),
            subtitle: Text(user.name),
          );
        }).toList(),
      ]),
    );
  }
}