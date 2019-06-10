Mundo m;

void setup ()

{
  size(900, 900);
  m= new Mundo();
  smooth();
  noStroke();
  // background(0);
}


void draw ()

{

  background(238);
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
