class Mundo
{

  BolitaReactiva b= new BolitaReactiva();
  Lider l = new Lider ();
  int cantBoli= 10;
  Lider [][]lSeguidores = new Lider[2][cantBoli/2];
  float sumaX, sumaY, comodin;

  float movX, movY, velX, velY;


  Mundo ()

  {
    movX=1;
    movY=1;
    velX=-1;
    velY=1;
    for (int i=0; i <cantBoli/2; i++)
    {
      lSeguidores[0][i]= new Lider();
      lSeguidores[1][i]= new Lider();
    }

    sumaX=b.getTam();
    sumaY=-sumaX;
    comodin=0;
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
    //  l.creaPunktum();
    //  println(l.getExiste());
    formacion();
  }


  void formacion()
  {
    for (int i=0; i <cantBoli/2; i++)
    {
      lSeguidores[0][i].setPosXY(l.getPosXY()[0]- sumaX-(i*sumaX), l.getPosXY()[1]+sumaY+(sumaY*i));
      lSeguidores[1][i].setPosXY(l.getPosXY()[0]- sumaX-(i*sumaX), l.getPosXY()[1]-sumaY-(sumaY*i));


      lSeguidores[0][i].creaPunktum();
      lSeguidores[1][i].creaPunktum();
    }
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
      b.evaluaAvance(l.getPosXY()[0], l.getPosXY()[1]);
    } else
    {
      comportamiento();
    }
  }

  void mousePressed ()
  {
    l.mousePressed ();
    for (int i=0; i <cantBoli/2; i++)
    {
      lSeguidores[0][i].mousePressed();
      lSeguidores[1][i].mousePressed();
    }
  }

  void mouseReleased ()
  {
    l.mouseReleased ();
    for (int i=0; i <cantBoli/2; i++)
    {
      lSeguidores[0][i].mouseReleased();
      lSeguidores[1][i].mouseReleased();
    }
  }

  void keyPressed ()

  {
    //
  }
}//cierra class Mundo
