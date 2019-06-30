Mundo m;
void setup()

{
  //size (1400, 600);
  ///---------------------
  fullScreen();
  orientation(LANDSCAPE);
  ///---------------------
  m= new Mundo();
  noStroke();
}


void draw ()

{

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
