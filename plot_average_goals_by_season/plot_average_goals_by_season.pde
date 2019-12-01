HomeGoalsBar home_goals_bar;
AwayGoalsBar away_goals_bar;
Goals goals;
Zone zone;

void setup() {
  size(1200, 500);
  
  // goals
  goals = new Goals("average_goals_by_season.csv");
  goals.load();
  goals.parseCols();
  
  // zone
  // a zone contains the bars for home goals, away goals and an empty margin
  // so the number of zones is equal to the number of seasons with home goals
  int zones_count = goals.getVenueGoalsCount();
  zone = new Zone(zones_count);

  // filter data
  float[] home_goals = goals.getGoalsVenue("home");
  float[] away_goals = goals.getGoalsVenue("away");

  // draw bars
  for (int i = 0; i < home_goals.length; i++) {
    // length home_goals is the same as away_goals so we can pick whichever one we like
    home_goals_bar = new HomeGoalsBar(i, home_goals[i], max(home_goals), zone.zone_width, zone.bar_width);
    home_goals_bar.display();
    away_goals_bar = new AwayGoalsBar(i, away_goals[i], max(away_goals), zone.zone_width, zone.bar_width);
    away_goals_bar.display();
  }
  
  String[] seasons = goals.getUniqueSeasons();
  print(seasons);
}
