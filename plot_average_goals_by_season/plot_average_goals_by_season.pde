void setup() {
  size(700, 500);
  Table avg_goals_by_season = loadTable("average_goals_by_season.csv", "header");
  
  float[] home_goals = getHomeGoals(avg_goals_by_season);
  
  drawHomeGoals(home_goals, width, height);
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

void drawHomeGoals(float[] home_goals,
                   int window_width,
                   int window_height) {
  // define as 2 corners instead of corner + width/height
  rectMode(CORNERS);
  
  // calculate variables needed for calculation corners
  float bar_width = window_width / (home_goals.length * 3);
  float max_home_goals = max(home_goals);
  float zone_width = 3 * bar_width;
  
  // plot bars
  for (int i = 0; i < home_goals.length; i++) {
    float x_corner_one = i * zone_width;
    float y_corner_one = window_height * 0.9;
    float x_corner_two = i * zone_width + 2 * bar_width;
    float y_corner_two = window_height - home_goals[i] * (window_height / ceil(max_home_goals));
    
    rect(x_corner_one,
         y_corner_one,
         x_corner_two,
         y_corner_two);
  }
}
