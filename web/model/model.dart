library model;

import 'dart:html';
import '../rendering/renderable.dart';
import 'evolvable.dart';
import 'cell.dart';
import 'agent.dart';
import 'emptyCell.dart';

class Model implements Renderable, Evolvable {
  
  int _width = 3;
  int _height = 3;

  int _unitWidth;
  int _unitHeight;
  
  List<Cell> cells;
  
  Model() {
    cells = new List();
    cells.add(new Agent(0, 0, this));
    cells.add(new EmptyCell(0, 1, this));
    cells.add(new EmptyCell(0, 2, this));
    
    cells.add(new EmptyCell(1, 0, this));
    cells.add(new EmptyCell(1, 1, this));
    cells.add(new EmptyCell(1, 2, this));
    
    cells.add(new EmptyCell(2, 0, this));
    cells.add(new Agent(2, 1, this));
    cells.add(new EmptyCell(2, 2, this));
  }
  
  void render(CanvasElement canvas, CanvasRenderingContext2D context) {
    context.setFillColorRgb(0, 0, 0);
    this._unitWidth = canvas.width ~/ _width;
    this._unitHeight = canvas.height ~/ _height;
    context.fillRect(0, 0, this._unitWidth * _width, this._unitHeight * _height);
    cells.toList().forEach((Cell cell) {
      cell.render(canvas, context);
    });
  }

  int get unitWidth => this._unitWidth;
  int get unitHeight => this._unitHeight;
  
  void computeNextStep() {
    cells.toList().forEach((Cell cell) {
      cell.computeNextStep();
    });
  }
  
  Evolvable evolve() {
    cells.toList().forEach((Cell cell) {
      cell.evolve();
    });
    return this;
  }
  
}