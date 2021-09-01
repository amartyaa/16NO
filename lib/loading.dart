import 'package:build_out_loud/home.dart';
import 'package:build_out_loud/otp.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

//  usertoken;
class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      String usertoken = ModalRoute.of(context)!.settings.arguments as String;
      _navigatetoHome(usertoken);
    });
    // String usertoken = ModalRoute.of(context)!.settings.arguments as String;

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   print("WidgetsBinding");
    // });
  }

  _navigatetoHome(String usertoken) async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Home(usertoken: usertoken),
            settings: RouteSettings(arguments: usertoken)));
  }

  @override
  Widget build(BuildContext context) {
    // final String userToken =
    //     ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Image(
        image: AssetImage("Assets/gif/loading.gif"),
      ),
      const Text(
        'Please Wait While We Are',
        style: TextStyle(fontSize: 25, color: Color.fromRGBO(215, 238, 232, 1)),
      ),
      TextLiquidFill(
        // boxBackgroundColor: Colors.blue,
        loadDuration: const Duration(seconds: 5),
        waveDuration: const Duration(seconds: 2),
        boxHeight: 68,
        text: 'LOADING',
        textStyle: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Colors.white),
        waveColor: const Color.fromARGB(255, 53, 206, 190),
      ),
    ]));
  }
}
