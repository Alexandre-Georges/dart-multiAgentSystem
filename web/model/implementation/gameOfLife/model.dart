library model;

import 'dart:math';
import '../../model.dart';
import 'cell.dart';

class GameOfLifeModel extends Model {
  GameOfLifeModel(int width, int height) : super(width, height) {
    int aliveNumber = 20;
    
    int cellNumber = 0;
    int totalCells = width * height;
    while (cellNumber < totalCells) {
      bool isAlive = isAliveRandomInitialization(aliveNumber, totalCells - cellNumber);
      if (isAlive) {
        aliveNumber--;
      }
      this.addCell(new GameOfLifeCell(isAlive), cellNumber);
      cellNumber++;
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