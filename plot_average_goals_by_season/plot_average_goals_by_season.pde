void setup() {
  size(700, 500);
  Table avg_goals_by_season = loadTable("average_goals_by_season.csv", "header");

  float[] home_goals = getGoalsVenue(avg_goals_by_season, "home");
  float[] away_goals = getGoalsVenue(avg_goals_by_season, "away");

  drawGoals(home_goals, "home");
  drawGoals(away_goals, "away");
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
  } else if (venue.equals("away")) {
    fill(153, 153, 153);
  }
}

int getPosition(String venue) {
  if (venue.equals("home")) {
    return 2;
  } else if (venue.equals("away")) {
    return 1;
  }
  return 0;
}


void drawGoals(float[] goals, String venue) {
  // define as 2 corners instead of corner + width/height
  rectMode(CORNERS);
  setColor(venue); 
  noStroke();

  // calculate variables needed for calculation corners
  float bar_width = width / (goals.length * 3);
  float max_goals = max(goals);
  float zone_width = 3 * bar_width;
  float y_margin = 0.1;

  // plot bars
  for (int i = 0; i < goals.length; i++) {
    float x_corner_one = i * zone_width;
    float y_corner_one = height * (1 - y_margin);
    float x_corner_two = i * zone_width + bar_width;
    float y_corner_two = height - goals[i] * (height / ceil(max_goals));

    if (venue.equals("away")) {
      rect(x_corner_one, 
        y_corner_one, 
        x_corner_two, 
        y_corner_two);
    } else if (venue.equals("home")) {
      rect(x_corner_one + bar_width, 
        y_corner_one, 
        x_corner_two + bar_width, 
        y_corner_two);
    }
  }
}
