Bar bar;

int zone_width = 60;

void setup() {
  size(500, 500);
  bar = new Bar(5, 1.5, 2);
  bar.display();
}

class Bar {

  color c;
  int i;
  float avg_goals;
  int max_goals;
  float bar_width;

  Bar(int _i, float _avg_goals, int _max_goals, float _bar_width, float _zone_width) {
    rectMode(CORNERS);
    noStroke();

    c = color(255);

    float x_corner_one = _i * _zone_width;
    float y_corner_one = height * 0.9;

    float x_corner_two = _i * zone_width + _bar_width;
    float y_corner_two = height - _avg_goals * (height / _max_goals);
  }

  void display() {
    rect(x_corner_one, 
      y_corner_one, 
      x_corner_two, 
      y_corner_two);
  }
}
