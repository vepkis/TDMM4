class Mundo
{

  Lider l = new Lider ();
  int cantBoli= 5;


  Lider [][]lSeguidores = new Lider[2][5];
  float sumaX, sumaY, comodin;
  int index, cual;

  float movX, movY, velX, velY;

  BolitaReactiva [] bandaUP= new BolitaReactiva[cantBoli];
  BolitaReactiva [] bSeguidoresUP= new BolitaReactiva[cantBoli];

  BolitaReactiva [] bandaDOWN= new BolitaReactiva[cantBoli];
  BolitaReactiva [] bSeguidoresDOWN= new BolitaReactiva[cantBoli];



  Mundo ()

  {
    movX=1;
    movY=1;
    velX=-2;
    velY=1;

    sumaX=20;// es el valor máximo del tam de bolitaReactiva
    sumaY=-sumaX/2;
    comodin=0;

    for (int i=0; i <cantBoli; i++)
    {
      bandaUP[i]= new BolitaReactiva();
      bandaUP[i].setTam(20);
      bandaUP[i].setVel(2*cantBoli-i*2);

      bandaDOWN[i]= new BolitaReactiva();
      bandaDOWN[i].setTam(20);
      bandaDOWN[i].setVel(2*cantBoli-i*2);


      lSeguidores[0][i]= new Lider();
      lSeguidores[1][i]= new Lider();

      //  BolitaReactiva(float vel_, int tam_,float umbral_,float alpha_)
      bSeguidoresUP[i]= new BolitaReactiva(2*cantBoli-i*2, 5, sumaX+(i*sumaX), 100);
      bSeguidoresDOWN[i]= new BolitaReactiva(2*cantBoli-i*2, 5, sumaX+(i*sumaX), 100);
    }
  }

  void dibuja()
  {

    creaLider();
    comportamientoUP();
    comportamientoDOWN();
    compPrincipal();

    for (int i=0; i <cantBoli; i++)
    {
      bSeguidoresUP[i].dibuja();
      bSeguidoresDOWN[i].dibuja();

      bandaUP[i].dibuja();
      bandaDOWN[i].dibuja();
    }
  }

  void creaLider()
  {
    l.setPosXY(mouseX, mouseY);
    l.creaPunktum();
    //  println(l.getExiste());
    formacion();
  }


  void formacion()
  {
    for (int i=0; i <cantBoli; i++)
    {
      lSeguidores[0][i].setPosXY(l.getPosXY()[0]- sumaX-(i*sumaX), l.getPosXY()[1]+sumaY+(sumaY*i));
      lSeguidores[1][i].setPosXY(l.getPosXY()[0]- sumaX-(i*sumaX), l.getPosXY()[1]-sumaY-(sumaY*i));

      //  lSeguidores[0][i].creaPunktum(); 
      // lSeguidores[1][i].creaPunktum();
    }
  }


  void compPrincipal()
  {    
    for (int i=0; i <cantBoli; i++)
    {
      bSeguidoresUP[i].evaluaDistancia( lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);

      if (      bSeguidoresUP[i].getDisty()>      bSeguidoresUP[i].getUmbral())
      {      
        bSeguidoresUP[i].evaluaAvance(lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);
      }

      bSeguidoresDOWN[i].evaluaDistancia( lSeguidores[1][i].getPosXY()[0], lSeguidores[1][i].getPosXY()[1]);

      if (      bSeguidoresDOWN[i].getDisty()>      bSeguidoresDOWN[i].getUmbral())
      {      
        bSeguidoresDOWN[i].evaluaAvance(lSeguidores[1][i].getPosXY()[0], lSeguidores[1][i].getPosXY()[1]);
      }
    }
  }



  void comportamientoUP()

  {

    for (int i=0; i <cantBoli; i++)
    {

      if ( l.getExiste() )
      {
        
        
        
        if (bandaUP[i].getLugar()==false &&  bSeguidoresUP[i].getOcupado()==false )
        {
          bandaUP[i].evaluaDistancia(bSeguidoresUP[i].getPosXY()[0], bSeguidoresUP[i].getPosXY()[1]);
          if ( bandaUP[i].disty< sumaX*7)    
          {
            bandaUP[i].evaluaAvance(bSeguidoresUP[i].getPosXY()[0], bSeguidoresUP[i].getPosXY()[1]);
            if ( bandaUP[i].disty< sumaX)    
            {
              bandaUP[i].setLugar(true);
              bSeguidoresUP[i].setOcupado(true);
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

        if ( bandaUP[i].getLugar() && bSeguidoresUP[i].getOcupado())
        {
          bandaUP[i].evaluaDistancia(bSeguidoresUP[i].getPosXY()[0], bSeguidoresUP[i].getPosXY()[1]);

          if ( bandaUP[i].disty> sumaX*11)    
          {    
            bandaUP[i].setLugar(false);
            bSeguidoresUP[i].setOcupado(false);
          } else
          {
            bandaUP[i].evaluaLugar(bSeguidoresUP[i].getPosXY()[0], bSeguidoresUP[i].getPosXY()[1]);
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

      //  println("[ "+bSeguidoresUP[i].getOcupado()+" ]");
      //   println("__"+"[ "+bSeguidoresUP[i].getVel()+" ]");
    }
    // println("________"+ cantBoli);
    //  bandaMovimiento();
  }


  void comportamientoDOWN()

  {

    for (int i=0; i <cantBoli; i++)
    {

      if ( l.getExiste() )
      {
        if (bandaDOWN[i].getLugar()==false &&  bSeguidoresDOWN[i].getOcupado()==false )
        {
          bandaDOWN[i].evaluaDistancia(bSeguidoresDOWN[i].getPosXY()[0], bSeguidoresDOWN[i].getPosXY()[1]);
          if ( bandaDOWN[i].disty< sumaX*7)    
          {
            bandaDOWN[i].evaluaAvance(bSeguidoresDOWN[i].getPosXY()[0], bSeguidoresDOWN[i].getPosXY()[1]);
            if ( bandaDOWN[i].disty< sumaX)    
            {
              bandaDOWN[i].setLugar(true);
              bSeguidoresDOWN[i].setOcupado(true);
            }
          } else {
            if (bandaDOWN[i].getPosXY()[0]>=-bandaDOWN[i].getTam())
            {
              bandaDOWN[i].setSumaPosXY(velX, 0);
            } 

            if (bandaDOWN[i].getPosXY()[0]<-bandaDOWN[i].getTam() )

            {
              bandaDOWN[i].setPosXY(width+bandaDOWN[i].getTam(), bandaDOWN[i].getPosXY()[1]);
            }
          }
        }

        if ( bandaDOWN[i].getLugar() && bSeguidoresDOWN[i].getOcupado())
        {
          bandaDOWN[i].evaluaDistancia(bSeguidoresDOWN[i].getPosXY()[0], bSeguidoresDOWN[i].getPosXY()[1]);

          if ( bandaDOWN[i].disty> sumaX*11)    
          {    
            bandaDOWN[i].setLugar(false);
            bSeguidoresDOWN[i].setOcupado(false);
          } else
          {
            bandaDOWN[i].evaluaLugar(bSeguidoresDOWN[i].getPosXY()[0], bSeguidoresDOWN[i].getPosXY()[1]);
          }
        }
      } else
      {
        if (bandaDOWN[i].getPosXY()[0]>=-bandaDOWN[i].getTam())
        {

          bandaDOWN[i].setSumaPosXY(velX, 0);
        } 

        if (bandaDOWN[i].getPosXY()[0]<-bandaDOWN[i].getTam() )

        {
          bandaDOWN[i].setPosXY(width+bandaDOWN[i].getTam(), bandaDOWN[i].getPPosXY()[1]);
        }
      }

      //  println("[ "+bSeguidoresUP[i].getOcupado()+" ]");
      println("__"+"[ "+bSeguidoresDOWN[i].getVel()+" ]");
    }
    println("________"+ cantBoli);
    //  bandaMovimiento();
  }


  void mousePressed ()
  {
    l.mousePressed ();
    for (int i=0; i <cantBoli; i++)
    {
      lSeguidores[0][i].mousePressed();
      lSeguidores[1][i].mousePressed();
      //   bSeguidores[i].mousePressed();
    }
  }

  void mouseReleased ()
  {
    l.mouseReleased ();
    for (int i=0; i <cantBoli; i++)
    {
      bandaUP[i].mouseReleased();
      bandaDOWN[i].mouseReleased();

      lSeguidores[0][i].mouseReleased();
      lSeguidores[1][i].mouseReleased();
      bSeguidoresUP[i].mouseReleased();
      bSeguidoresDOWN[i].mouseReleased();
    }
  }


}//cierra class Mundo
