void setup() {
  size(700, 500);
  Table avg_goals_by_season = loadTable("average_goals_by_season.csv", "header");
  
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

void drawHomeGoals(float[] home_goals) {
  // define as 2 corners instead of corner + width/height
  rectMode(CORNERS);
  
  // calculate variables needed for calculation corners
  float bar_width = width / (home_goals.length * 3);
  float max_home_goals = max(home_goals);
  float zone_width = 3 * bar_width;
  float y_margin = 0.1;
  
  // plot bars
  for (int i = 0; i < home_goals.length; i++) {
    float x_corner_one = i * zone_width;
    float y_corner_one = height * (1 - y_margin);
    float x_corner_two = i * zone_width + bar_width;
    float y_corner_two = height - home_goals[i] * (height / ceil(max_home_goals));
    
    rect(x_corner_one,
         y_corner_one,
         x_corner_two,
         y_corner_two);
  }
}
