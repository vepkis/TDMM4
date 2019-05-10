Mundo m;

void setup ()
{
  size(600, 600, P3D);

  m= new Mundo();
  noStroke();
  smooth();
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
