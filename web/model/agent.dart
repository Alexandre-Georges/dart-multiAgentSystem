library model;

import 'dart:html';
import '../rendering/renderable.dart';
import 'model.dart';

class Agent extends Renderable {
  
  Model _model;
  
  int _xIndex;
  int _yIndex;
  
  void render(CanvasElement canvas, CanvasRenderingContext2D context) {
    context.fillRect(_xIndex, _yIndex, canvas.width, canvas.height);
  }
}