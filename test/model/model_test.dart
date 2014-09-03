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
  
  group('Add cell', () {

    int width = 2;
    int height = 3;
    Model model;
    
    setUp(() {
      model = new ModelImpl(width, height);
    });
    
    test("Cell 1", () {
      CellImpl cell = new CellImpl();
      model.addCell(cell);
      expect(cell.x, 0);
      expect(cell.y, 0);
      expect(cell.model, model);
    });
    
    test("Cell 2", () {
      model.addCell(new CellImpl());
      CellImpl cell = new CellImpl();
      model.addCell(cell);
      expect(cell.x, 1);
      expect(cell.y, 0);
      expect(cell.model, model);
    });
    
    test("Cell 3", () {
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      CellImpl cell = new CellImpl();
      model.addCell(cell);
      expect(cell.x, 0);
      expect(cell.y, 1);
      expect(cell.model, model);
    });
    
    test("Cell 4", () {
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      CellImpl cell = new CellImpl();
      model.addCell(cell);
      expect(cell.x, 1);
      expect(cell.y, 1);
      expect(cell.model, model);
    });
    
    test("Cell 5", () {
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      CellImpl cell = new CellImpl();
      model.addCell(cell);
      expect(cell.x, 0);
      expect(cell.y, 2);
      expect(cell.model, model);
    });
    
    test("Cell 6", () {
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      model.addCell(new CellImpl());
      CellImpl cell = new CellImpl();
      model.addCell(cell);
      expect(cell.x, 1);
      expect(cell.y, 2);
      expect(cell.model, model);
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

    int width = 2;
    int height = 3;
    Model model;
    CellImpl cell1;
    CellImpl cell2;
    CellImpl cell3;
    CellImpl cell4;
    CellImpl cell5;
    CellImpl cell6;
    
    setUp(() {
      model = new ModelImpl(width, height);
      cell1 = new CellImpl();
      model.addCell(cell1);
      cell2 = new CellImpl();
      model.addCell(cell2);
      cell3 = new CellImpl();
      model.addCell(cell3);
      cell4 = new CellImpl();
      model.addCell(cell4);
      cell5 = new CellImpl();
      model.addCell(cell5);
      cell6 = new CellImpl();
      model.addCell(cell6);
    });
    
    test("Cell 1", () {
      expect(model.getCellAt(0, 0), cell1);
    });
    
    test("Cell 2", () {
      expect(model.getCellAt(1, 0), cell2);
    });
    
    test("Cell 3", () {
      expect(model.getCellAt(0, 1), cell3);
    });
    
    test("Cell 4", () {
      expect(model.getCellAt(1, 1), cell4);
    });
    
    test("Cell 5", () {
      expect(model.getCellAt(0, 2), cell5);
    });
    
    test("Cell 6", () {
      expect(model.getCellAt(1, 2), cell6);
    });

  });
  
}