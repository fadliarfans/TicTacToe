import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mainMenu.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future pushPage() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainMenu()));
  }

  @override
  void initState() {
    super.initState();
    pushPage();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 54, 54),
      body: Container(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
                width: width / 2,
                height: width / 2,
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Image.asset('images/icon.PNG', fit: BoxFit.fill),
                    decoration: BoxDecoration(
                        color: Colors.grey[700],
                        border: Border.all(width: 4, color: Colors.white)))),
            Container(
              margin: EdgeInsets.only(bottom: height / 6),
              child: Text(
                'TIC TAC TOE',
                style: GoogleFonts.rubik(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SpinKitFadingCube(color: Colors.white, size: width / 10)
          ]),
        ),
      ),
    );
  }
}
