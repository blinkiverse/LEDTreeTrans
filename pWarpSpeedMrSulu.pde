class WarpSpeedMrSulu extends Pattern {
  int NUM_STARS = 200;
  WarpStar[] warpstars;

  WarpSpeedMrSulu() {
    m_name = "WarpSpeedMrSulu";
  }

  void setup(PApplet parent) {
    super.setup(parent);
    warpstars = new WarpStar[NUM_STARS];
    for (int i = 0; i<NUM_STARS; i++) {
      warpstars[i] = new WarpStar();
    }
  }
  
  void paint(PGraphics f) {
    f.background(0);
    f.stroke(255);
    
    for (int i=0; i<NUM_STARS; i++) {
      warpstars[i].paint(f);
    }
  }
}


class WarpStar {
  float x;
  float y;
  float len;
  float vy;
  float vx;
  
  float r;
  float g;
  float b;

  WarpStar() {
    this.reset();
  }

  void reset() {
    x = int(random(0, displayWidth));
    y = int(random(0, -100));

//    if (random(0,1) > .5) {
//      vx = random(0, 1);
//      vy = 0;
//      len = vx * 5;
//    }
//    else {
      vx = 0;
      vy = random(0, 1);
      len = vy * 5;
//    }
  }

  void paint(PGraphics f) {
    x = x + vx;
    y = y + vy;
    //RGB 252/23/218 
    //r = int(map(y, 0, displayHeight, 0, 255));
    //g = 0;
    //b = 0;
    //r = 252;
    //g = 23;
    //b = 218;
    r = random(232,255);
    g = random(230,255);
    b = random(230,255);
    // scale brightness.
    float bright = random(.5,2);
    r = r*bright;
    g = g*bright;
    b = b*bright;
    
    for (int i=0; i<len; i++) {
      float intensity = 255 >> i / 2;
      
      f.fill(color(r*random(.8,1.3),g*random(.8,1.3),b*random(.8,1.3)));
      f.stroke(color(r,g,b));
      //stroke(intensity);
      f.point(x, y - i);
    }

    if (y > displayHeight) this.reset();
    if (x > displayWidth) this.reset();
  }
}
