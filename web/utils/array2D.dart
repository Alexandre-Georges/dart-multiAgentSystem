library utils;

class Array2D<Type> {
  
  int _width;
  int _height;
  List<Type> _list;
  List<Type> _array;
  
  Array2D(int width, int height) {
    this._width = width;
    this._height = height;
    this._list = new List();
    this._array = new List(width * height);
  }
  
  int getIndex(int x, int y) {
    _checkRange(x, y);
    return x * this._height + y;
  }
  
  void add(int x, int y, Type object) {
    this._list.add(object);
    this._array[this.getIndex(x, y)] = object;
  }
  
  Type get(int x, int y) {
    return this._array.elementAt(this.getIndex(x, y));
  }
  
  void _checkRange(int x, int y) {
    if (x < 0 || x > this._width - 1) {
      throw this._createRangeError("x", x, 0, this._width);
    } else if (y < 0 || y > this._height - 1) {
      throw this._createRangeError("y", y, 0, this._height);
    }
  }
  
  ArgumentError _createRangeError(String dimensionName, int value, int minValue, int maxValue) {
    return new ArgumentError("Incorrect value for $dimensionName : $value, min value is $minValue and max value is $maxValue");
  }
  
  List<Type> toList() {
    return this._list;
  }
}