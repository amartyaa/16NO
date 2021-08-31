import 'package:build_out_loud/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetoLogin();
  }

  _navigatetoLogin() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => const Login()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(
            image: AssetImage('Assets/img/Icon.png'),
            height: 150,
            width: 150,
            fit: BoxFit.scaleDown,
          ),
          RichText(
            text: TextSpan(
              text: "Sol",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: "Cred",
                    style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(255, 131, 61, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
