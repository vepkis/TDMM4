Comportamiento comp;
void setup()
{
  //fullScreen();
  ///---------------------
  fullScreen();
  orientation(LANDSCAPE);
  ///---------------------
  comp= new Comportamiento();
  // noCursor();
}

void draw ()

{
  // background(238);
  fondo();
  comp.dibuja();
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
  comp.mousePressed();
}
