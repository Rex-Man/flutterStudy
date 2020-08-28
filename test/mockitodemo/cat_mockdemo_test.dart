import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'Cat.dart';

main(){
  test('first mock test', () {
    print("test1");
    var cat=MockCat();
    expect(cat.sound(), null);
   
    verify(cat.sound());
    //expect(() => cat.sound, "miao");
  
  });
  

}