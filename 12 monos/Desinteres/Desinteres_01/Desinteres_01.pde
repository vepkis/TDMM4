BolitaReactiva boli;
Comportamiento c;
void setup()
{
  size (400, 400);
  //  boli= new BolitaReactiva();
  c= new Comportamiento();
}

void draw ()

{
  background(255);
  //boli.dibuja();

  c.dibuja();

  fill(200, 2, 0);
  ellipse(mouseX, mouseY, 10, 10);
}

void mousePressed()
{
}
