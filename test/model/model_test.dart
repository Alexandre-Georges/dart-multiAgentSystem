import 'package:unittest/unittest.dart';
import '../../web/model/cell.dart';
import '../../web/model/model.dart';
import '../../web/utils/color.dart';

  
class ModelImpl extends Model {
  ModelImpl(int width, int height) : super(width, height);
}

class CellImpl extends Cell {
  void computeNextStep() {}
  void evolve() {}
  Color getColor() { return null; }
  void onClick() {}
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
  
  group('Check range', () {

    int width = 2;
    int height = 3;
    Model model;
    
    setUp(() {
      model = new ModelImpl(width, height);
    });
    
    test("Does not throw an error", () {
      expect(() {
        model.checkRange(0, 0);
        model.checkRange(0, 1);
        model.checkRange(0, 2);
        model.checkRange(1, 0);
        model.checkRange(1, 1);
        model.checkRange(1, 2);
      }, returnsNormally);
    });
    
    test("Throws an error", () {
      expect(() {
        model.checkRange(-1, 0);
      }, throwsArgumentError);
      expect(() {
        model.checkRange(0, -1);
      }, throwsArgumentError);
      expect(() {
        model.checkRange(0, 3);
      }, throwsArgumentError);
      expect(() {
        model.checkRange(2, 0);
      }, throwsArgumentError);
    });

  });
  
  group('Is ready', () {

    int width = 2;
    int height = 3;
    Model model;
    
    setUp(() {
      model = new ModelImpl(width, height);
    });
    
    test("Not ready", () {
      expect(model.isReady(), false);
      
      model.addCell(new CellImpl());
      expect(model.isReady(), false);
      
      model.addCell(new CellImpl());
      expect(model.isReady(), false);
      
      model.addCell(new CellImpl());
      expect(model.isReady(), false);
      
      model.addCell(new CellImpl());
      expect(model.isReady(), false);
      
      model.addCell(new CellImpl());
      expect(model.isReady(), false);
    });
    
    test("Ready", () {
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      expect(model.isReady(), true);
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