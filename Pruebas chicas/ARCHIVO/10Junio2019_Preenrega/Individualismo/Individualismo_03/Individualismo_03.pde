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
  background(238);
  comp.dibuja();
}

void mousePressed()
{
  comp.mousePressed();
}
