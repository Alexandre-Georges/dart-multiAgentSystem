import 'package:unittest/unittest.dart';
import '../../web/model/model.dart';
import '../../web/model/cell.dart';
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
  
  group('Constructor', () {
    
    CellImpl cell;
    
    setUp(() {
      cell = new CellImpl();
    });
    
    test("Attributes", () {
      expect(cell.x, null);
      expect(cell.y, null);
      expect(cell.model, null);
    });

  });
  
  group('Init', () {
    
    ModelImpl model;
    CellImpl cell;
    int x = 1;
    int y = 2;
    
    setUp(() {
      model = new ModelImpl(0, 0);
      cell = new CellImpl();
      cell.init(x, y, model);
    });
    
    test("Attributes", () {
      expect(cell.x, x);
      expect(cell.y, y);
      expect(cell.model, model);
    });

  });
  
  group('Get cell at', () {
    
    ModelImpl model;
    CellImpl cell1;
    CellImpl cell2;
    CellImpl cell3;
    CellImpl cell4;
    
    setUp(() {
      model = new ModelImpl(2, 2);
      cell1 = new CellImpl();
      cell1.init(0, 0, model);
      model.addCell(cell1);
      cell2 = new CellImpl();
      cell2.init(1, 0, model);
      model.addCell(cell2);
      cell3 = new CellImpl();
      cell3.init(0, 1, model);
      model.addCell(cell3);
      cell4 = new CellImpl();
      cell4.init(1, 1, model);
      model.addCell(cell4);
    });
    
    test("Cell 1", () {
      expect(cell1.getCellAt(-1, 0), cell2);
      expect(cell1.getCellAt(1, 0), cell2);
      expect(cell1.getCellAt(0, -1), cell3);
      expect(cell1.getCellAt(0, 1), cell3);
      expect(cell1.getCellAt(-1, -1), cell4);
      expect(cell1.getCellAt(-1, 1), cell4);
      expect(cell1.getCellAt(1, -1), cell4);
      expect(cell1.getCellAt(1, 1), cell4);
    });
    
    test("Cell 2", () {
      expect(cell2.getCellAt(-1, 0), cell1);
      expect(cell2.getCellAt(1, 0), cell1);
      expect(cell2.getCellAt(0, -1), cell4);
      expect(cell2.getCellAt(0, 1), cell4);
      expect(cell2.getCellAt(-1, -1), cell3);
      expect(cell2.getCellAt(-1, 1), cell3);
      expect(cell2.getCellAt(1, -1), cell3);
      expect(cell2.getCellAt(1, 1), cell3);
    });
    
    test("Cell 3", () {
      expect(cell3.getCellAt(-1, 0), cell4);
      expect(cell3.getCellAt(1, 0), cell4);
      expect(cell3.getCellAt(0, -1), cell1);
      expect(cell3.getCellAt(0, 1), cell1);
      expect(cell3.getCellAt(-1, -1), cell2);
      expect(cell3.getCellAt(-1, 1), cell2);
      expect(cell3.getCellAt(1, -1), cell2);
      expect(cell3.getCellAt(1, 1), cell2);
    });
    
    test("Cell 4", () {
      expect(cell4.getCellAt(-1, 0), cell3);
      expect(cell4.getCellAt(1, 0), cell3);
      expect(cell4.getCellAt(0, -1), cell2);
      expect(cell4.getCellAt(0, 1), cell2);
      expect(cell4.getCellAt(-1, -1), cell1);
      expect(cell4.getCellAt(-1, 1), cell1);
      expect(cell4.getCellAt(1, -1), cell1);
      expect(cell4.getCellAt(1, 1), cell1);
    });

  });
  
  
}