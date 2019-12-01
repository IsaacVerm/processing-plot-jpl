class Goals {
  Table goals_file;
  float[] goals;
  String[] venues;
  String filename;

  Goals(String _filename) {
    filename = _filename;
  }

  void load() {
    goals_file = loadTable(filename, "header");
  }

  void parseCols() {
    goals = float(goals_file.getStringColumn("goals"));
    venues = goals_file.getStringColumn("venue");
  }
  
  int getGoalsCount() {
    return goals.length;
  }

  float[] getGoalsVenue(String venue) {
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
}
