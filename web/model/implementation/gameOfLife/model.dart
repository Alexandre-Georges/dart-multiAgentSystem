library model;

import '../../model.dart';
import 'cell.dart';

class GameOfLifeModel extends Model {
  GameOfLifeModel(int width, int height) : super(width, height) {
    this.cells.add(new GameOfLifeCell(false, 0, 0, this));
    this.cells.add(new GameOfLifeCell(false, 0, 1, this));
    this.cells.add(new GameOfLifeCell(false, 0, 2, this));
    this.cells.add(new GameOfLifeCell(true, 1, 0, this));
    this.cells.add(new GameOfLifeCell(false, 1, 1, this));
    this.cells.add(new GameOfLifeCell(true, 1, 2, this));
    this.cells.add(new GameOfLifeCell(false, 2, 0, this));
    this.cells.add(new GameOfLifeCell(true, 2, 1, this));
    this.cells.add(new GameOfLifeCell(false, 2, 2, this));
    this.cells.add(new GameOfLifeCell(false, 3, 0, this));
    this.cells.add(new GameOfLifeCell(true, 3, 1, this));
    this.cells.add(new GameOfLifeCell(false, 3, 2, this));
  }
}