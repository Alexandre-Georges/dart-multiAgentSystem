library model;

import 'dart:html';
import '../rendering/renderable.dart';
import 'model.dart';

class Agent extends Renderable {
  
  Model _model;
  
  int _xIndex;
  int _yIndex;
  
  Agent(this._xIndex, this._yIndex, this._model);
  
  void render(CanvasElement canvas, CanvasRenderingContext2D context) {
    context.setFillColorRgb(155, 80, 80);
    context.fillRect(_xIndex * _model.unitWidth, _yIndex * _model.unitHeight, _model.unitWidth, _model.unitHeight);
  }
}