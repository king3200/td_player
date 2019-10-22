import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/test.dart';


class MyMusicPage extends StatefulWidget {
  @override
  _MyMusicPageState createState() => _MyMusicPageState();
}

class _MyMusicPageState extends State<MyMusicPage> {

  @override
  void initState() {
    print('-----------------初始化mymusic_page');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('${Provider.of<TestCountNotifier>(context).count}'),
      ),
    );
  }
}