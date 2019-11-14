import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:td_player/configs/urls.dart';
import 'package:td_player/models/user.dart';
import 'package:td_player/providers/userinfo.dart';
import 'package:td_player/service/url_request.dart';

const List<Color> orangeGradients = [
  Color(0xFFFF9844),
  Color(0xFFFE8853),
  Color(0xFFFD7267),
];

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  _LoginFormState createState() => _LoginFormState();
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
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

class _LoginFormState extends State<LoginForm> {
  TextEditingController _unameControle = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> _helpTextList = List<String>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: ScreenUtil().setWidth(600),
        // height: ScreenUtil().setHeight(440),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              _helpText(),
              _uname(),
              _pwd(),
              _submitBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _helpText() {
    return Visibility(
      visible: _helpTextList.length > 0,
      child: Container(
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
        child: Column(
          children: _helpTextList
              .map(
                (val) => Text(
                  '-$val',
                  style: TextStyle(color: Colors.red),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _pwd() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Material(
        elevation: 10.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextFormField(
            controller: _passwordControler,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '请输入密码',
              hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitBtn() {
    return Builder(
      builder: (BuildContext mContext) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10, top: 20),
          child: Stack(
            alignment: Alignment(1.0, 0.0),
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(mContext).size.width / 2.7,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: FlatButton(
                  child: Text('登陆', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                  onPressed: () {
                    getRequestData(
                      getServiceUrl('login'),
                      formData: {'email': _unameControle.value.text, 'password': _passwordControler.value.text},
                    ).then((loginData) {
                      Provider.of<UserInfoNotifier>(context).setUserData(loginData);
                      print('登陆成功:$loginData');
                      Navigator.of(context).pushNamedAndRemoveUntil('/index', (Route<dynamic> route) => false);
                    }).catchError((onError) => print(onError));
                    // getLogin(_unameControle.value.text, _passwordControler.value.text).then((data) => print(data));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    // return Container(
    //   child: RaisedButton(
    //     child: Text('登陆'),
    //     onPressed: () {
    //       _helpTextList.clear();
    //       if (_unameControle.text.trim() == '') {
    //         print('用户名不能为空');
    //         _helpTextList.add('用户名不能为空');
    //       }
    //       if (_passwordControler.text.trim() == '') {
    //         print('密码不能为空');
    //         _helpTextList.add('密码不能为空');
    //       }

    //       if (_helpTextList.length > 0) {
    //         setState(() {});
    //       }

    //       if (_formKey.currentState.validate()) {
    //         print('提交登陆');
    //       }
    //     },
    //   ),
    // );
  }

  Widget _uname() {
    _unameControle.value = TextEditingValue(text: 'tidusff2000@163.com');
    _passwordControler.value = TextEditingValue(text: 'Kk32009320');

    return Material(
      elevation: 10.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: TextFormField(
          controller: _unameControle,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '请输入用户名',
            hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14),
          ),
        ),
      ),
    );
  }
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
          ),
          LoginForm(),
        ],
      ),
      // body: LoginForm(),
    );
  }
}
