Mundo m;
void setup()

{
  size (900, 600);
  //  fullScreen();

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
