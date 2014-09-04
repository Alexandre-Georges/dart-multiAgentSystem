library renderer;

import 'dart:html';
import 'renderable.dart';

class Renderer {
  
  CanvasElement _canvas;
  CanvasRenderingContext2D _context;
  
  Renderer(this._canvas, this._context);
  
  void draw(Renderable renderable) {
    _context.beginPath();
    _context.clearRect(0, 0, _canvas.width, _canvas.height);
    renderable.render(_canvas, _context);
    _context.closePath();
  }
  
}
