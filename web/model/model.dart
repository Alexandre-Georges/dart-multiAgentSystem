library model;

import 'dart:html';
import '../rendering/renderable.dart';
import 'agent.dart';

class Model extends Renderable {
  
  int _width = 10;
  int _height = 10;

  int _unitWidth;
  int _unitHeight;
  
  List<List<Agent>> agents;
  
  Model() {
    agents = new List();
  }
  
  void render(CanvasElement canvas, CanvasRenderingContext2D context) {
    this._unitWidth = canvas.width ~/ _width;
    this._unitHeight = canvas.height ~/ _height;
    context.fillRect(0, 0, this._unitWidth * _width, this._unitHeight * _height);
  }
}