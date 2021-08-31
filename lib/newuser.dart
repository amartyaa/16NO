import 'package:build_out_loud/home.dart';
import 'package:flutter/material.dart';
import 'loading.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  nav2home() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Loading()));
  }

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
            title: const Center(child: Text('New User')),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Stack(children: [
                    const CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey,
                      child: Text(
                        'New User Profile Pic',
                        style: TextStyle(color: Color.fromRGBO(21, 6, 78, 1)),
                      ),
                    ),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(21, 6, 78, 60),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ))
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, right: 15.0, left: 15.0),
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(21, 6, 78, 1)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0)),
                              labelText: 'First Name',
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(21, 6, 78, 1)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0)),
                              labelText: 'Last Name',
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(21, 6, 78, 1)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0)),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 200,
                        ),

                        //Continue Button
                        Center(
                            child: Padding(
                          padding:
                              const EdgeInsets.only(left: 110.0, right: 110.0),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.white)),
                              onPressed: nav2home,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Continue',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Icon(Icons.arrow_forward_ios_outlined,
                                      color: Colors.white)
                                ],
                              )),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
