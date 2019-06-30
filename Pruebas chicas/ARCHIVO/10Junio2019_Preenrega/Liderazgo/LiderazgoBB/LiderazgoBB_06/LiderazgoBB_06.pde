Mundo m;

void setup()
{
  size (1000, 600);
  m= new Mundo();
}

void draw ()

{
  // background(238);
  fill(238, 20);
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

void keyPressed()
{
  m.keyPressed();
}
