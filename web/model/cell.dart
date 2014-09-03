library cell;

import 'dart:html';
import '../rendering/renderable.dart';
import '../utils/color.dart';
import 'model.dart';
import 'evolvable.dart';

abstract class Cell implements Renderable, Evolvable {
  
  int x;
  int y;
  Model model;
    
  void init(int x, int y, Model model) {
    this.x = x;
    this.y = y;
    this.model = model;
  }

  void render(CanvasElement canvas, CanvasRenderingContext2D context) {
    Color color = this.getColor();
    context.setFillColorRgb(color.r, color.g, color.b);
    context.fillRect(this.x * this.model.unitWidth, this.y * this.model.unitHeight, this.model.unitWidth, this.model.unitHeight);
  }
  
  Cell getCellAt(int deltaX, deltaY) {
    
    int cellX = (this.x + deltaX + this.model.width) % this.model.width;
    int cellY = (this.y + deltaY + this.model.height) % this.model.height;
    //print("x=$x y=$y deltaX=$deltaX deltaY=$deltaY cellX=$cellX cellY=$cellY");
    return this.model.getCellAt(cellX, cellY);
  }
  
  void computeNextStep();
  void evolve();
  Color getColor();
  void onClick();
  
}