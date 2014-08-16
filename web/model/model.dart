library model;

import 'dart:html';
import '../rendering/renderable.dart';
import '../utils/array2D.dart';
import 'agent.dart';

class Model extends Renderable {
  
  int _width = 10;
  int _height = 10;

  int _unitWidth;
  int _unitHeight;
  
  Array2D<Agent> agents;
  
  Model() {
    agents = new Array2D(this._width, this._height);
    agents.add(1, 0, new Agent(1, 0, this));
  }
  
  void render(CanvasElement canvas, CanvasRenderingContext2D context) {
    context.setFillColorRgb(0, 0, 0);
    this._unitWidth = canvas.width ~/ _width;
    this._unitHeight = canvas.height ~/ _height;
    context.fillRect(0, 0, this._unitWidth * _width, this._unitHeight * _height);
    agents.toList().forEach((Agent agent) {
      agent.render(canvas, context);
    });
  }

  int get unitWidth => this._unitWidth;
  int get unitHeight => this._unitHeight;
}