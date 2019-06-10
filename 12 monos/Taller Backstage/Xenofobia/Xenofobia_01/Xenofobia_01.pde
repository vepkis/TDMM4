Mundo m;
void setup()

{
  size (800, 600);
  m= new Mundo();
  noStroke();
}


void draw ()

{
  background(240);
  m.dibuja();
}

void mousePressed()
{
  m.mousePressed();
}
