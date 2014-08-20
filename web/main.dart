import 'dart:async';
import 'rendering/renderer.dart';
import 'model/implementation/gameOfLife/model.dart';

void main() {
  GameOfLifeModel model = new GameOfLifeModel(50, 60);
  Renderer renderer = new Renderer(model);
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

