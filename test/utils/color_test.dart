import 'package:unittest/unittest.dart';
import '../../web/utils/color.dart';

main() {
  
  group('Initialization', () {

    int r = 1;
    int g = 2;
    int b = 3;
    Color color;
    
    setUp(() {
      color = new Color(r, g, b);
    });
    
    test("R", () {
      expect(color.r, r);
    });
      
    test("G", () {
      expect(color.g, g);
    });
    
    test("B", () {
      expect(color.b, b);
    });

  });
  
}