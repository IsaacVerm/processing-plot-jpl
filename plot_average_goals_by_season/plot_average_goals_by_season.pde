HomeGoalsBar home_goals_bar;

int zone_width = 60;

void setup() {
  size(500, 500);
  home_goals_bar = new HomeGoalsBar(8, 1.5, 3, 10, 60);
  home_goals_bar.display();
}

class GoalsBar {

  color c;
  float x_corner_one;
  float y_corner_one;
  float x_corner_two;
  float y_corner_two;

GoalsBar(int _i, float _avg_goals, int _max_goals) {
    rectMode(CORNERS);
    noStroke();

    y_corner_one = height * 0.9;
    y_corner_two = height - _avg_goals * (height / _max_goals);
  }
  
}

class HomeGoalsBar extends GoalsBar {
  float bar_width;
  float zone_width;
  
  HomeGoalsBar(int _i, float _avg_goals, int _max_goals, float _bar_width, float _zone_width) {
    super(_i, _avg_goals, _max_goals);
    
    // x values first and second corner depend on venue
    x_corner_one = _i * _zone_width;
    x_corner_two = _i * _zone_width + _bar_width;
    
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
