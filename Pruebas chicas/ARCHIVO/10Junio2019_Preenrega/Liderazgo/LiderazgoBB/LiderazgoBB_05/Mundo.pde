class Mundo
{

  Lider l = new Lider ();
  int cantBoli= 5;


  Lider [][]lSeguidores = new Lider[2][5];
  float sumaX, sumaY, comodin;
  int index, cual;

  float movX, movY, velX, velY;

  BolitaReactiva [] bandaUP= new BolitaReactiva[cantBoli];
  BolitaReactiva [] bSeguidores= new BolitaReactiva[cantBoli];


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



      lSeguidores[0][i]= new Lider();
      lSeguidores[1][i]= new Lider();
      bSeguidores[i]= new BolitaReactiva();
      bSeguidores[i].setVel(2*cantBoli-i*2);
      bSeguidores[i].setTam(5);
      bSeguidores [i].setAlpha(100);
      bSeguidores[i].setUmbral( sumaX+(i*sumaX));
    }
  }

  void dibuja()
  {

    creaLider();
    comportamiento();
    compPrincipal();

    for (int i=0; i <cantBoli; i++)
    {
      bSeguidores[i].dibuja();
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

      //   bSeguidores[i].setPosXY(l.getPosXY()[0]- sumaX-(i*sumaX), l.getPosXY()[1]-sumaY-(sumaY*i));
      //  


      lSeguidores[0][i].creaPunktum(); 
      lSeguidores[1][i].creaPunktum();
    }
  }


  void compPrincipal()
  {    
    for (int i=0; i <cantBoli; i++)
    {
      bSeguidores[i].evaluaDistancia( lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);

      if (      bSeguidores[i].getDisty()>      bSeguidores[i].getUmbral())
      {      
        bSeguidores[i].evaluaAvance(lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);
      }
      //   println(i+"___"+bSeguidores[i].getUmbral()+"____________"+bSeguidores[i].getDisty());
    }
  }



  void comportamiento()

  {

    for (int i=0; i <cantBoli; i++)
    {

      if ( l.getExiste() )
      {
        if (bandaUP[i].getLugar()==false &&  bSeguidores[i].getOcupado()==false )
        {
          bandaUP[i].evaluaDistancia(bSeguidores[i].getPosXY()[0], bSeguidores[i].getPosXY()[1]);
          if ( bandaUP[i].disty< sumaX*7)    
          {
            bandaUP[i].evaluaAvance(bSeguidores[i].getPosXY()[0], bSeguidores[i].getPosXY()[1]);
            if ( bandaUP[i].disty< sumaX)    
            {
              bandaUP[i].setLugar(true);
              bSeguidores[i].setOcupado(true);
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

        if ( bandaUP[i].getLugar() && bSeguidores[i].getOcupado())
        {
          bandaUP[i].evaluaDistancia(bSeguidores[i].getPosXY()[0], bSeguidores[i].getPosXY()[1]);

          if ( bandaUP[i].disty> sumaX*11)    
          {    
            bandaUP[i].setLugar(false);
            bSeguidores[i].setOcupado(false);
          } else
          {
            bandaUP[i].evaluaLugar(bSeguidores[i].getPosXY()[0], bSeguidores[i].getPosXY()[1]);
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

      println("[ "+bSeguidores[i].getOcupado()+" ]");
      // println("__"+"[ "+bSeguidores[i].getOcupado()+" ]");
    }
    println("________"+ cantBoli);
    //  bandaMovimiento();
  }




  /*
  
   
   
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
   
   
   
   ///__________NO IRVE
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
   */
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
      lSeguidores[0][i].mouseReleased();
      lSeguidores[1][i].mouseReleased();
      bSeguidores[i].mouseReleased();
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
