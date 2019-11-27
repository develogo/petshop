import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:petshop/screens/dashboard/dashboard.dart';


const request = 'https://ancient-depths-01496.herokuapp.com/getLiveViewMobile';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LocalAuthentication auth = LocalAuthentication();
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  Future<Map> x;

  @override
  void initState() {
    x = getData();
    super.initState();
    _getUser();
  }

  Future<Map> getData() async {
    http.Response response = await http.get(request);
    return json.decode(response.body);
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    if (authenticated == true) {
      Navigator.of(context)
          .pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
                  DashBoard()), (
          Route<
              dynamic>route) => false);
    }
    setState(() {
      _authorized = message;
    });
  }


  final GlobalKey<ScaffoldState> _scafoldstate = new GlobalKey<ScaffoldState>();

  final userController = TextEditingController();
  final userPassController = TextEditingController();

  bool _obscureTextLogin = true;
  String user;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scafoldstate,
        body: FutureBuilder<Map>(
            future: x,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Scaffold(
                      body: Container(
                          alignment: Alignment.center,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          decoration: BoxDecoration(
                            gradient: new LinearGradient(
                              colors: [Color(0xff0072ce), Color(0xff0072ce)],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp,
                            ),
                          ),
                          child: Container(
                            width: 200,
                            height: 100,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/logo_Dashboard_splash.png'),
                            ),
                          )
                      )
                  );
                default:
                  if (snapshot.hasError) {
                    return Container(
                      alignment: Alignment.center,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                          colors: [Color(0xFF03A9F4), Color(0xFF01579B)],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      child: Text(
                        "Erro ao obter dados",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else {
                    final user = snapshot.data['username'];
                    final password = snapshot.data['password'];

                    return SingleChildScrollView(
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [Color(0xf21c4c4), Color(0xff0072ce)],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 200,
                              height: 200,
                              child: Image(
                                image: AssetImage('assets/images/logo.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1.0),
                              child: Container(
                                width: 314.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0x552B2B2B),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Pet Maniacos",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: 'WorkSansSemiBold',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 23.0),
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    overflow: Overflow.visible,
                                    children: <Widget>[
                                      Card(
                                        elevation: 2.0,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: 300.0,
                                          height: 190.0,
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 20.0,
                                                    bottom: 20.0,
                                                    left: 25.0,
                                                    right: 25.0),
                                                child: TextField(
                                                  //focusNode: myFocusNodeEmailLogin,
                                                  controller: userController,
                                                  enabled: true,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  style: TextStyle(
                                                      fontFamily:
                                                      "WorkSansSemiBold",
                                                      fontSize: 16.0,
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    icon: Icon(
                                                      FontAwesomeIcons.user,
                                                      color: Colors.black,
                                                      size: 22.0,
                                                    ),
                                                    hintText: "Usuário",
                                                    hintStyle: TextStyle(
                                                        fontFamily:
                                                        "WorkSansSemiBold",
                                                        fontSize: 17.0),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 250.0,
                                                height: 1.0,
                                                color: Colors.grey[400],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 20.0,
                                                    bottom: 20.0,
                                                    left: 25.0,
                                                    right: 25.0),
                                                child: TextField(
                                                  //focusNode: myFocusNodePasswordLogin,
                                                  controller:
                                                  userPassController,
                                                  obscureText:
                                                  _obscureTextLogin,
                                                  style: TextStyle(
                                                      fontFamily:
                                                      "WorkSansSemiBold",
                                                      fontSize: 16.0,
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    icon: Icon(
                                                      FontAwesomeIcons.lock,
                                                      size: 22.0,
                                                      color: Colors.black,
                                                    ),
                                                    hintText: "Senha",
                                                    hintStyle: TextStyle(
                                                      fontFamily:
                                                      "WorkSansSemiBold",
                                                      fontSize: 17.0,
                                                    ),
                                                    suffixIcon: GestureDetector(
                                                      onTap: _toggleLogin,
                                                      child: Icon(
                                                        _obscureTextLogin
                                                            ? FontAwesomeIcons
                                                            .eye
                                                            : FontAwesomeIcons
                                                            .eyeSlash,
                                                        size: 15.0,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 170.0),
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Color(0xFF03A9F4),
                                              offset: Offset(1.0, 6.0),
                                              blurRadius: 20.0,
                                            ),
                                            BoxShadow(
                                              color: Color(0xFF01579B),
                                              offset: Offset(1.0, 6.0),
                                              blurRadius: 20.0,
                                            ),
                                          ],
                                          gradient: new LinearGradient(
                                              colors: [
                                                Color(0xFF01579B),
                                                Color(0xFF03A9F4)
                                              ],
                                              begin: const FractionalOffset(
                                                  0.2, 0.2),
                                              end: const FractionalOffset(
                                                  1.0, 1.0),
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp),
                                        ),
                                        child: MaterialButton(
                                            highlightColor: Colors.transparent,
                                            splashColor: Color(
                                                0xFF01579B),
                                            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 42.0),
                                              child: Text(
                                                "Entrar",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25.0,
                                                    fontFamily: "WorkSansBold"),
                                              ),
                                            ),
                                            onPressed: () {
                                              if (userController.text == user) {
                                                if (userPassController.text ==
                                                    password) {
                                                  _saveUser();
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DashBoard()), (
                                                      Route<
                                                          dynamic>route) => false);
                                                } else {
                                                  showInSnackBarRed(
                                                      "Senha Inválida!");
                                                }
                                              } else {
                                                showInSnackBarRed(
                                                    'Usuário Inválido!');
                                              } //Navigator.push(context, MaterialPageRoute(builder: (context) => Consulta()));
                                            }),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              }
            }));
  }

  void showInSnackBarRed(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scafoldstate.currentState?.removeCurrentSnackBar();
    _scafoldstate.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
    ));
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }
  _saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('usuario', userController.text);
  }


  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString('usuario');
    if (stringValue != null){
      print('tem dado');
      _authenticate();
    }
    return stringValue;
  }





}


