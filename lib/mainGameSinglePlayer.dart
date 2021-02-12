import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tictactoe/cell.dart';
import 'package:project_tictactoe/mainMenu.dart';

class MainGameSinglePlayer extends StatefulWidget {
  @override
  _MainGameSinglePlayerState createState() => _MainGameSinglePlayerState();
}

class _MainGameSinglePlayerState extends State<MainGameSinglePlayer> {
  AudioCache audioCache;
  AudioCache audioCache2;
  var cannotTouch;
  final ValueNotifier<String> _counter10 = ValueNotifier<String>('');
  final ValueNotifier<int> _counterP1Win = ValueNotifier<int>(0);
  final ValueNotifier<int> _counterP2Win = ValueNotifier<int>(0);

  List<ValueNotifier<int>> counterList = [];
  List<Cell> cellList = [];
  var value;
  var isWin;
  int aiNextTurn;

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
    if (isWin == false) {
      aiTurn();
      checkWin();
    }
    checkDraw();
  }

  void aiTurn() {
    checkUserConditionOneCell();
    checkAiConditionOneCell();
    checkUserConditionTwoCell();
    checkAiConditionTwoCell();
    counterList[aiNextTurn].value = 2;
    setState(() {
      value = value == true ? false : true;
      for (int i = 0; i < 9; i++) {
        cellList[i].setValue = value;
      }
    });
  }

  void checkUserConditionTwoCell() {
    for (int i = 0; i < 7; i += 3) {
      for (int j = 0; j < 3; j++) {
        var a, b, c;
        if (j == 0) {
          a = 0;
          b = 1;
          c = 1;
        } else if (j == 1) {
          a = 1;
          b = 0;
          c = 1;
        } else {
          a = 1;
          b = 1;
          c = 0;
        }
        if (counterList[i].value == a &&
            counterList[i + 1].value == b &&
            counterList[i + 2].value == c) {
          aiNextTurn = i + j;
        }
      }
    }

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 7; j += 3) {
        var a, b, c;
        if (j == 0) {
          a = 0;
          b = 1;
          c = 1;
        } else if (j == 1) {
          a = 1;
          b = 0;
          c = 1;
        } else {
          a = 1;
          b = 1;
          c = 0;
        }
        if (counterList[i].value == a &&
            counterList[i + 3].value == b &&
            counterList[i + 6].value == c) {
          aiNextTurn = i + j;
        }
      }
    }

    for (int i = 0; i < 1; i++) {
      for (int j = 0; j < 9; j += 4) {
        var a, b, c;
        if (j == 0) {
          a = 0;
          b = 1;
          c = 1;
        } else if (j == 4) {
          a = 1;
          b = 0;
          c = 1;
        } else {
          a = 1;
          b = 1;
          c = 0;
        }
        if (counterList[i].value == a &&
            counterList[i + 4].value == b &&
            counterList[i + 8].value == c) {
          aiNextTurn = i + j;
        }
      }
    }

    for (int i = 0; i < 1; i++) {
      for (int j = 2; j < 7; j += 2) {
        var a, b, c;
        if (j == 2) {
          a = 0;
          b = 1;
          c = 1;
        } else if (j == 4) {
          a = 1;
          b = 0;
          c = 1;
        } else {
          a = 1;
          b = 1;
          c = 0;
        }
        if (counterList[2].value == a &&
            counterList[2 + 2].value == b &&
            counterList[2 + 4].value == c) {
          aiNextTurn = i + j;
        }
      }
    }
  }

  void checkAiConditionTwoCell() {
    for (int i = 0; i < 7; i += 3) {
      for (int j = 0; j < 3; j++) {
        var a, b, c;
        if (j == 0) {
          a = 0;
          b = 2;
          c = 2;
        } else if (j == 1) {
          a = 2;
          b = 0;
          c = 2;
        } else {
          a = 2;
          b = 2;
          c = 0;
        }
        if (counterList[i].value == a &&
            counterList[i + 1].value == b &&
            counterList[i + 2].value == c) {
          aiNextTurn = i + j;
        }
      }
    }

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 7; j += 3) {
        var a, b, c;
        if (j == 0) {
          a = 0;
          b = 2;
          c = 2;
        } else if (j == 1) {
          a = 2;
          b = 0;
          c = 2;
        } else {
          a = 2;
          b = 2;
          c = 0;
        }
        if (counterList[i].value == a &&
            counterList[i + 3].value == b &&
            counterList[i + 6].value == c) {
          aiNextTurn = i + j;
        }
      }
    }

    for (int i = 0; i < 1; i++) {
      for (int j = 0; j < 9; j += 4) {
        var a, b, c;
        if (j == 0) {
          a = 0;
          b = 2;
          c = 2;
        } else if (j == 1) {
          a = 2;
          b = 0;
          c = 2;
        } else {
          a = 2;
          b = 2;
          c = 0;
        }
        if (counterList[i].value == a &&
            counterList[i + 4].value == b &&
            counterList[i + 8].value == c) {
          aiNextTurn = i + j;
        }
      }
    }

    for (int i = 0; i < 1; i++) {
      for (int j = 2; j < 7; j += 2) {
        var a, b, c;
        if (j == 0) {
          a = 0;
          b = 2;
          c = 2;
        } else if (j == 1) {
          a = 2;
          b = 0;
          c = 2;
        } else {
          a = 2;
          b = 2;
          c = 0;
        }
        if (counterList[i].value == a &&
            counterList[i + 2].value == b &&
            counterList[i + 4].value == c) {
          aiNextTurn = i + j;
        }
      }
    }
  }

  void checkAiConditionOneCell() {
    var h = [];
    var h2 = [];
    if (counterList[0].value == 2 &&
        (counterList[1].value == 0 ||
            counterList[3].value == 0 ||
            counterList[4].value == 0)) {
      h.addAll({1, 3, 4});
      for (int i = 0; i < h.length; i++) {
        if (counterList[h[i]].value != 1 && counterList[h[i]].value != 2) {
          h2.add(h[i]);
        }
      }
      aiNextTurn = h2[Random().nextInt(h2.length)];
    } else if (counterList[1].value == 2 &&
        (counterList[0].value == 0 ||
            counterList[2].value == 0 ||
            counterList[4].value == 0)) {
      h.addAll({0, 2, 4});
      for (int i = 0; i < h.length; i++) {
        if (counterList[h[i]].value != 1 && counterList[h[i]].value != 2) {
          h2.add(h[i]);
        }
      }
      aiNextTurn = h2[Random().nextInt(h2.length)];
    } else if (counterList[2].value == 2 &&
        (counterList[1].value == 0 ||
            counterList[4].value == 0 ||
            counterList[5].value == 0)) {
      h.addAll({1, 4, 5});
      for (int i = 0; i < h.length; i++) {
        if (counterList[h[i]].value != 1 && counterList[h[i]].value != 2) {
          h2.add(h[i]);
        }
      }
      aiNextTurn = h2[Random().nextInt(h2.length)];
    } else if (counterList[3].value == 2 &&
        (counterList[0].value == 0 ||
            counterList[4].value == 0 ||
            counterList[6].value == 0)) {
      h.addAll({0, 4, 6});
      for (int i = 0; i < h.length; i++) {
        if (counterList[h[i]].value != 1 && counterList[h[i]].value != 2) {
          h2.add(h[i]);
        }
      }
      aiNextTurn = h2[Random().nextInt(h2.length)];
    } else if (counterList[4].value == 2 &&
        (counterList[0].value == 0 ||
            counterList[1].value == 0 ||
            counterList[2].value == 0 ||
            counterList[3].value == 0 ||
            counterList[5].value == 0 ||
            counterList[6].value == 0 ||
            counterList[7].value == 0 ||
            counterList[8].value == 0)) {
      h.addAll({0, 1, 2, 3, 5, 6, 7, 8});
      for (int i = 0; i < h.length; i++) {
        if (counterList[h[i]].value != 1 && counterList[h[i]].value != 2) {
          h2.add(h[i]);
        }
      }
      aiNextTurn = h2[Random().nextInt(h2.length)];
    } else if (counterList[5].value == 2 &&
        (counterList[2].value == 0 ||
            counterList[4].value == 0 ||
            counterList[8].value == 0)) {
      h.addAll({2, 4, 8});
      for (int i = 0; i < h.length; i++) {
        if (counterList[h[i]].value != 1 && counterList[h[i]].value != 2) {
          h2.add(h[i]);
        }
      }
      aiNextTurn = h2[Random().nextInt(h2.length)];
    } else if (counterList[6].value == 2 &&
        (counterList[3].value == 0 ||
            counterList[4].value == 0 ||
            counterList[7].value == 0)) {
      h.addAll({3, 4, 7});
      for (int i = 0; i < h.length; i++) {
        if (counterList[h[i]].value != 1 && counterList[h[i]].value != 2) {
          h2.add(h[i]);
        }
      }
      aiNextTurn = h2[Random().nextInt(h2.length)];
    } else if (counterList[7].value == 2 &&
        (counterList[4].value == 0 ||
            counterList[6].value == 0 ||
            counterList[8].value == 0)) {
      h.addAll({4, 6, 8});
      for (int i = 0; i < h.length; i++) {
        if (counterList[h[i]].value != 1 && counterList[h[i]].value != 2) {
          h2.add(h[i]);
        }
      }
      aiNextTurn = h2[Random().nextInt(h2.length)];
    } else if (counterList[8].value == 2 &&
        (counterList[4].value == 0 ||
            counterList[5].value == 0 ||
            counterList[7].value == 0)) {
      h.addAll({4, 5, 7});
      for (int i = 0; i < h.length; i++) {
        if (counterList[h[i]].value != 1 && counterList[h[i]].value != 2) {
          h2.add(h[i]);
        }
      }
      aiNextTurn = h2[Random().nextInt(h2.length)];
    }
  }

  void checkUserConditionOneCell() {
    for (int i = 0; i < 9; i++) {
      if (counterList[i].value == 1) {
        var tmp = Random().nextInt(8);
        if (counterList[tmp].value == 0) {
          aiNextTurn = tmp;
        } else {
          for (int j = 0; j < 9; j++) {
            if (counterList[j].value == 0) {
              aiNextTurn = j;
            }
          }
        }
      }
    }
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
    aiNextTurn = 0;
    isWin = false;
    value = true;
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
