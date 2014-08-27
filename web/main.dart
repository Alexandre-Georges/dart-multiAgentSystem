import 'dart:async';
import 'dart:html';
import 'rendering/renderer.dart';
import 'model/model.dart';
import 'model/implementation/gameOfLife/model.dart';

bool started = false;
Model model = null;

void main() {
  
  ButtonInputElement start = querySelector('#startButton');
  start.addEventListener("click", (MouseEvent mouseEvent){
    started = !started;
    if (started) {
      iterate(model);
    }
    start.value = started ? 'Stop' : 'Start';
  });
  
  CanvasElement canvasElement = querySelector('#canvas');
  model = new GameOfLifeModel(50, 60);
  model.addListeners(canvasElement);
  Renderer renderer = new Renderer(model, canvasElement);
  renderer.start();
  //iterate(model);
}

void iterate(GameOfLifeModel model) {
  if (started) {
    model.computeNextStep();
    model.evolve();
    new Timer(new Duration(milliseconds: 2000), () {
        iterate(model);
    });
  }
}

