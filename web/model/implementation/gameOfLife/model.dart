library model;

import 'dart:math';
import '../../model.dart';
import 'cell.dart';

class GameOfLifeModel extends Model {
  GameOfLifeModel(int width, int height) : super(width, height) {
    int aliveNumber = 20;
    int remainingCells = width * height;
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        bool isAlive = isAliveRandomInitialization(aliveNumber, remainingCells);
        if (isAlive) {
          aliveNumber--;
        }
        remainingCells--;
        this.cells.add(new GameOfLifeCell(isAlive, x, y, this));
      }
    }
  }
  
  bool isAliveRandomInitialization(int aliveNumber, int remainingCells) {
    Random random = new Random();
    double probability = random.nextDouble();
    
    if (probability > aliveNumber / remainingCells) {
      return false;
    }
    return true;
  }
}