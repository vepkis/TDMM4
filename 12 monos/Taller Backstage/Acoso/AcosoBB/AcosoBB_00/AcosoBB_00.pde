Esferita e;
void setup ()
{
  size (400, 400);
  e= new Esferita();
  smooth();
  noStroke();
}


void draw ()

{
  background (200);
  e.dibuja();
}


void mouseDragged()
{
  e.setPxPy(mouseX, mouseY);
  e.evaluaAvance();
}
