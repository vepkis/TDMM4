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
  background(238);
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
