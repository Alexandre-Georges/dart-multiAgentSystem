import 'dart:async';
import 'dart:html';
import 'rendering/renderer.dart';
import 'model/model.dart';
import 'model/implementation/gameOfLife/model.dart';

bool started = false;
Model model = null;

CanvasElement canvasElement = querySelector('#canvas');
CanvasRenderingContext2D context = canvasElement.getContext('2d');

ButtonInputElement start = querySelector('#startButton');
ButtonInputElement setDimensions = querySelector('#setDimensionsButton');
NumberInputElement width = querySelector('#width');
NumberInputElement height = querySelector('#height');

void main() {
  
  start.addEventListener("click", (MouseEvent mouseEvent){
    started = !started;
    if (started) {
      iterate(model);
    }
    start.value = started ? 'Stop' : 'Start';
  });
  
  setDimensions.addEventListener("click", (MouseEvent mouseEvent){
    model = new GameOfLifeModel(width.valueAsNumber.toInt(), height.valueAsNumber.toInt());
    model.addRenderer(new Renderer(canvasElement, context));
    model.addListeners(canvasElement);
  });
}

void iterate(GameOfLifeModel model) {
  new Timer(new Duration(milliseconds: 500), () {
    if (started) {
      model.computeNextStep();
      model.evolve();
      iterate(model);
    }
  });
}

