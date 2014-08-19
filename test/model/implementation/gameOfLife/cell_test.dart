import 'package:unittest/unittest.dart';
import '../../../../web/model/implementation/gameOfLife/model.dart';
import '../../../../web/model/implementation/gameOfLife/cell.dart';

main() {
  
  group('isNeighbour', () {
    
    GameOfLifeModel model;
    GameOfLifeCell cell1;
    GameOfLifeCell cell2;
    GameOfLifeCell cell3;
    GameOfLifeCell cell4;
    GameOfLifeCell cell5;
    GameOfLifeCell cell6;
    GameOfLifeCell cell7;
    GameOfLifeCell cell8;
    GameOfLifeCell cell9;
    GameOfLifeCell cell10;
    GameOfLifeCell cell11;
    GameOfLifeCell cell12;
    
    setUp(() {
      model = new GameOfLifeModel(3, 4);
      cell1 = new GameOfLifeCell(true, 0, 0, model);
      cell2 = new GameOfLifeCell(true, 0, 1, model);
      cell3 = new GameOfLifeCell(true, 0, 2, model);
      cell4 = new GameOfLifeCell(true, 0, 3, model);
      cell5 = new GameOfLifeCell(true, 1, 0, model);
      cell6 = new GameOfLifeCell(true, 1, 1, model);
      cell7 = new GameOfLifeCell(true, 1, 2, model);
      cell8 = new GameOfLifeCell(true, 1, 3, model);
      cell9 = new GameOfLifeCell(true, 2, 0, model);
      cell10 = new GameOfLifeCell(true, 2, 1, model);
      cell11 = new GameOfLifeCell(true, 2, 2, model);
      cell12 = new GameOfLifeCell(true, 2, 3, model);
    });
  
    test("same cell", () {
      expect(cell1.isNeighbour(cell1), false);
      expect(cell2.isNeighbour(cell2), false);
      expect(cell3.isNeighbour(cell3), false);
      expect(cell4.isNeighbour(cell4), false);
      expect(cell5.isNeighbour(cell5), false);
      expect(cell6.isNeighbour(cell6), false);
      expect(cell7.isNeighbour(cell7), false);
      expect(cell8.isNeighbour(cell8), false);
      expect(cell9.isNeighbour(cell9), false);
      expect(cell10.isNeighbour(cell10), false);
      expect(cell11.isNeighbour(cell11), false);
      expect(cell12.isNeighbour(cell12), false);
    });
    
    test("not neighbours", () {
      expect(cell1.isNeighbour(cell3), false);
      expect(cell1.isNeighbour(cell7), false);
      expect(cell1.isNeighbour(cell11), false);

      expect(cell2.isNeighbour(cell4), false);
      expect(cell2.isNeighbour(cell8), false);
      expect(cell2.isNeighbour(cell12), false);

      expect(cell3.isNeighbour(cell1), false);
      expect(cell3.isNeighbour(cell5), false);
      expect(cell3.isNeighbour(cell9), false);

      expect(cell4.isNeighbour(cell2), false);
      expect(cell4.isNeighbour(cell6), false);
      expect(cell4.isNeighbour(cell10), false);

      expect(cell5.isNeighbour(cell3), false);
      expect(cell5.isNeighbour(cell7), false);
      expect(cell5.isNeighbour(cell11), false);

      expect(cell6.isNeighbour(cell4), false);
      expect(cell6.isNeighbour(cell8), false);
      expect(cell6.isNeighbour(cell12), false);

      expect(cell7.isNeighbour(cell1), false);
      expect(cell7.isNeighbour(cell5), false);
      expect(cell7.isNeighbour(cell9), false);
      
      expect(cell8.isNeighbour(cell2), false);
      expect(cell8.isNeighbour(cell6), false);
      expect(cell8.isNeighbour(cell10), false);

      expect(cell9.isNeighbour(cell3), false);
      expect(cell9.isNeighbour(cell7), false);
      expect(cell9.isNeighbour(cell11), false);

      expect(cell10.isNeighbour(cell4), false);
      expect(cell10.isNeighbour(cell8), false);
      expect(cell10.isNeighbour(cell12), false);

      expect(cell11.isNeighbour(cell1), false);
      expect(cell11.isNeighbour(cell5), false);
      expect(cell11.isNeighbour(cell9), false);

      expect(cell12.isNeighbour(cell2), false);
      expect(cell12.isNeighbour(cell6), false);
      expect(cell12.isNeighbour(cell10), false);
    });
    
    test("neighbours", () {
      expect(cell1.isNeighbour(cell2), true);
      expect(cell1.isNeighbour(cell4), true);
      expect(cell1.isNeighbour(cell5), true);
      expect(cell1.isNeighbour(cell6), true);
      expect(cell1.isNeighbour(cell8), true);
      expect(cell1.isNeighbour(cell9), true);
      expect(cell1.isNeighbour(cell10), true);
      expect(cell1.isNeighbour(cell12), true);

      expect(cell2.isNeighbour(cell1), true);
      expect(cell2.isNeighbour(cell3), true);
      expect(cell2.isNeighbour(cell5), true);
      expect(cell2.isNeighbour(cell6), true);
      expect(cell2.isNeighbour(cell7), true);
      expect(cell2.isNeighbour(cell9), true);
      expect(cell2.isNeighbour(cell10), true);
      expect(cell2.isNeighbour(cell11), true);

      expect(cell3.isNeighbour(cell2), true);
      expect(cell3.isNeighbour(cell4), true);
      expect(cell3.isNeighbour(cell6), true);
      expect(cell3.isNeighbour(cell7), true);
      expect(cell3.isNeighbour(cell8), true);
      expect(cell3.isNeighbour(cell10), true);
      expect(cell3.isNeighbour(cell11), true);
      expect(cell3.isNeighbour(cell12), true);

      expect(cell4.isNeighbour(cell1), true);
      expect(cell4.isNeighbour(cell3), true);
      expect(cell4.isNeighbour(cell5), true);
      expect(cell4.isNeighbour(cell7), true);
      expect(cell4.isNeighbour(cell8), true);
      expect(cell4.isNeighbour(cell9), true);
      expect(cell4.isNeighbour(cell11), true);
      expect(cell4.isNeighbour(cell12), true);

      expect(cell5.isNeighbour(cell1), true);
      expect(cell5.isNeighbour(cell2), true);
      expect(cell5.isNeighbour(cell4), true);
      expect(cell5.isNeighbour(cell6), true);
      expect(cell5.isNeighbour(cell8), true);
      expect(cell5.isNeighbour(cell9), true);
      expect(cell5.isNeighbour(cell10), true);
      expect(cell5.isNeighbour(cell12), true);

      expect(cell6.isNeighbour(cell1), true);
      expect(cell6.isNeighbour(cell2), true);
      expect(cell6.isNeighbour(cell3), true);
      expect(cell6.isNeighbour(cell5), true);
      expect(cell6.isNeighbour(cell7), true);
      expect(cell6.isNeighbour(cell9), true);
      expect(cell6.isNeighbour(cell10), true);
      expect(cell6.isNeighbour(cell11), true);

      expect(cell7.isNeighbour(cell2), true);
      expect(cell7.isNeighbour(cell3), true);
      expect(cell7.isNeighbour(cell4), true);
      expect(cell7.isNeighbour(cell6), true);
      expect(cell7.isNeighbour(cell8), true);
      expect(cell7.isNeighbour(cell10), true);
      expect(cell7.isNeighbour(cell11), true);
      expect(cell7.isNeighbour(cell12), true);

      expect(cell8.isNeighbour(cell1), true);
      expect(cell8.isNeighbour(cell3), true);
      expect(cell8.isNeighbour(cell4), true);
      expect(cell8.isNeighbour(cell5), true);
      expect(cell8.isNeighbour(cell7), true);
      expect(cell8.isNeighbour(cell9), true);
      expect(cell8.isNeighbour(cell11), true);
      expect(cell8.isNeighbour(cell12), true);

      expect(cell9.isNeighbour(cell1), true);
      expect(cell9.isNeighbour(cell2), true);
      expect(cell9.isNeighbour(cell4), true);
      expect(cell9.isNeighbour(cell5), true);
      expect(cell9.isNeighbour(cell6), true);
      expect(cell9.isNeighbour(cell8), true);
      expect(cell9.isNeighbour(cell10), true);
      expect(cell9.isNeighbour(cell12), true);

      expect(cell10.isNeighbour(cell1), true);
      expect(cell10.isNeighbour(cell2), true);
      expect(cell10.isNeighbour(cell3), true);
      expect(cell10.isNeighbour(cell5), true);
      expect(cell10.isNeighbour(cell6), true);
      expect(cell10.isNeighbour(cell7), true);
      expect(cell10.isNeighbour(cell9), true);
      expect(cell10.isNeighbour(cell11), true);

      expect(cell11.isNeighbour(cell2), true);
      expect(cell11.isNeighbour(cell3), true);
      expect(cell11.isNeighbour(cell4), true);
      expect(cell11.isNeighbour(cell6), true);
      expect(cell11.isNeighbour(cell7), true);
      expect(cell11.isNeighbour(cell8), true);
      expect(cell11.isNeighbour(cell10), true);
      expect(cell11.isNeighbour(cell12), true);

      expect(cell12.isNeighbour(cell1), true);
      expect(cell12.isNeighbour(cell3), true);
      expect(cell12.isNeighbour(cell4), true);
      expect(cell12.isNeighbour(cell5), true);
      expect(cell12.isNeighbour(cell7), true);
      expect(cell12.isNeighbour(cell8), true);
      expect(cell12.isNeighbour(cell9), true);
      expect(cell12.isNeighbour(cell11), true);
    });

  });
  
  
}