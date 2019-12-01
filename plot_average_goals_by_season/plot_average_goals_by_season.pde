HomeGoalsBar home_goals_bar;
AwayGoalsBar away_goals_bar;

int zone_width = 60;

void setup() {
  size(700, 500);
  Table avg_goals_by_season = loadTable("average_goals_by_season.csv", "header");

  float[] home_goals = getGoalsVenue(avg_goals_by_season, "home");
  float[] away_goals = getGoalsVenue(avg_goals_by_season, "away");

  for (int i = 0; i < home_goals.length; i++) {
    home_goals_bar = new HomeGoalsBar(i, home_goals[i], max(home_goals), 10, 30);
    home_goals_bar.display();
    away_goals_bar = new AwayGoalsBar(i, away_goals[i], max(away_goals), 10, 30);
    away_goals_bar.display();
  }
}

float[] getGoalsVenue(Table avg_goals_by_season, String venue) {
  // get goals and venue columns
  float[] goals = float(avg_goals_by_season.getStringColumn("goals"));
  String[] venues = avg_goals_by_season.getStringColumn("venue");

  // create empty venue_goals array
  float[] venue_goals = new float[0];

  // append to venue_goals if venue matches venue requested as argument
  for (int i = 0; i < goals.length; i++) {
    if (venues[i].equals(venue)) {
      venue_goals = append(venue_goals, goals[i]);
    }
  }

  return venue_goals;
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
