import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.arrow_back_ios),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
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
                                color: const Color.fromRGBO(255, 131, 61, 1),
                                fontSize: 25,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
            ),
            //spacer
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'solCreds',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    width: 210,
                  ),
                  Image(image: AssetImage('Assets/img/Dollar.png')),
                  Text(
                    '5000',
                    style: TextStyle(fontSize: 24),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Earn SolCreds',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200, // card height
              child: PageView.builder(
                itemCount: 5,
                controller: PageController(viewportFraction: 0.65),
                onPageChanged: (int index) => setState(() => _index = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: i == _index ? 1 : 0.95,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        decoration: const BoxDecoration(
                            // border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(116, 255, 230, 60),
                                  Color.fromRGBO(40, 136, 189, 60),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                tileMode: TileMode.mirror)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
