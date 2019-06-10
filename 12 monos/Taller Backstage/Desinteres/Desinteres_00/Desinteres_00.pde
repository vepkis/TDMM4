float px, py, mx, my, tam;
float angulo;
float comX=1, comY=1, vel, disty, dir=45;

float distyX, distyY, umbral;

void setup()
{
  size (400, 400);
  px= width/2;
  py= height/2;
  vel=4;
  tam=20;
  disty=0;
  angulo=0;
  umbral=50;
}

void draw ()

{
  background(0);
  mx=mouseX;
  my=mouseY;
  ellipse(mx, my, tam, tam);
  distancia();
  cualAngulo();
  //movimiento();
  if (mousePressed) {
    sumaPunto();
    //seguir();
  }
  ellipse(px, py, tam/2, tam/2);
}

void sumaPunto()
{
  if (disty>umbral)
  {
    px+=vel*cos(angulo);
  }
  if (disty>umbral)
  {
    py+=vel*sin(angulo);
  }
}
void distancia()
{
  disty= dist (px, py, mx, my);
  distyX= (mx-px);
  distyY= (my-py);  
  // println(distyX);
}

void cualAngulo()
{
  angulo= atan2(my-py, mx-px);
  println(degrees(angulo));
}
