Mundo m;
void setup()

{
  //size (800, 800); 
  ///---------------------
  fullScreen();
  orientation(LANDSCAPE);
  ///---------------------

  noStroke();
  m= new Mundo(width, height, 3, 2);
  //  background(255);
  background(240);
}


void draw ()

{


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
