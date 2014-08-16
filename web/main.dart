import 'rendering/renderer.dart';
import 'model/model.dart';

void main() {
  Model model = new Model();
  Renderer renderer = new Renderer(model);
  renderer.start();
//  test.nextIteration();
}

