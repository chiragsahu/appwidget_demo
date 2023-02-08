import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('testChannel');

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
            Text("Please add the widget to the homescreen before clicking the button"),
            ElevatedButton(
              style: ElevatedButton.styleFrom( primary: Colors.red),
              onPressed: () async {
                final String result =
                    await platform.invokeMethod('testMethod', {"color":"red"});
              },
              child: const Text("RED"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom( primary: Colors.green),
              onPressed: () async {
                final String result =
                    await platform.invokeMethod('testMethod', {"color":"green"});
              },
              child: const Text("GREEN"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom( primary: Colors.blue),
              onPressed: () async {
                final String result =
                    await platform.invokeMethod('testMethod', {"color":"blue"});
              },
              child: const Text("BLUE"),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
