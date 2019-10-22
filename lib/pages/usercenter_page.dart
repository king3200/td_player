import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/test.dart';


class UserCenterPage extends StatefulWidget {
  @override
  _UserCenterPageState createState() => _UserCenterPageState();
}

class _UserCenterPageState extends State<UserCenterPage> {
  @override
  void initState() { 
    print('-----------------初始化usercenter_page');
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Text('用户中心${Provider.of<TestCountNotifier>(context).count}'),
      ),
    );
  }
}