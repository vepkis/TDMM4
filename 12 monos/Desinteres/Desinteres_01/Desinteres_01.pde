BolitaReactiva boli;
BolitaReactiva [] bolitas= new BolitaReactiva[20];
void setup()
{
  size (400, 400);
  boli= new BolitaReactiva();
  for (int i=0; i< bolitas.length; i++)
  {
    bolitas[i]= new BolitaReactiva();
  }
}

void draw ()

{
  background(255);
  //boli.dibuja();

  for (int i=0; i< bolitas.length; i++)
  {
    bolitas[i].dibuja();
  }

  if (mousePressed)
  {
    //boli.evaluaDistancia(mouseX, mouseY);
    for (int i=0; i< bolitas.length; i++)
    {
      bolitas[i].evaluaDistancia(mouseX, mouseY);
    }
  }

  fill(200, 2, 0);
  ellipse(mouseX, mouseY, 10, 10);
}

void mousePressed()
{
}
