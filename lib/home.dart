import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: const [
          Card(
              child: Image(
            image: NetworkImage(
                'https://images.pexels.com/photos/1144694/pexels-photo-1144694.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
          )),
          Center(
            child: Text(
              "This is Body Of Our App",
              // style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
