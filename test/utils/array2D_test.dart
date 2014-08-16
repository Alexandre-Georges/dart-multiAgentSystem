import 'package:unittest/unittest.dart';
import '../../web/utils/array2D.dart';

main() {
//Some third party entries in your sources.list were disabled. You can re-enable them after the upgrade with the 'software-properties' tool or your package manager.
  
  group('getIndex', () {
    
    Array2D<String> array2D;
    
    setUp(() {
      array2D = new Array2D<String>(3, 2);
    });
  
    test("incorrect x", () {
      expect(() {
        array2D.getIndex(-1, 0);
      }, throwsArgumentError);
      expect(() {
        array2D.getIndex(3, 0);
      }, throwsArgumentError);
    });
  
    test("incorrect y", () {
      expect(() {
        array2D.getIndex(0, -1);
      }, throwsArgumentError);
      expect(() {
        array2D.getIndex(0, 2);
      }, throwsArgumentError);
    });
    
    test("getIndex", () {
      expect(array2D.getIndex(0, 0), 0);
      expect(array2D.getIndex(0, 1), 1);
      expect(array2D.getIndex(1, 0), 2);
      expect(array2D.getIndex(1, 1), 3);
      expect(array2D.getIndex(2, 0), 4);
      expect(array2D.getIndex(2, 1), 5);
    });

  });
  
  group('add', () {
    
    Array2D<String> array2D;
    
    setUp(() {
      array2D = new Array2D<String>(3, 2);
    });
    
    test("incorrect x", () {
      expect(() {
        array2D.add(-1, 0, "val -1.0");
      }, throwsArgumentError);
      expect(() {
        array2D.add(3, 0, "val 3.0");
      }, throwsArgumentError);
    });
  
    test("incorrect y", () {
      expect(() {
        array2D.add(0, -1, "val 0.-1");
      }, throwsArgumentError);
      expect(() {
        array2D.add(0, 2, "val 0.2");
      }, throwsArgumentError);
    });

    test("add", () {
      expect(() {
        array2D.add(0, 0, "val 0.0");
        array2D.add(0, 1, "val 0.1");
        array2D.add(1, 0, "val 1.0");
        array2D.add(1, 1, "val 1.1");
        array2D.add(2, 0, "val 2.0");
        array2D.add(2, 1, "val 2.1");
      }, returnsNormally);
    });
  });
  
  group('get', () {
    
    Array2D<String> array2D;
    
    setUp(() {
      array2D = new Array2D<String>(3, 2);
      array2D.add(0, 0, "val 0.0");
      array2D.add(1, 0, "val 1.0");
      array2D.add(1, 1, "val 1.1");
      array2D.add(2, 0, "val 2.0");
      array2D.add(2, 1, "val 2.1");
    });
    
    test("incorrect x", () {
      expect(() {
        array2D.get(-1, 0);
      }, throwsArgumentError);
      expect(() {
        array2D.get(3, 0);
      }, throwsArgumentError);
    });
  
    test("incorrect y", () {
      expect(() {
        array2D.get(0, -1);
      }, throwsArgumentError);
      expect(() {
        array2D.get(0, 2);
      }, throwsArgumentError);
    });
    
    test("get", () {
      expect(array2D.get(0, 0), new isInstanceOf<String>());
      expect(array2D.get(0, 1), isNull);
      expect(array2D.get(1, 0), new isInstanceOf<String>());
      expect(array2D.get(1, 1), new isInstanceOf<String>());
      expect(array2D.get(2, 0), new isInstanceOf<String>());
      expect(array2D.get(2, 1), new isInstanceOf<String>());
      expect(array2D.get(0, 0), "val 0.0");
      expect(array2D.get(1, 0), "val 1.0");
      expect(array2D.get(1, 1), "val 1.1");
      expect(array2D.get(2, 0), "val 2.0");
      expect(array2D.get(2, 1), "val 2.1");
    });
  });
  
  group('toList', () {
    
    Array2D<String> array2D;
    
    setUp(() {
      array2D = new Array2D<String>(3, 2);
      array2D.add(0, 0, "val 0.0");
      array2D.add(1, 0, "val 1.0");
      array2D.add(1, 1, "val 1.1");
      array2D.add(2, 0, "val 2.0");
      array2D.add(2, 1, "val 2.1");
    });
    
    test("toList", () {
      expect(array2D.toList(), new isInstanceOf<List>());
      expect(array2D.toList(), [ "val 0.0", "val 1.0", "val 1.1", "val 2.0", "val 2.1"]);
    });
  });
  
}