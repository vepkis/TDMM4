Mundo m;

void setup ()
{
  size(800, 800, P3D);

  m= new Mundo();
  noStroke();
  smooth();
  noCursor();
}


void draw ()

{
  background(0);
  m.dibuja();
}


void mouseDragged()
{
  m. mouseDragged();
}

void keyPressed()
{
  m.keyPressed();
}
