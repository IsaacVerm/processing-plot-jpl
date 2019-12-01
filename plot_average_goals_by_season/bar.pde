class GoalsBar {
  float y_corner_one;
  float y_corner_two;
  Zone zone;

  GoalsBar(int _i, float _avg_goals, float _max_goals, float _zone_width, float _bar_width) {
    rectMode(CORNERS);
    noStroke();

    y_corner_one = height * 0.9;
    y_corner_two = height - _avg_goals * (height / ceil(_max_goals));
  }
}

class HomeGoalsBar extends GoalsBar {
  float x_corner_one;
  float x_corner_two;

  HomeGoalsBar(int _i, float _avg_goals, float _max_goals, float _zone_width, float _bar_width) {
    super(_i, _avg_goals, _max_goals, _zone_width, _bar_width);

    // x values first and second corner depend on venue
    x_corner_one = _i * _zone_width + _bar_width;
    x_corner_two = _i * _zone_width + 2 * _bar_width;

    // color depends on venue
    fill(247, 118, 108);
  }

  void display() {
    rect(x_corner_one, 
      y_corner_one, 
      x_corner_two, 
      y_corner_two);
  }
}

class AwayGoalsBar extends GoalsBar {
  float x_corner_one;
  float x_corner_two;

  AwayGoalsBar(int _i, float _avg_goals, float _max_goals, float _zone_width, float _bar_width) {
    super(_i, _avg_goals, _max_goals, _zone_width, _bar_width);

    // x values first and second corner depend on venue
    // home bars are displayed to the right of away bars
    x_corner_one = _i * _zone_width;
    x_corner_two = _i * _zone_width + _bar_width;

    // color depends on venue
    fill(153, 153, 153);
  }

  void display() {
    rect(x_corner_one, 
      y_corner_one, 
      x_corner_two, 
      y_corner_two);
  }
}
