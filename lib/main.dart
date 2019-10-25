import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:td_player/pages/home_page.dart';
import 'package:td_player/pages/login_page.dart';
import 'package:td_player/pages/mymusic_page.dart';
import 'package:td_player/pages/usercenter_page.dart';
import 'package:td_player/providers/userinfo.dart';
import './theme.dart';
import 'pages/index_page.dart';
import 'package:provider/provider.dart';
import './providers/test.dart';

void main() {
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TestCountNotifier>(
        builder: (context) => TestCountNotifier(),
      ),
      ChangeNotifierProvider<UserInfoNotifier>(
        builder: (context) => UserInfoNotifier(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/index': (BuildContext context) => IndexPage(),
        '/home': (BuildContext context) => HomePage(),
        '/mymusic': (BuildContext context) => MyMusicPage(),
        '/usercenter': (BuildContext context) => UserCenterPage(),
        '/login': (BuildContext context) => LoginPage(),
      },
      theme: myTheme,
      title: 'td播放器测试项目',
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}
