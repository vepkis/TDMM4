Mundo m;

void setup()
{
  // size (1000, 600);
  ///---------------------
  fullScreen();
  orientation(LANDSCAPE);
  ///---------------------

  m= new Mundo();
}

void draw ()

{
  // background(238);
  fill(228, 100);
  rect(0, 0, width, height);

  m.dibuja();
}


void mousePressed ()
{
  m.mousePressed();
}
void mouseReleased ()
{
  m.mouseReleased ();
}
