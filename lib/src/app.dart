import 'package:flutter/material.dart';
import 'package:newdhanlakshmi/src/blocs/provider.dart';
import './screens/fillup_screen.dart';
import './blocs/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'DhanLakshmi',
        home: Scaffold(
          body: FillUpScreen(),
        ),
      ),
    );
  }
}
