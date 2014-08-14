import 'dart:html';
import 'dart:async';
import 'renderable.dart';

class Renderer extends Renderable {
  
  Renderable _renderable;
  
  CanvasElement _canvas = null;
  CanvasRenderingContext2D _context = null;
  Window _window = null;
  
  Renderer(this._renderable) {
    this._window = window;
    this._canvas = querySelector('#canvas');
    this._context = this._canvas.getContext('2d');
  }
  
  void start() {
    this.render(-1);
  }
  
  void render(num value) {
    this._context.beginPath();
    this._context.clearRect(0, 0, this._canvas.width, this._canvas.height);
    this._renderable.render(this._context);
    this._context.closePath();
    window.requestAnimationFrame(render);
  }
  
}

class Test extends Renderable {

  int iterations = 0;
  int x = 0;
  int y = 0;

  void render(context) {
    context.fillRect(x, y, 100, 200);
  }
  
  void nextIteration() {
    iterations++;
    x +=1;
    y +=1;
    
    if (iterations < 100) {
      new Future.delayed(new Duration(milliseconds: 10), nextIteration);
    }
  }
}