// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'otp.dart';
import 'credapi.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

var borderData = const BorderSide(
  color: Colors.white, //Color of the border
  style: BorderStyle.solid, //Style of the border
  width: 1, //width of the border
);

class _LoginState extends State<Login> {
  _Nav2otp(String phone) async {
    print(phone);
    var Usertoken = await CredAPI.getOTP(phone);
    print(Usertoken);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const Otp(),
            settings: RouteSettings(arguments: Usertoken)));
  }

  // final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  String Phone = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Colors.black,
            Colors.black,
            Color.fromRGBO(21, 6, 78, 60),
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Icon of SolCred in above
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Image(
                        image: AssetImage('Assets/img/Icon.png'),
                        height: 68,
                        width: 37,
                        fit: BoxFit.scaleDown,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Sol",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Cred",
                                style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromRGBO(255, 131, 61, 1),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  ),
                  //spacer
                  const SizedBox(
                    height: 100,
                  ),
                  //Phone Number Text
                  const Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //TextField for Phone Number
                  Row(children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextFormField(
                        // controller: myController1,
                        keyboardType: TextInputType.number,
                        initialValue: '+91',
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          hintText: '+91',
                          hintStyle: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: TextField(
                        controller: myController2,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          hintText: 'Enter Your Phone Number',
                          fillColor: Colors.red,
                          hintStyle: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                  //Spacer
                  const SizedBox(
                    height: 300,
                  ),

                  //Continue Button
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 110.0, right: 110.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white)),
                        onPressed: () {
                          setState(() {
                            Phone = myController2.text;
                            _Nav2otp(Phone);
                          });
                        },
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Text(
                              'Continue',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward_ios_outlined,
                                size: 16, color: Colors.white)
                          ],
                        )),
                  ))
                ],
              ),
            ),
          ))),
    );
  }
}
