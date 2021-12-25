
import 'dart:io';
import 'dart:math';

/**
 * Created by PoomPK
 */
void main() {


  print('Guess the Number! just type the number in range 0-100.');

  // seed for random
  var seed = 'a#d@i~F_!'.hashCode;
  var r = new Random(seed);

  // bypass answer is 34
  var answer = r.nextInt(100)+1;
  var count = 0;

  for(;;) {

    print("╔══════════════════════════════════════════════");
    stdout.write("║ Input the number to guess: ");

    try {
      var iGuess = stdin.readLineSync();
      print("╚══════════════════════════════════════════════");
      var guessNum = int.parse(iGuess!);
      count++;
      if (guessNum == answer) {
        print('╔══════════════════════════════════════════════\n║ You won!!!\n║ The number was $answer\n║ Your amount of guesses is $count'+ " times.\n║ Thanks for playing!\n╚══════════════════════════════════════════════");
        break;
      } else {

        // the distance between the input number and the answer
        num range = sqrt((pow(guessNum-answer, 2)).abs());
        var msg = "║ ➜ "+iGuess+" is too "+(guessNum>answer?"HIGH ▲":"LOW ▼");
        /**
         * hint message
         */
        msg += "\n║ ➜ ";
        if(range < 10) {
          msg += "Nice try! very too close.";
        } else if(range < 15) {
          msg += "almost! tik tok tiktok...";
        } else if(range < 20) {
        msg += "Excited! It's close.";
        } else if(range < 50) {
          msg += "Not bad!\n║ [hint] It's in range 50 of your input number";
        } else if(range < 80 && range <= 100) {
          msg += "Very far! :)";
        } else {
          msg += "hahaha It's not too close.";
        }
        msg += "";
        print(msg+"\n╚══════════════════════════════════════════════");
      }
    } on FormatException {
      print('║ ➜ Invalid format! please try again.\n╚══════════════════════════════════════════════');
    }

  }


}