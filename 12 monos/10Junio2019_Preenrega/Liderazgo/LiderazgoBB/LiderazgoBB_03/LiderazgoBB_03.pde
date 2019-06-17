Mundo m;

void setup()
{
  size (800, 400);
  m= new Mundo();
}

void draw ()

{
  background(238);
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

void keyPressed()
{
  m.keyPressed();
}
