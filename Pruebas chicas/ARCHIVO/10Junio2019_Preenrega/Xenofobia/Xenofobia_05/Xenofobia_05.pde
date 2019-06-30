Mundo m;
void setup()

{
  // size (1400, 600);
  ///---------------------
  fullScreen();
  orientation(LANDSCAPE);
  ///---------------------
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
