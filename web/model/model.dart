library model;

import 'dart:html';
import '../rendering/renderable.dart';
import 'evolvable.dart';
import 'cell.dart';

abstract class Model implements Renderable, Evolvable {
  
  int width;
  int height;

  int _unitWidth;
  int _unitHeight;
  
  List<Cell> cells;
  
  Model(this.width, this.height) {
    cells = new List();
  }
  
  void render(CanvasElement canvas, CanvasRenderingContext2D context) {
    context.setFillColorRgb(0, 0, 0);
    this._unitWidth = canvas.width ~/ this.width;
    this._unitHeight = canvas.height ~/ this.height;
    context.fillRect(0, 0, this._unitWidth * this.width, this._unitHeight * this.height);
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
  
  void evolve() {
    cells.toList().forEach((Cell cell) {
      cell.evolve();
    });
  }

  void addListeners(Element element) {
    element.addEventListener("click", (MouseEvent mouseEvent){
      Point point = mouseEvent.offset;
      int cellX = point.x ~/ this._unitWidth;
      int cellY = point.y ~/ this._unitHeight;
      print(cellX.toString() + " " + cellY.toString());
    });
  }
  
}