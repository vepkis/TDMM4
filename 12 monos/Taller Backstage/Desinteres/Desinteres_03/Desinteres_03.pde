Comportamiento comp;
void setup()
{
  //  size (800, 800);
  ///---------------------
  fullScreen();
  orientation(PORTRAIT);
  ///---------------------
  comp= new Comportamiento();
  noCursor();
}

void draw ()

{
  background(255);
  comp.dibuja();
}

void mousePressed()
{
  comp.mousePressed();
}

void keyPressed()
{
  comp.keyPressed();
}
