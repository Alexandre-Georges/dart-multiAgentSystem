library cell;

import '../../../utils/color.dart';
import '../../cell.dart';

class GameOfLifeCell extends Cell {
  
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
    this.model.cells.forEach((GameOfLifeCell cell) {
      if (this.isNeighbour(cell)) {
        if (cell.isAlive) {
          aliveNumber++;
        } else {
          deadNumber++;
        }
      }
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
  
  bool isNeighbour(Cell cell) {
    if (this == cell) {
      return false;
    }
    
    int diffNegX = (this.x - cell.x + this.model.width) % this.model.width;
    int diffPosX = (cell.x - this.x + this.model.width) % this.model.width;
    int diffX = diffNegX < diffPosX ? -diffNegX : diffPosX;

    int diffNegY = (this.y - cell.y + this.model.height) % this.model.height;
    int diffPosY = (cell.y - this.y + this.model.height) % this.model.height;
    int diffY = diffNegY < diffPosY ? -diffNegY : diffPosY;
    
    if (diffX <= 1 && diffX >= -1 && diffY <= 1 && diffY >= -1) {
      return true;
    }
    return false;
  }
  
  void onClick() {
    this.isAlive = !this.isAlive;
  }
}