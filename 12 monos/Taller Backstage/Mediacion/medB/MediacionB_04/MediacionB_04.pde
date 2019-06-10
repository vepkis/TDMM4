Mundo m;
void setup()

{
  //size (800, 800); 
  ///---------------------
  fullScreen();
  orientation(PORTRAIT);
  ///---------------------

  noStroke();
  m= new Mundo(width, height, 3, 2);
  background(0);
}


void draw ()

{

  fill(240, 240, 240, 10);
  rect(0, 0, width/2, height);
  rect(width/2, 0, width, height);

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
