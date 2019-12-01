class XLabel {
  String label;
  float x;
  float y;
  
  XLabel(String _label, float _x, float _y) {
    label = _label;
    x = _x;
    y = _y;
  }
  
  void display() {
    text(label, x, y);
  }
}
