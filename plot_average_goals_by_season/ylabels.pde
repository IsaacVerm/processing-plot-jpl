class YLabels {
  float max_goals;
  float zone_width;
  float bottom_margin;
  
  YLabels(float _max_goals, float _zone_width, float _bottom_margin) {
    max_goals = _max_goals;
    zone_width = _zone_width;
    bottom_margin = _bottom_margin;
  }
  
  void display() {
    text("0", zone_width / 3, height * (1 - bottom_margin / 2));
    text(nf(max_goals, 0, 2), zone_width / 3, height * bottom_margin / 3);
  }
}
