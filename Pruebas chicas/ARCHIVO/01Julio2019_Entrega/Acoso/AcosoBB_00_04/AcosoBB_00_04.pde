Mundo m;
void setup ()
{
  size (800, 400);
  ///---------------------
  //fullScreen();
  orientation(LANDSCAPE);
  ///---------------------  
  m= new Mundo();
  smooth();
  noStroke();
}


void draw ()

{
  //  background (238);
  fondo();
  m.dibuja();
}

void fondo()
{
  pushStyle();
  fill(238, 100);
  rect(0, 0, width, height);
  popStyle();
}
void mouseDragged()
{
  //  m.setPxPy(mouseX, mouseY);
  // m.evaluaAvance();
}
void mouseReleased()
{
  m.mouseReleased();
}

void mousePressed()
{
  m.mousePressed();
}
