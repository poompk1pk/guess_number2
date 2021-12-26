
import 'dart:math';
import 'dart:io';

class Game {

  static const maxRandom = 100;
  int? _answer;
  int _counter = 0;
  bool _playAgainMode = false;
  var _random;
  Game(){
    _random = Random();
  }
  void prepareGame() {
    _answer = _random.nextInt(maxRandom) + 1;
    _counter = 0;

    print('╔════════════════════════════════════════');
    print('║            GUESS THE NUMBER            ');
    print('╟────────────────────────────────────────');
  }

  void startGame() {
    prepareGame();

 // print(_answer);
    while(_counter < maxRandom) {
      bool isCorrectInput = _inputNumber();
      if(isCorrectInput) {
        wonGame();
        break;
      }
    }
    if(_playAgainMode && playAgain()){
      startGame();
    }
  }
  bool playAgain() {
    stdout.write('Play again? (Y/N): ');
    var isY = stdin.readLineSync()! ;


    if(isY.toUpperCase() == 'Y') {
      return true;
    } else if(isY.toUpperCase() == 'N') {
      return false;
    }

    return playAgain();


  }
  void wonGame() {
    print('║                 THE END                ');
    print('╚════════════════════════════════════════');

  }
  bool _inputNumber() {
    stdout.write('║ Guess the number between 1 and $maxRandom: ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      return _inputNumber();
    }
    _counter++;

    if (guess > _answer!) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (guess < _answer!) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else {
      print('║ ➜ The number was $_answer');
      print('║ ➜ $guess is CORRECT ❤, total guesses: $_counter');
      print('╟────────────────────────────────────────');
      return true;
    }
    return false;
  }

  set playAgainMode(bool value) {
    _playAgainMode = value;
  }

  bool get playAgainMode => _playAgainMode;
}