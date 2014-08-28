import 'dart:async';
import 'dart:html';
import 'rendering/renderer.dart';
import 'model/model.dart';
import 'model/implementation/gameOfLife/model.dart';

bool started = false;
Model model = null;

CanvasElement canvasElement = querySelector('#canvas');
ButtonInputElement start = querySelector('#startButton');
ButtonInputElement setDimensions = querySelector('#setDimensionsButton');
NumberInputElement width = querySelector('#width');
NumberInputElement height = querySelector('#height');

Renderer renderer = new Renderer(canvasElement);

void main() {
  
  renderer.start();
  
  start.addEventListener("click", (MouseEvent mouseEvent){
    started = !started;
    if (started) {
      iterate(model);
    }
    start.value = started ? 'Stop' : 'Start';
  });
  
  setDimensions.addEventListener("click", (MouseEvent mouseEvent){
    model = new GameOfLifeModel(width.valueAsNumber.toInt(), height.valueAsNumber.toInt());
    model.addListeners(canvasElement);
    renderer.addRenderable(model);
  });
}

void iterate(GameOfLifeModel model) {
  new Timer(new Duration(milliseconds: 100), () {
    if (started) {
      model.computeNextStep();
      model.evolve();
      iterate(model);
    }
  });
}

