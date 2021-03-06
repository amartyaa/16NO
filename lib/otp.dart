// ignore_for_file: avoid_print

import 'package:build_out_loud/loading.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'newuser.dart';
import 'credapi.dart';

String otp = "";

String usertoken = "";

class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);
  Future<dynamic> _validate(String usertoken, String otp) async {
    var status = await CredAPI.verifyOTP(usertoken, otp);
    // print(status['existing_user']);
    return status;
  }

  @override
  Widget build(BuildContext context) {
    final String usertoken =
        ModalRoute.of(context)!.settings.arguments as String;
    return
        //background gradient container
        Container(
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

      //working area
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
                // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            }),
          ),
          // resizeToAvoidBottomInset: false,
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
                  //OTP Text
                  const Text(
                    'OTP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  //spacer
                  const SizedBox(
                    height: 25,
                  ),

                  //OTP text field
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: OTPTextField(
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      style: const TextStyle(color: Colors.white),
                      otpFieldStyle:
                          OtpFieldStyle(enabledBorderColor: Colors.white),
                      onChanged: (value) {
                        // print(value);
                      },
                      onCompleted: (value) {
                        print(value);
                        otp = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),

                  //Continue Button
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 110.0, right: 110.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white)),
                        onPressed: () async {
                          var op = await _validate(usertoken, otp);
                          var flag = op['existing_user'];
                          var actoken = op['access_token'];
                          if (flag == false) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const NewUser(),
                                    settings: RouteSettings(arguments: actoken)));
                          } else {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const Loading(),
                                    settings: RouteSettings(arguments: actoken)));
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
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
