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
  
  Cell();
  
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
  
  void computeNextStep();
  void evolve();
  Color getColor();
  void onClick();
  
}