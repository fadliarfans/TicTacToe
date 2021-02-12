import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tictactoe/cell.dart';
import 'package:project_tictactoe/mainMenu.dart';

class MainGameTwoPlayer extends StatefulWidget {
  @override
  _MainGameTwoPlayerState createState() => _MainGameTwoPlayerState();
}

class _MainGameTwoPlayerState extends State<MainGameTwoPlayer> {
  AudioCache audioCache;
  AudioCache audioCache2;
  final ValueNotifier<String> _counter10 = ValueNotifier<String>('');
  final ValueNotifier<int> _counterP1Win = ValueNotifier<int>(0);
  final ValueNotifier<int> _counterP2Win = ValueNotifier<int>(0);
  final ValueNotifier<int> _counter1 = ValueNotifier<int>(0);
  final ValueNotifier<int> _counter2 = ValueNotifier<int>(0);
  final ValueNotifier<int> _counter3 = ValueNotifier<int>(0);
  final ValueNotifier<int> _counter4 = ValueNotifier<int>(0);
  final ValueNotifier<int> _counter5 = ValueNotifier<int>(0);
  final ValueNotifier<int> _counter6 = ValueNotifier<int>(0);
  final ValueNotifier<int> _counter7 = ValueNotifier<int>(0);
  final ValueNotifier<int> _counter8 = ValueNotifier<int>(0);
  final ValueNotifier<int> _counter9 = ValueNotifier<int>(0);

  Map<int, ValueNotifier<int>> counterMap = {};
  var value;

  void changeValue() {
    setState(() {
      value = value == true ? false : true;
    });
    _counter10.value = value == true ? 'Player 1 Turn' : 'Player 2 turn';
    checkWin();
    if (_counter10.value != 'Player 1 Win' &&
        _counter10.value != 'Player 2 Win') {
      audioCache.play('1.mp3');
    }
  }

  void checkWin() {
    if (counterMap[0].value == 1 &&
        counterMap[1].value == 1 &&
        counterMap[2].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterMap[3].value == 1 &&
        counterMap[4].value == 1 &&
        counterMap[5].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterMap[6].value == 1 &&
        counterMap[7].value == 1 &&
        counterMap[8].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterMap[0].value == 1 &&
        counterMap[3].value == 1 &&
        counterMap[6].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterMap[1].value == 1 &&
        counterMap[4].value == 1 &&
        counterMap[7].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterMap[2].value == 1 &&
        counterMap[5].value == 1 &&
        counterMap[8].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterMap[0].value == 1 &&
        counterMap[4].value == 1 &&
        counterMap[8].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterMap[2].value == 1 &&
        counterMap[4].value == 1 &&
        counterMap[6].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }

    if (counterMap[0].value == 2 &&
        counterMap[1].value == 2 &&
        counterMap[2].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterMap[3].value == 2 &&
        counterMap[4].value == 2 &&
        counterMap[5].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterMap[6].value == 2 &&
        counterMap[7].value == 2 &&
        counterMap[8].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterMap[0].value == 2 &&
        counterMap[3].value == 2 &&
        counterMap[6].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterMap[1].value == 2 &&
        counterMap[4].value == 2 &&
        counterMap[7].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterMap[2].value == 2 &&
        counterMap[5].value == 2 &&
        counterMap[8].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterMap[0].value == 2 &&
        counterMap[4].value == 2 &&
        counterMap[8].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterMap[2].value == 2 &&
        counterMap[4].value == 2 &&
        counterMap[6].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
  }

  Future afterWin() async {
    audioCache2.play('2.mp3');
    setState(() {
      value = true;
    });
    await Future.delayed(Duration(seconds: 2));
    for (int i = 0; i < 9; i++) {
      counterMap[i].value = 0;
    }
    _counter10.value = value == true ? 'Player 1 Turn' : 'Player 2 turn';
  }

  void restart() {
    for (int i = 0; i < 9; i++) {
      counterMap[i].value = 0;
    }
    _counter10.value = '';
    value = true;
    _counter10.value = value == true ? 'Player 1 Turn' : 'Player 2 turn';
  }

  @override
  void initState() {
    super.initState();
    value = true;
    counterMap.addAll({
      0: _counter1,
      1: _counter2,
      2: _counter3,
      3: _counter4,
      4: _counter5,
      5: _counter6,
      6: _counter7,
      7: _counter8,
      8: _counter9
    });

    _counter10.value = value == true ? 'Player 1 Turn' : 'Player 2 turn';
    audioCache = AudioCache(
        prefix: 'music/',
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
    audioCache2 = AudioCache(
        prefix: 'music/',
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  @override
  void dispose() {
    audioCache.clear('1.mp3');
    audioCache2.clear('2.mp3');
    counterMap.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 54, 54, 54),
        appBar: AppBar(
          leading: IconButton(
              color: Color.fromARGB(255, 54, 54, 54),
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainMenu()));
              }),
          title: Text('       Tic Tac Toe',
              style: GoogleFonts.rubik(
                  fontWeight: FontWeight.bold, color: Colors.grey[700])),
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            restart();
          },
          child: Icon(Icons.repeat, color: Colors.grey[700]),
        ),
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.white,
            child: Container(height: height / 14)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Cell(
                  counter: _counter1,
                  value: value,
                  callBack: changeValue,
                ),
                Cell(
                  counter: _counter2,
                  value: value,
                  callBack: changeValue,
                ),
                Cell(
                  counter: _counter3,
                  value: value,
                  callBack: changeValue,
                ),
              ],
            ),
            Row(
              children: [
                Cell(
                  counter: _counter4,
                  value: value,
                  callBack: changeValue,
                ),
                Cell(
                  counter: _counter5,
                  value: value,
                  callBack: changeValue,
                ),
                Cell(
                  counter: _counter6,
                  value: value,
                  callBack: changeValue,
                ),
              ],
            ),
            Row(
              children: [
                Cell(
                  counter: _counter7,
                  value: value,
                  callBack: changeValue,
                ),
                Cell(
                  counter: _counter8,
                  value: value,
                  callBack: changeValue,
                ),
                Cell(
                  counter: _counter9,
                  value: value,
                  callBack: changeValue,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    child: ValueListenableBuilder(
                      valueListenable: _counterP1Win,
                      builder:
                          (BuildContext context, dynamic value, Widget child) {
                        return Container(
                          child: Text('P1 : $value',
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: width / 20)),
                        );
                      },
                    )),
                Container(
                    margin: EdgeInsets.all(10),
                    child: ValueListenableBuilder(
                      valueListenable: _counter10,
                      builder:
                          (BuildContext context, dynamic value, Widget child) {
                        return Container(
                          child: Text(value,
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: width / 14)),
                        );
                      },
                    )),
                Container(
                    margin: EdgeInsets.all(10),
                    child: ValueListenableBuilder(
                      valueListenable: _counterP2Win,
                      builder:
                          (BuildContext context, dynamic value, Widget child) {
                        return Container(
                          child: Text('P2 : $value',
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: width / 20)),
                        );
                      },
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
