Table avg_goals_by_season;
int window_width = 1000;
int window_height = 1000;

void setup() {
  size(1000, 1000);
  avg_goals_by_season = loadTable("average_goals_by_season.csv", "header");
  
  float[] home_goals = getHomeGoals(avg_goals_by_season);
  
  drawHomeGoals(home_goals);
}

float[] getHomeGoals(Table avg_goals_by_season) {
  // get goals and venue columns
  float[] goals = float(avg_goals_by_season.getStringColumn("goals"));
  String[] venue = avg_goals_by_season.getStringColumn("venue");
  
  // create empty home_goals array
  float[] home_goals = new float[0];
  
  // append to home goals if venue is home
  for (int i = 0; i < goals.length; i++) {
    if (venue[i].equals("home")) {
      home_goals = append(home_goals, goals[i]);
    }
  }
  
  // return the home_goals_array
  return home_goals;
}

void drawHomeGoals(float[] home_goals, distance_between_bars, bar_width, y_margin) {
  rectMode(CORNERS);
  
  for (int i = 0; i < home_goals.length; i++) {
    rect(i * 50, window_height - y_margin , i * distance_between_bars + bar_width, window_height - home_goals[i] * 500);
  }
}
