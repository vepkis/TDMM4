Comportamiento comp;
void setup()
{
  //  size (800, 800);
  ///---------------------
  fullScreen();
  orientation(LANDSCAPE);
  ///---------------------
  comp= new Comportamiento();
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

void keyPressed()
{
  comp.keyPressed();
}
