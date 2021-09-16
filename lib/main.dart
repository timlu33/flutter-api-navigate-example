import 'package:flutter/material.dart';
import 'package:future_builder_example/page2.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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
  int _counter = 0;

  final url = Uri.parse("https://api.github.com/users");

  /// promise way
  void _getGithubUsers() {
    getGithubUsers().then((response) => {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Page2(statusCode: response.statusCode)))
    });
  }

  /// async await way
  // void _getGithubUsers() async {
  //   final response = await getGithubUsers();
  //   Navigator.push(context, MaterialPageRoute(builder: (_) => Page2(statusCode: response.statusCode)));
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getGithubUsers,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Response> getGithubUsers() async {
    final response = await http.get(url);
    print(response.statusCode);
    return response;
  }
}
