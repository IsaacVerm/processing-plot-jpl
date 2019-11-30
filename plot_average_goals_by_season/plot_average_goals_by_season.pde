void setup() {
  size(700, 500);
  Table avg_goals_by_season = loadTable("average_goals_by_season.csv", "header");
  
  float[] home_goals = getGoalsVenue(avg_goals_by_season, "home");
  
  drawGoals(home_goals, "home");
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

void setColor(String venue) {
    if (venue.equals("home")) {
      fill(247, 118, 108);
    }
  }
 
void drawGoals(float[] home_goals, String venue) {
  // define as 2 corners instead of corner + width/height
  rectMode(CORNERS);
  setColor(venue); 
  noStroke();
  
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
