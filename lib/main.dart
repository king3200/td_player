import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './theme.dart';
import 'pages/index_page.dart';
import 'package:provider/provider.dart';
import './providers/test.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TestCountNotifier>(builder: (context) => TestCountNotifier(),)
      ],
      child: MyApp(),  
    )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      title: 'td播放器测试项目',
      debugShowCheckedModeBanner: false,
      home: IndexPage(), 
    );
  }
}