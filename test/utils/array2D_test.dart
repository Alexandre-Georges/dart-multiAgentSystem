import 'package:unittest/unittest.dart';
import '../../web/utils/array2D.dart';

main() {

  Array2D<String> array2D = new Array2D<String>(3, 2);
  
  test("negative x", () {
    expect(() {
      array2D.getIndex(-1, 0);
    }, throwsArgumentError);
  });

  test("negative y", () {
    expect(() {
      array2D.getIndex(0, -1);
    }, throwsArgumentError);
  });

  test("x is too high", () {
    expect(() {
      array2D.getIndex(3, 0);
    }, throwsArgumentError);
  });

  test("y is too high", () {
    expect(() {
      array2D.getIndex(0, 3);
    }, throwsArgumentError);
  });
  
  test("index (0, 0)", () {
    expect(array2D.getIndex(0, 0), 0);
  });
  
  test("index (0, 1)", () {
    expect(array2D.getIndex(0, 1), 1);
  });
  
  test("index (1, 0)", () {
    expect(array2D.getIndex(1, 0), 2);
  });
  
  test("index (1, 1)", () {
    expect(array2D.getIndex(1, 1), 3);
  });
  
  test("index (2, 0)", () {
    expect(array2D.getIndex(2, 0), 4);
  });
  
  test("index (2, 1)", () {
    expect(array2D.getIndex(2, 1), 5);
  });
  
  array2D.add(0, 0, "val 0.0");
  array2D.add(0, 1, "val 0.1");
  array2D.add(1, 0, "val 1.0");
  array2D.add(1, 1, "val 1.1");
  array2D.add(2, 0, "val 2.0");
  array2D.add(2, 1, "val 2.1");

  test("get (0, 0)", () {
    expect(array2D.get(0, 0), "val 0.0");
  });

  test("get (0, 1)", () {
    expect(array2D.get(0, 1), "val 0.1");
  });

  test("get (1, 0)", () {
    expect(array2D.get(1, 0), "val 1.0");
  });

  test("get (1, 1)", () {
    expect(array2D.get(1, 1), "val 1.1");
  });

  test("get (2, 0)", () {
    expect(array2D.get(2, 0), "val 2.0");
  });

  test("get (2, 1)", () {
    expect(array2D.get(2, 1), "val 2.1");
  });

  
}