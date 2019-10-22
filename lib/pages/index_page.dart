import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './home_page.dart';
import './mymusic_page.dart';
import './usercenter_page.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentBottomNavIndex = 0;
  PageController _pageController = PageController();
  List<Widget> pageList = [
    HomePage(),
    MyMusicPage(),
    UserCenterPage(),
  ];

  @override
  void initState() {
    print('-----------------初始化index_page');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1344)..init(context);

    return Container(
      child: Scaffold(
        body: PageView(
          children: pageList,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentBottomNavIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentBottomNavIndex,
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music), title: Text('歌单')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('我的')),
          ],
        ),
      ),
    );
  }
}
