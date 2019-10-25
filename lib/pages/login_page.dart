import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil('/index', (route) => false);
          },
        ),
        title: Text('用户登录'),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              TitleImage(),
              WavyHeader(),
            ],
          )
        ],
      ),
    );
  }
}

class TitleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(170)),
      child: Center(
        child: Image.asset(
          'assets/images/login_logo.png',
          width: ScreenUtil().setWidth(500),
        ),
      ),
    );
  }
}

class WavyHeader extends StatelessWidget {
  const WavyHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: orangeGradients,
            begin: Alignment.topLeft,
            end: Alignment.center,
          ),
        ),
        height: MediaQuery.of(context).size.height / 2.5,
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print(size);
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    //creating first curver near bottom left corner
    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    //creating second curver near center
    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    //creating third curver near top right corner
    var thirdControlPoint = Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

    ///move to top right corner
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

const List<Color> orangeGradients = [
  Color(0xFFFF9844),
  Color(0xFFFE8853),
  Color(0xFFFD7267),
];
