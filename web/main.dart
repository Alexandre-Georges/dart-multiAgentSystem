import 'rendering/renderer.dart';

void main() {
  Test test = new Test();
  Renderer renderer = new Renderer(test);
  renderer.start();
  test.nextIteration();
}

