class Mundo
{

  BolitaReactiva b= new BolitaReactiva();
  Lider l = new Lider ();

  float movX, movY, velX, velY;


  Mundo ()

  {
    movX=1;
    movY=1;
    velX=-1;
    velY=1;
  }

  void dibuja()
  {

    comportamientoDos();
    b.dibuja();
    creaLider();
  }

  void creaLider()
  {
    l.setPosXY(mouseX, mouseY);
    l.creaPunktum();
    //  println(l.getExiste());
  }

  void comportamiento()
  {
    if (b.getPosXY()[0]>=-b.getTam())
    {
      b.setSumaPosXY(velX, 0);
    } 

    if (b.getPosXY()[0]<-b.getTam())

    {
      b.setPosXY(width+b.getTam(), b.getPosXY()[1]);
    }

    println(b.getPosXY()[0]);
  }


  void comportamientoDos()
  {
    b.evaluaDistancia(l.getPosXY()[0], l.getPosXY()[1]);
    println(b.getDisty());

    if ( l.getExiste()&& b.getDisty()<b.getTam()*4)
    {

        // b.setUmbral(b.getTam()*2);
        b.evaluaAvance(l.getPosXY()[0], l.getPosXY()[1]);
    } else
    {
      comportamiento();
    }
  }

  void mousePressed ()
  {
    l.mousePressed ();
  }

  void mouseReleased ()
  {
    l.mouseReleased ();
  }
}//cierra class Mundo
