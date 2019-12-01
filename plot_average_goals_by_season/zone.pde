class Zone {
  float zone_width;
  float bar_width;
  
  Zone(Goals _goals) {
    goals.load();
    goals.parseCols();
    
    zone_width = floor(width / _goals.getVenueGoalsCount());
    bar_width = zone_width / 3;
  }
}
