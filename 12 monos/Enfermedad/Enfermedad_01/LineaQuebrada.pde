class LineaQuebrada
{
  int pX, pY;
  ArrayList <PVector> puntos;
  float tam, largo, cant;
  //ArrayList <Float>disty;
  FloatList disty= new FloatList ();
  float userX=0, userY=0;
  float umbral;


  LineaQuebrada()
  {
    puntos= new ArrayList <PVector>();
    disty= new FloatList();
    largo= 400;
    cant=10;
    tam=largo/cant;
    umbral=largo/2;
    for (int i=0; i< cant; i++) {
      creaPuntos(tam*i, tam*i);
    }
  }



  void dibuja()
  {

    pushMatrix();
    // translate(100, 100);
    evaluaDistancia( 100, 100);

    comportamiento();
    dibujaPuntos();
    popMatrix();

    println(puntos.size()+"___"+disty.size());
  }

  void creaPuntos(float puntoA_, float puntoB_)
  {
    PVector vect = new PVector(puntoA_, puntoB_);
    puntos.add(vect);
    disty.append(0);
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

  void evaluaDistancia(float tx_, float ty_)
  {
    userX=mouseX;
    userY=mouseY;
    for (int i=0; i< puntos.size(); i++) {
      //disty= dist(mouseX, mouseY, puntos.get(i).x,puntos.get(i).y);

      disty.set(i, dist(userX, userY, puntos.get(i).x, puntos.get(i).y));
    }

    println(disty.get(0));
  }

  void comportamiento()
  {

    for (int i=0; i< puntos.size(); i++) 
    {
      if ( i%2==0 )
      {
        puntos.get(i).set(new PVector(pX, pY));
      }
    }
  }

  void mouseDragged()
  {
    for (int i=0; i< puntos.size(); i++) 
    {
      if (disty.get(i)<umbral)
      {
        pX= mouseX;
        pY= mouseY;
      }
      if (disty.get(i)>umbral)
      {

        pX =0;
        pY =0;
      }
    }
  }
}
