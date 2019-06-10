Narciso n1, n2;

float movX, movY, comodinX=-1, comodinY=-1;
void setup()
{
  size (600, 400);
  noStroke();
  n1= new Narciso();
  n2= new Narciso();
  movY=n1.getPxPy()[1];
}


void draw ()
{
  background (250);
  // n1.setPxPy(mouseX, mouseY);
  /*  if (n1.getPxPy()[0]+n1.getCollider()<n2.getPxPy()[0]+n2.getCollider())
   {
   n2.setPxPy(n1.getPxPy()[0]+100, n1.getPxPy()[1]);
   }
   */
  n1.dibuja();
  //  n2.dibuja();
  movimiento();

  println(movX);
}


void movimiento()
{
  if (n1.getPxPy()[0]> width || n1.getPxPy()[0]<0)
  {
    comodinX*=-1;
  }

  if (n1.getPxPy()[1]> height || n1.getPxPy()[1]<0)
  {
    comodinY*=-1;
  }

  movX+=comodinX;
  movY+=comodinY;

  n1.setPxPy(movX, movY);
}

void colision()
{

  
}
