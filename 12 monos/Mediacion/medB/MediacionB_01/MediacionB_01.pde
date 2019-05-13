Mundo m;
void setup()

{
  size (800, 800); 
  noStroke();
  m= new Mundo(width, height, 3, 2);
}


void draw ()

{
  background(80);

  m.dibuja();

  //  f.setUserXY(mouseX, mouseY);
  //f.dibuja();
}


void mousePressed()
{
  m.mousePressed();
}


void keyPressed()

{
  m.keyPressed();
}
