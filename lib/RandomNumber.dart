import 'dart:math';

class RandomNumber {

  var number = 2;

  void randomizer(){
    print("calisti");
     var randomizer = new Random(); 

     this.number = randomizer.nextInt(100);
  }
}