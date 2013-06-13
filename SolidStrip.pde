// Strip display pattern- light an entire LED strip with a solid color
class SolidStrip extends Pattern {  
  SolidStrip(int channel, int pitch, int velocity) {
    super(channel, pitch, velocity);
  }
  
  void draw(PGraphics f) {
    if(m_velocity < 60) {
      f.stroke(color(255,0,0));
    }
    else {
      f.stroke(color(0,0,255));
    }
    f.line(m_pitch-60, 0, m_pitch-60, displayHeight);
  }
}
