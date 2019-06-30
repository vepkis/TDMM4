Mundo m;

void setup ()

{
  // size(900, 900);
  ///---------------------
  fullScreen();
  orientation(LANDSCAPE);
  ///---------------------
  m= new Mundo();
  smooth();
  noStroke();
  // background(0);
}


void draw ()

{

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

void mousePressed()
{
  m.mousePressed();
}

void mouseReleased()
{
  m.mouseReleased();
}
