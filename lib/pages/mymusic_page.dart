import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_player/models/user.dart';
import 'package:td_player/providers/userinfo.dart';
import '../providers/userinfo.dart';

class MyMusicPage extends StatefulWidget {
  @override
  _MyMusicPageState createState() => _MyMusicPageState();
}

class _MyMusicPageState extends State<MyMusicPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Timer timer;

  @override
  void initState() {
    print('-----------------初始化mymusic_page');
    super.initState();
  }

  @override
  void dispose() {
    if (timer != null) timer.cancel();
    print('------------------mymusic_page dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 检查是否登陆
    User user = Provider.of<UserInfoNotifier>(context).user;
    if (user == null) {
      // Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
      timer = Timer(Duration(milliseconds: 1000), () {
        try {
          Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
        } catch (e) {
          print(e);
        }
      });

      return Container(
        child: Center(
          child: Text('啊哦，您没有登录哦'),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.wb_cloudy),
            onPressed: () => print('我的音乐云盘'),
          ),
          title: Text('我的音乐'),
        ),
        body: Text(Provider.of<UserInfoNotifier>(context).user.account.toString()),
      );
    }
  }
}
