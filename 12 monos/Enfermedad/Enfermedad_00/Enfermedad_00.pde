PShape figurita;
int pX, pY;
ArrayList <PVector> puntos= new ArrayList <PVector>();
float tam, largo, cant;
ArrayList disty= new ArrayList ();
float userX=0, userY=0;

void setup ()
{
  size (600, 600);
  largo= 200;
  cant=10;
  tam=largo/cant;

  for (int i=0; i< cant; i++) {
    creaPuntos(tam*i, tam);
  }
}

void draw ()
{
  background(200);
  evaluaDistancia();
  // comportamiento();
  dibujaPuntos();
  println(puntos.size()+"___"+disty.size());
}
void creaPuntos(float puntoA_, float puntoB_)
{
  PVector vect = new PVector(puntoA_, puntoB_);
  puntos.add(vect);
  disty.add(0);
}

void dibujaPuntos()
{
  beginShape();

  for (int i=0; i< puntos.size(); i++)
  {
    vertex(puntos.get(i).x, puntos.get(i).y);
  }
  endShape(CLOSE);
}

void evaluaDistancia()
{
  userX=mouseX;
  userY=mouseY;
  for (int i=0; i< puntos.size(); i++) {
    //disty= dist(mouseX, mouseY, puntos.get(i).x,puntos.get(i).y);

    disty.set(i, dist(userX, userY, puntos.get(i).x, puntos.get(i).y));
  }

  println(disty.get(0));
}

void mouseDragged()
{
  pX=mouseX;
  pY=mouseY;
}
