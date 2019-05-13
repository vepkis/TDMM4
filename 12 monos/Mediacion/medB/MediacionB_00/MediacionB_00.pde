Flipeador f;
void setup()

{
  size (400, 400); 
  f= new Flipeador(width/3, 0, width/3, height/2);
  noStroke();
}


void draw ()

{
  background(80);

  f.setUserXY(mouseX, mouseY);
  f.dibuja();
}


void mousePressed()
{
  f.mousePressed();
}
