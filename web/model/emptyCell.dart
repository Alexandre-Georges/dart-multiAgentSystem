library emptyCell;

import 'dart:html';
import 'cell.dart';
import 'evolvable.dart';
import 'model.dart';

class EmptyCell implements Cell {
  
  Model _model;
  
  int _xIndex;
  int _yIndex;
  
  EmptyCell(this._xIndex, this._yIndex, this._model);
  
  void render(CanvasElement canvas, CanvasRenderingContext2D context) {
    context.setFillColorRgb(155, 155, 155);
    context.fillRect(_xIndex * _model.unitWidth, _yIndex * _model.unitHeight, _model.unitWidth, _model.unitHeight);
  }
  
  void computeNextStep() {
    
  }
  
  Evolvable evolve() {
    return this;
  }
}