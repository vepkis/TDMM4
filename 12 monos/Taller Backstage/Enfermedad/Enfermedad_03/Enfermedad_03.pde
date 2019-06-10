LineaQuebrada lQ;


//PShape figurita;


void setup ()
{
 // size (600, 600);
    ///---------------------
  fullScreen();
  orientation(PORTRAIT);
  ///---------------------
  lQ= new LineaQuebrada(200, 200);
}

void draw ()
{
  background(200);
  pushMatrix();
  translate(200, 200);
  lQ.dibuja();

  popMatrix();
}


void mouseMoved()
{
  lQ.mouseMoved();
}
