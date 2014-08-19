import 'dart:async';
import 'rendering/renderer.dart';
import 'model/implementation/gameOfLife/model.dart';

void main() {
  GameOfLifeModel model = new GameOfLifeModel(4, 3);
  Renderer renderer = new Renderer(model);
  renderer.start();
  iterate(model);
}

void iterate(GameOfLifeModel model) {
  new Timer(new Duration(seconds: 2), () {
    model.computeNextStep();
    model.evolve();
    iterate(model);
  });
}

