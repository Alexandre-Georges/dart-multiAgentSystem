library rendering;

import 'dart:html';
import 'dart:async';
import 'renderable.dart';

class Renderer extends Renderable {
  
  Renderable _renderable;
  
  CanvasElement _canvas = null;
  CanvasRenderingContext2D _context = null;
  Window _window = null;
  
  Renderer(this._canvas) {
    this._window = window;
    this._context = this._canvas.getContext('2d');
  }
  
  void addRenderable(Renderable renderable) {
    this._renderable = renderable;
  }
  
  void start() {
    this.redraw(-1);
  }
  
  void render(CanvasElement canvas, CanvasRenderingContext2D context) {
    this._context.beginPath();
    this._context.clearRect(0, 0, canvas.width, canvas.height);
    if (this._renderable != null) {
      this._renderable.render(canvas, context);
    }
    this._context.closePath();
  }
  
  void redraw(num _) {
    this.render(this._canvas, this._context);
    this._window.requestAnimationFrame(redraw);
  }
  
}
