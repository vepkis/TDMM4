LineaQuebrada lQ= new LineaQuebrada();


//PShape figurita;


void setup ()
{
  size (600, 600);
}

void draw ()
{
  background(200);
  lQ.dibuja();
}


void mouseDragged()
{
  lQ.mouseDragged();
}
