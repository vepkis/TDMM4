class LineaQuebrada
{
  float ancho, alto;
  FloatList pX, pY;
  ArrayList <PVector> puntos;
  float tam, largo, cant;
  //ArrayList <Float>disty;
  FloatList disty= new FloatList ();
  FloatList distAcciona= new FloatList ();

  float userX=0, userY=0;
  float umbral;


  LineaQuebrada()
  {
    puntos= new ArrayList <PVector>();
    disty= new FloatList();
    pX= new FloatList ();
    pY= new FloatList ();
    largo= 400;
    cant=10;
    tam=largo/cant;
    umbral=largo/2;


    creaPuntos(0, 0);
    creaPuntos(width/2, 0);
    creaPuntos(width, 0);

    creaPuntos(width, height/2);
    creaPuntos(width, height);

    creaPuntos(width/2, height);
    creaPuntos(0, height);

    creaPuntos(0, height/2);
  }

  LineaQuebrada(float ancho_, float alto_)
  {
    ancho=ancho_;
    alto=alto_;
    puntos= new ArrayList <PVector>();
    disty= new FloatList();
    pX= new FloatList ();
    pY= new FloatList ();
    cant=10;
    tam=ancho_/cant;
    umbral=ancho_/4;//tamaño mínimo que alcanzará


    creaPuntos(0, 0);
    creaPuntos(ancho/2, 0);
    creaPuntos(ancho, 0);

    creaPuntos(ancho, alto/2);
    creaPuntos(ancho, alto);

    creaPuntos(ancho/2, alto);
    creaPuntos(0, alto);

    creaPuntos(0, alto/2);
  }

  void dibuja()
  {

    // translate(100, 100);
    evaluaDistancia();

    //  comportamiento();
    //  pushMatrix();
    //    translate(width/2, height/2);
    comportamientoDos();

    dibujaPuntos();
    //popMatrix();

    //    println(puntos.size()+"___"+disty.size());
  }

  void creaPuntos(float puntoA_, float puntoB_)
  {
    PVector vect = new PVector(puntoA_, puntoB_);
    puntos.add(vect);
    disty.append(0);
    distAcciona.append(0);
    pX.append(puntoA_);
    pY.append(puntoB_);
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

      disty.set(i, dist(userX, userY, pX.get(i), pY.get(i)));
    }

    println(disty.get(0));
  }

  /*  void comportamiento()
   {
   
   for (int i=0; i< puntos.size(); i++) 
   {
   float pX_=puntos.get(i).x+mouseX;
   float pY_= puntos.get(i).y+mouseY;
   
   if ( i%2==0 )
   {
   puntos.get(i).set(new PVector(pX, pY ));
   }
   }
   }
   */

  void comportamientoDos()
  {


    for (int i=0; i< puntos.size(); i++) 
    {
      distAcciona.set(i, dist(pX.get(i), pY.get(i), ancho/2, alto/2));
      if ( i%2==0 && distAcciona.get(i)>umbral && distAcciona.get(i) <ancho )
      {
        puntos.get(i).set(new PVector(pX.get(i), pY.get(i) ));
      }

      if ( i%2!=0 && distAcciona.get(i)>umbral/2 && distAcciona.get(i) <ancho  )
      {

        puntos.get(i).set(new PVector(pX.get(i), pY.get(i) ));
      }
    }


    //   println(distAcciona);
  }


  void mouseMoved()
  {
    for (int i=0; i< puntos.size(); i++) 
    {
      if ( distAcciona.get(i)>umbral)
      {
        pX.set(0, pX.get(0)+random(.1, .4));
        pY.set(0, pY.get(0)+random(.0, .3));

        pX.set(2, pX.get(2)-random(.0, .2));
        pY.set(2, pY.get(2)+random(.1, .4));

        pX.set(4, pX.get(4)-random(.0, .3));
        pY.set(4, pY.get(4)-random(.1, .2));

        pX.set(6, pX.get(6)+random(.0, .4));
        pY.set(6, pY.get(6)-random(.1, .3));

        //__    

        pX.set(1, pX.get(1)+random(.1, .4));
        pY.set(1, pY.get(1)+random(.0, .3));

        pX.set(3, pX.get(3)-random(.0, .2));
        pY.set(3, pY.get(3)+random(.1, .4));

        pX.set(5, pX.get(5)-random(.0, .3));
        pY.set(5, pY.get(5)-random(.1, .2));

        pX.set(7, pX.get(7)+random(.0, .4));
        pY.set(7, pY.get(7)-random(.1, .3));
      }
    }
  }
}
