BolitaReactiva boli;

void setup()
{
  size (400, 400);
  boli= new BolitaReactiva();
}

void draw ()

{
  background(255);
  boli.dibuja();

  if (mousePressed)
  {
    boli.evaluaDistancia(mouseX, mouseY);
  }
}

void mousePressed()
{
}
