class Zone {
  float zone_width;
  float bar_width;
  
  Zone(int zones_count) {
    zone_width = floor(width / zones_count);
    bar_width = zone_width / 3;
  }
}
