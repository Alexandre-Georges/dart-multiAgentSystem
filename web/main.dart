import 'dart:async';
import 'dart:html';
import 'rendering/renderer.dart';
import 'model/implementation/gameOfLife/model.dart';

void main() {
  CanvasElement canvasElement = querySelector('#canvas');
  GameOfLifeModel model = new GameOfLifeModel(50, 60);
  model.addListeners(canvasElement);
  Renderer renderer = new Renderer(model, canvasElement);
  renderer.start();
  //iterate(model);
}

void iterate(GameOfLifeModel model) {
  new Timer(new Duration(milliseconds: 200), () {
    model.computeNextStep();
    model.evolve();
    iterate(model);
  });
}

