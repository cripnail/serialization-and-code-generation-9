import 'package:flutter/material.dart';
import 'user.dart';
import 'package:dio/dio.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:build_runner/build_runner.dart';

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
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    //getDataHttp();
    getDataDio();
  }

  getDataDio() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await _dio
          .get('https://run.mocky.io/v3/d22334ec-ebae-45e2-8ae3-9c8dfa0d4333');
      var data = response.data;
      users = data.map<User>((user) => User.fromJson(user)).toList();
    } on DioError catch (e) {
      setState(() {
        errorMessage = e.response.data['message'];
        hasError = true;
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: <Widget>[
          if (!isLoading && hasError) Text(errorMessage),
          if (!isLoading && hasError == false)
            Expanded(
              child: ListView(children: <Widget>[
                ...users.map((user) {
                  return ListTile(
                    title: Text(user.email),
                    subtitle: Text(user.name),
                  );
                }).toList(),
              ]),
            )
        ]));
  }
}
