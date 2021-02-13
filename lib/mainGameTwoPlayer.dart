import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  var cannotTouch;
  final ValueNotifier<String> _counter10 = ValueNotifier<String>('');
  final ValueNotifier<int> _counterP1Win = ValueNotifier<int>(0);
  final ValueNotifier<int> _counterP2Win = ValueNotifier<int>(0);

  List<ValueNotifier<int>> counterList = [];
  List<Cell> cellList = [];
  var value = true;
  var isWin;

  void changeValue() {
    setState(() {
      value = value == true ? false : true;
      for (int i = 0; i < 9; i++) {
        cellList[i].setValue = value;
      }
    });
    _counter10.value = value == true ? 'Player 1 Turn' : 'Player 2 turn';
    if (_counter10.value != 'Player 1 Win' &&
        _counter10.value != 'Player 2 Win') {
      audioCache.play('1.mp3');
    }
    checkWin();
    checkDraw();
  }

  void checkWin() {
    if (counterList[0].value == 1 &&
        counterList[1].value == 1 &&
        counterList[2].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterList[3].value == 1 &&
        counterList[4].value == 1 &&
        counterList[5].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterList[6].value == 1 &&
        counterList[7].value == 1 &&
        counterList[8].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterList[0].value == 1 &&
        counterList[3].value == 1 &&
        counterList[6].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterList[1].value == 1 &&
        counterList[4].value == 1 &&
        counterList[7].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterList[2].value == 1 &&
        counterList[5].value == 1 &&
        counterList[8].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterList[0].value == 1 &&
        counterList[4].value == 1 &&
        counterList[8].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }
    if (counterList[2].value == 1 &&
        counterList[4].value == 1 &&
        counterList[6].value == 1) {
      _counter10.value = 'Player 1 Win';
      _counterP1Win.value++;
      afterWin();
    }

    if (counterList[0].value == 2 &&
        counterList[1].value == 2 &&
        counterList[2].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterList[3].value == 2 &&
        counterList[4].value == 2 &&
        counterList[5].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterList[6].value == 2 &&
        counterList[7].value == 2 &&
        counterList[8].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterList[0].value == 2 &&
        counterList[3].value == 2 &&
        counterList[6].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterList[1].value == 2 &&
        counterList[4].value == 2 &&
        counterList[7].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterList[2].value == 2 &&
        counterList[5].value == 2 &&
        counterList[8].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterList[0].value == 2 &&
        counterList[4].value == 2 &&
        counterList[8].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
    if (counterList[2].value == 2 &&
        counterList[4].value == 2 &&
        counterList[6].value == 2) {
      _counter10.value = 'Player 2 Win';
      _counterP2Win.value++;
      afterWin();
    }
  }

  Future afterWin() async {
    isWin = true;
    audioCache2.play('2.mp3');
    setState(() {
      value = true;
      cannotTouch = true;
      for (int i = 0; i < 9; i++) {
        cellList[i].setValue = true;
      }
    });
    await Future.delayed(Duration(seconds: 2));
    isWin = false;
    setState(() {
      cannotTouch = false;
    });
    for (int i = 0; i < 9; i++) {
      counterList[i].value = 0;
    }
    _counter10.value = value == true ? 'Player 1 Turn' : 'Player 2 turn';
  }

  Future checkDraw() async {
    var count = 0;
    if (isWin == false) {
      for (int i = 0; i < 9; i++) {
        if (counterList[i].value == 1 || counterList[i].value == 2) {
          count++;
        }
        if (count == 9) {
          audioCache2.play('2.mp3');
          _counter10.value = 'Draw';
          await Future.delayed(Duration(seconds: 2));
          for (int i = 0; i < 9; i++) {
            counterList[i].value = 0;
          }
          setState(() {
            value = true;
            for (int i = 0; i < 9; i++) {
              cellList[i].setValue = true;
            }
          });
          _counter10.value = value == true ? 'Player 1 Turn' : 'Player 2 turn';
        }
      }
    }
  }

  void restart() {
    for (int i = 0; i < 9; i++) {
      counterList[i].value = 0;
    }
    _counter10.value = '';
    setState(() {
      value = true;
      for (int i = 0; i < 9; i++) {
        cellList[i].setValue = true;
      }
    });
    _counter10.value = value == true ? 'Player 1 Turn' : 'Player 2 turn';
  }

  @override
  void initState() {
    super.initState();
    isWin = false;
    cannotTouch = false;
    for (int i = 0; i < 9; i++) {
      counterList.add(ValueNotifier<int>(0));
      cellList.add(Cell(
        counter: counterList[i],
        value: value,
        callBack: changeValue,
      ));
    }
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
    counterList.clear();
    cellList.clear();
    audioCache2.clear('2.mp3');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: AbsorbPointer(
            absorbing: cannotTouch,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [cellList[0], cellList[1], cellList[2]],
                ),
                Row(
                  children: [cellList[3], cellList[4], cellList[5]],
                ),
                Row(
                  children: [cellList[6], cellList[7], cellList[8]],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        child: ValueListenableBuilder(
                          valueListenable: _counterP1Win,
                          builder: (BuildContext context, dynamic value,
                              Widget child) {
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
                          builder: (BuildContext context, dynamic value,
                              Widget child) {
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
                          builder: (BuildContext context, dynamic value,
                              Widget child) {
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
        ),
      ),
    );
  }
}
