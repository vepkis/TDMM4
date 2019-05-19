Mundo m;

void setup ()

{
  size(900, 900);
  m= new Mundo();
  smooth();
  noStroke();
}


void draw ()

{
  background(200);
  m.dibuja();
}


void mousePressed()
{
  m.mousePressed();
}

void mouseReleased()
{
  m.mouseReleased();
}
