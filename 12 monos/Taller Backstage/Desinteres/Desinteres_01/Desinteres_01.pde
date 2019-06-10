Comportamiento comp;
void setup()
{
  size (600, 600);
  comp= new Comportamiento();
}

void draw ()

{
  background(255);
  comp.dibuja();
}

void mousePressed()
{
  comp.mousePressed();
}

void keyPressed()
{
  comp.keyPressed();
}
