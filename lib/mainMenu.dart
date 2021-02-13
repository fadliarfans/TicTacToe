import 'package:animated_background/animated_background.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tictactoe/mainGameTwoPlayer.dart';

import 'mainGameSinglePlayer.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  AudioCache audioCache;
  ParticleOptions particles = ParticleOptions(
      baseColor: Colors.white,
      spawnOpacity: 0.0,
      opacityChangeRate: 0.25,
      minOpacity: 0.1,
      maxOpacity: 0.4,
      spawnMinSpeed: 30.0,
      spawnMaxSpeed: 70.0,
      spawnMinRadius: 7.0,
      spawnMaxRadius: 15.0,
      particleCount: 20);
  @override
  void initState() {
    super.initState();
    audioCache = AudioCache(
        prefix: 'music/',
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  @override
  void dispose() {
    super.dispose();
    audioCache.clear('3.mp3');
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) => AlertDialog(
              title: Text(
                'Are you sure?',
              ),
              content: Text(
                'Do you want to Exit',
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    'No',
                  ),
                ),
                FlatButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: Text(
                    'Yes',
                  ),
                ),
              ],
            ),
          )) ??
          false;
    }

    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 54, 54, 54),
          body: AnimatedContainer(
            duration: Duration(seconds: 1),
            child: AnimatedBackground(
              behaviour: RandomParticleBehaviour(options: particles),
              vsync: this,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      margin: EdgeInsets.all(20),
                      duration: Duration(seconds: 1),
                      child: Text(
                        'TIC TAC TOE',
                        style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width / 8),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        audioCache.play('3.mp3');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainGameSinglePlayer()));
                      },
                      child: AnimatedContainer(
                        padding: EdgeInsets.all(10),
                        width: width / 2,
                        margin: EdgeInsets.all(10),
                        duration: Duration(seconds: 1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            'Single Player',
                            style: GoogleFonts.rubik(
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontWeight: FontWeight.bold,
                                fontSize: width / 17),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        audioCache.play('3.mp3');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainGameTwoPlayer()));
                      },
                      child: AnimatedContainer(
                        width: width / 2,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        duration: Duration(seconds: 1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            'Two Player',
                            style: GoogleFonts.rubik(
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontWeight: FontWeight.bold,
                                fontSize: width / 17),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        audioCache.play('3.mp3');
                        SystemNavigator.pop();
                      },
                      child: AnimatedContainer(
                        width: width / 2,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        duration: Duration(seconds: 1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            'Exit',
                            style: GoogleFonts.rubik(
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontWeight: FontWeight.bold,
                                fontSize: width / 17),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
