import 'package:unittest/unittest.dart';
import '../../web/model/model.dart';

  
class ModelImpl extends Model {
  ModelImpl(int width, int height) : super(width, height);
}
  
main() {
  
  group('Initialization', () {

    int width = 3;
    int height = 4;
    Model model;
    
    setUp(() {
      model = new ModelImpl(width, height);
    });
    
    test("Width", () {
      expect(model.width, width);
    });
    
    test("Height", () {
      expect(model.height, height);
    });
    
    test("Cells", () {
      expect(model.cells, new List());
    });

  });
  
  group('Get cell at', () {

    int width = 3;
    int height = 4;
    Model model;
    
    setUp(() {
      model = new ModelImpl(width, height);
    });
    
    test("Width", () {
      expect(model.width, width);
    });
    
    test("Height", () {
      expect(model.height, height);
    });
    
    test("Cells", () {
      expect(model.cells, new List());
    });

  });
  
}