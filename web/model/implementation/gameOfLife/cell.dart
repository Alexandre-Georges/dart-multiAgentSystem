library gameOfLifeCell;

import '../../../utils/color.dart';
import '../../cell.dart';

class GameOfLifeCell extends Cell {

  static List<int> NEIGHBOUR_INDEXES = [-1, 0, 1];
  
  bool isAlive;
  bool _nextIsAlive;
  
  GameOfLifeCell(this.isAlive) : super();
  
  Color getColor() {
    if (this.isAlive) {
      return new Color(155, 80, 80);
    }
    return new Color(0, 0, 0);
  }
  
  void computeNextStep() {
    int aliveNumber = 0;
    int deadNumber = 0;
    
    NEIGHBOUR_INDEXES.forEach((xIndex) {
      NEIGHBOUR_INDEXES.forEach((yIndex) {
        if (xIndex != 0 || yIndex != 0) {
          GameOfLifeCell neighbour = this.getCellAt(xIndex, yIndex);
          if (neighbour.isAlive) {
            aliveNumber++;
          } else {
            deadNumber++;
          }
        }
      });
    });
    
    if (this.isAlive && (aliveNumber < 2 || aliveNumber > 3)) {
      this._nextIsAlive = false;
    } else if (!this.isAlive && aliveNumber == 3) {
      this._nextIsAlive = true;
    } else {
      this._nextIsAlive = this.isAlive;
    }
  }
  
  void evolve() {
    this.isAlive = this._nextIsAlive;
  }
  
  void onClick() {
    this.isAlive = !this.isAlive;
  }
}