import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/dummyData.dart';
import 'package:wallpaper/screen/images.dart';
import 'package:wallpaper/screen/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Data(),
        ),
        ChangeNotifierProvider(create: (context) => Dummy())
      ],
      child: MaterialApp(
        title: "Wallpaper",
        home: Screen(),
        routes: {
          '/screen': (ctx) => Screen(),
        },
      ),
    );
  }
}
