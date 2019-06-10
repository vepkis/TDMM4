Mundo m;
void setup ()
{
  //size (400, 400);
  ///---------------------
  fullScreen();
  orientation(PORTRAIT);
  ///---------------------  
  m= new Mundo();
  smooth();
  noStroke();
}


void draw ()

{
  background (238);
  m.dibuja();
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
