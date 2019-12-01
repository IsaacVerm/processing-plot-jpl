HomeGoalsBar home_goals_bar;
AwayGoalsBar away_goals_bar;
Goals goals;
Zone zone;
XLabel xlabel;
YLabels ylabels;

void setup() {
  size(1200, 500);
  float bottom_margin = 0.3;
  
  // goals
  goals = new Goals("average_goals_by_season.csv");
  goals.load();
  goals.parseCols();
  
  // zone
  // a zone contains the bars for home goals, away goals and an empty margin
  // so the number of zones is equal to the number of seasons with home goals
  int zones_count = goals.getVenueGoalsCount();
  zone = new Zone(zones_count);

  // preprocess data
  float[] home_goals = goals.getGoalsVenue("home");
  float[] away_goals = goals.getGoalsVenue("away");
  String[] seasons = goals.getUniqueSeasons();

  for (int i = 0; i < home_goals.length; i++) {
    // draw bars
    home_goals_bar = new HomeGoalsBar(i, home_goals[i], max(home_goals), zone.zone_width, zone.bar_width, bottom_margin);
    home_goals_bar.display();
    away_goals_bar = new AwayGoalsBar(i, away_goals[i], max(away_goals), zone.zone_width, zone.bar_width, bottom_margin);
    away_goals_bar.display();
    
    // draw x labels
    xlabel = new XLabel(seasons[i], away_goals_bar.x_corner_one + zone.bar_width / 8, away_goals_bar.y_corner_one + height / 20);
    xlabel.display();
    
    // draw y labels
    ylabels = new YLabels(max(goals.goals), zone.zone_width, bottom_margin);
    ylabels.display();
  }
}
