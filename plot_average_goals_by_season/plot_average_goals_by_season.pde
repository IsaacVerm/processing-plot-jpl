HomeGoalsBar home_goals_bar;
AwayGoalsBar away_goals_bar;
Goals goals;

void setup() {
  size(700, 500);
  int bar_width = 10;
  int zone_width = 30;
  
  // get data
  goals = new Goals("average_goals_by_season.csv");
  goals.load();
  goals.parseCols();

  // filter data
  float[] home_goals = goals.getGoalsVenue("home");
  float[] away_goals = goals.getGoalsVenue("away");

  // draw bars
  for (int i = 0; i < home_goals.length; i++) {
    // length home_goals is the same as away_goals so we can pick whichever one we like
    home_goals_bar = new HomeGoalsBar(i, home_goals[i], max(home_goals), bar_width, zone_width);
    home_goals_bar.display();
    away_goals_bar = new AwayGoalsBar(i, away_goals[i], max(away_goals), bar_width, zone_width);
    away_goals_bar.display();
  }
}

class GoalsBar {
  float y_corner_one;
  float y_corner_two;

  GoalsBar(int _i, float _avg_goals, float _max_goals) {
    rectMode(CORNERS);
    noStroke();

    y_corner_one = height * 0.9;
    y_corner_two = height - _avg_goals * (height / ceil(_max_goals));
  }
}

class HomeGoalsBar extends GoalsBar {
  float x_corner_one;
  float x_corner_two;

  HomeGoalsBar(int _i, float _avg_goals, float _max_goals, float _bar_width, float _zone_width) {
    super(_i, _avg_goals, _max_goals);

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

  AwayGoalsBar(int _i, float _avg_goals, float _max_goals, float _bar_width, float _zone_width) {
    super(_i, _avg_goals, _max_goals);

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
