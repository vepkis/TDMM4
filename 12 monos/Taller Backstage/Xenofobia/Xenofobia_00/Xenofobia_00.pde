Frontera f;
void setup()

{
  size (800, 600);
  f= new Frontera();
}


void draw ()

{
  background(240);
  f.evaluaIngresante(mouseX, mouseY);
  f.dibuja();
}

void mousePressed()
{
}
