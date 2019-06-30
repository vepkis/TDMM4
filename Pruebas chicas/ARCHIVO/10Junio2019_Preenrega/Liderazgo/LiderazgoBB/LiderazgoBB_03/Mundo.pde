class Mundo
{

  Lider l = new Lider ();
  int cantBoli= 5;


  Lider [][]lSeguidores = new Lider[2][5];
  float sumaX, sumaY, comodin;
  int index, cual;

  float movX, movY, velX, velY;

  BolitaReactiva [] bandaUP= new BolitaReactiva[cantBoli];



  Mundo ()

  {
    movX=1;
    movY=1;
    velX=-2;
    velY=1;


    for (int i=0; i <cantBoli; i++)
    {
      bandaUP[i]= new BolitaReactiva();
      lSeguidores[0][i]= new Lider();
      lSeguidores[1][i]= new Lider();
    }

    sumaX=60;// es el valor máximo del tam de bolitaReactiva
    sumaY=-sumaX/2;
    comodin=0;
  }

  void dibuja()
  {

    creaLider();
    comportamiento();
    for (int i=0; i <cantBoli; i++)
    {
      bandaUP[i].dibuja();
    }
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
    for (int i=0; i <cantBoli; i++)
    {
      lSeguidores[0][i].setPosXY(l.getPosXY()[0]- sumaX-(i*sumaX), l.getPosXY()[1]+sumaY+(sumaY*i));
      lSeguidores[1][i].setPosXY(l.getPosXY()[0]- sumaX-(i*sumaX), l.getPosXY()[1]-sumaY-(sumaY*i));


      lSeguidores[0][i].creaPunktum();
      lSeguidores[1][i].creaPunktum();
    }
  }


  void comportamiento()

  {

    for (int i=0; i <cantBoli; i++)
    {

      if ( l.getExiste() )
      {
        if (bandaUP[i].getLugar()==false &&  lSeguidores[0][i].getOcupado()==false )
        {
          bandaUP[i].evaluaDistancia(lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);
          if ( bandaUP[i].disty< sumaX*2)    
          {
            bandaUP[i].evaluaAvance(lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);
            if ( bandaUP[i].disty< sumaX/4)    
            {
              bandaUP[i].setLugar(true);
              lSeguidores[0][i].setOcupado(true);
            }
          } else {
            if (bandaUP[i].getPosXY()[0]>=-bandaUP[i].getTam())
            {
              bandaUP[i].setSumaPosXY(velX, 0);
            } 

            if (bandaUP[i].getPosXY()[0]<-bandaUP[i].getTam() )

            {
              bandaUP[i].setPosXY(width+bandaUP[i].getTam(), bandaUP[i].getPosXY()[1]);
            }
          }
        }

        if ( bandaUP[i].getLugar() && lSeguidores[0][i].getOcupado())
        {
          bandaUP[i].evaluaDistancia(lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);

          if ( bandaUP[i].disty> sumaX*6)    
          {    
            bandaUP[i].setLugar(false);
            lSeguidores[0][i].setOcupado(false);
          } else
          {
            bandaUP[i].evaluaLugar(lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);
          }
        }
      } else
      {
        if (bandaUP[i].getPosXY()[0]>=-bandaUP[i].getTam())
        {

          bandaUP[i].setSumaPosXY(velX, 0);
        } 

        if (bandaUP[i].getPosXY()[0]<-bandaUP[i].getTam() )

        {
          bandaUP[i].setPosXY(width+bandaUP[i].getTam(), bandaUP[i].getPPosXY()[1]);
        }
      }

      print("[ "+lSeguidores[0][i].getOcupado()+" ]");
      println("__"+"[ "+lSeguidores[1][i].getOcupado()+" ]");
    }
    println("________"+ cantBoli);
    //  bandaMovimiento();
  }

  void bandaMovimiento()
  {
    for (int i=0; i <cantBoli; i++)
    {


      if (bandaUP[i].getPosXY()[0]>=-bandaUP[i].getTam())
      {
        bandaUP[i].setSumaPosXY(velX, 0);
      } 

      if (bandaUP[i].getPosXY()[0]<-bandaUP[i].getTam() )

      {
        bandaUP[i].setPosXY(width+bandaUP[i].getTam(), bandaUP[i].getPPosXY()[1]);
      }
    }
  }

  void mousePressed ()
  {
    l.mousePressed ();
    for (int i=0; i <cantBoli; i++)
    {
      lSeguidores[0][i].mousePressed();
      lSeguidores[1][i].mousePressed();
    }
  }

  void mouseReleased ()
  {
    l.mouseReleased ();
    for (int i=0; i <cantBoli; i++)
    {
      bandaUP[i].mouseReleased();
      lSeguidores[0][i].mouseReleased();
      lSeguidores[1][i].mouseReleased();
    }
  }

  void keyPressed ()

  {
    if (key=='p')
    {
      if (cual<cantBoli)
      {
        cual++;
      }
      if (cual==cantBoli)
      {
        cual=0;
      }
    }
    println("_____________"+cual);
    //
  }
}//cierra class Mundo
