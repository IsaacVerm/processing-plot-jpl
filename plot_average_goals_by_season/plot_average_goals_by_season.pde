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
    home_goals_bar = new HomeGoalsBar(i, home_goals[i], max(home_goals), goals);
    home_goals_bar.display();
    away_goals_bar = new AwayGoalsBar(i, away_goals[i], max(away_goals), goals);
    away_goals_bar.display();
  }
}
