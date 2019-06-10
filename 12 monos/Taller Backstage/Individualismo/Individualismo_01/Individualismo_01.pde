PImage ima;
Comportamiento comp;
void setup()
{
fullScreen();
  comp= new Comportamiento();
  // noCursor();
  ima=loadImage("kristaIMG.png");
}

void draw ()

{
  background(255);
  image(ima, 0, 0);
  comp.dibuja();
}

void mousePressed()
{
  comp.mousePressed();
}
