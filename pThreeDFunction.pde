// A pattern that lights up a single edge with a solid color that changes randomly
class ThreeDFunction extends Pattern {
  float m_phase;
  
  ThreeDFunction() {
    m_name = "ThreeDFunction";
  }
  
  void paint(PGraphics f) {
    float m_height = (sin(m_phase)+1) + .8;
    for( Edge e : g_edges) {
        for(int i = 0; i < e.m_length; i++) {
          PVector coords = e.getPixelCoordinates(i);

// Rainbow sweeps
            float r = (sin(coords.x*3 + m_phase  ) + 1)*128*random(.8,1);
            float g = (sin(coords.y*3 + m_phase*3.2) + 1)*128*random(.8,1);
            float b = (sin(coords.z*3 + m_phase*4.3) + 1)*128*random(.8,1);
            e.paint(f, i, color(r,g,b));



// Color sweeps
//            float r = (((coords.x*3 + m_phase    )%10>5) ? 255.0 : 0.0);
//            float g = (((coords.y*3 + m_phase*3.2)%10>5) ? 255.0 : 0.0);
//            float b = (((coords.z*3 + m_phase*4.3)%10>5) ? 255.0 : 0.0);
//            e.paint(f, i, color(r,g,b));

// Spherical bombs
//            float distanceFromCenter = dist(coords.x, coords.y, coords.z, 0,1,0);
//            float r = map(sin(distanceFromCenter*3 + m_phase),-1,1,0,255); 
//            float g = 0;
//            float b = 0;
//            e.paint(f, i, color(r,g,b));
            
// Siren light
//            PVector twoD = new PVector(coords.x, coords.z);
//            PVector heading = PVector.fromAngle(m_phase*2);
//            float angle = PVector.angleBetween(twoD, heading);
//            
//            float r = ((angle > 0 && angle < PI/2) ? 255: 0);
//            float g = 0;
//            float b = ((angle > PI/2 && angle < PI) ? 255: 0);
//            e.paint(f, i, color(r,g,b));

      }
      // Otherwise we're high and dry!
    }
    
    m_phase += random(.01,.03);
  }
}

