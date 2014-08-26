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
  
  int cellNumber;
  
  List<Cell> cells;
  
  Model(this.width, this.height) {
    this.cells = new List();
    this.cellNumber = 0;
  }
  
  bool isReady() => this.cellNumber == this.width * this.height;
  
  void addCell(Cell cell) {
    cell.init(this.cellNumber ~/ this.height, this.cellNumber % this.height, this);
    this.cells.add(cell);
    this.cellNumber++;
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
  
  Cell getCellAt(int x, int y) {
    this.checkRange(x, y);
    return cells[x * this.height + y];
  }

  void addListeners(Element element) {
    element.addEventListener("click", (MouseEvent mouseEvent){
      Point point = mouseEvent.offset;
      int cellX = point.x ~/ this._unitWidth;
      int cellY = point.y ~/ this._unitHeight;
      this.checkRange(cellX, cellY);
      this.getCellAt(cellX, cellY).onClick();
    });
  }
  
  void checkRange(int x, int y) {
    if (x< 0 || x > (this.width - 1) || y < 0 || y > (this.height - 1)) {
      throw new ArgumentError("Incorrect indexes x=$x y=$y, width=${this.width} height=${this.height}");
    }
  }
}