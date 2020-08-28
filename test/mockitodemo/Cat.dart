

import 'package:mockito/mockito.dart';

class Cat{
  int lives=9;
  bool smile; 
  String sound()=>"miao";
  bool eatFood(String food, {bool hungry}) => true;
  Future<void> chew() async => print("Chewing...");
  int walk(List<String> places) => 7;
  void sleep() {}
  void hunt(String place, String prey) {}
}

class MockCat extends Mock implements Cat{

}