library cell;

import '../rendering/renderable.dart';
import 'evolvable.dart';

abstract class Cell implements Renderable, Evolvable {
  void render(CanvasElement, CanvasRenderingContext2D);
  void computeNextStep();
  Evolvable evolve();
}