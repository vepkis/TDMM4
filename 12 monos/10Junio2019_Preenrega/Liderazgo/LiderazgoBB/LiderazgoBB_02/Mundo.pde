class Mundo
{

  BolitaReactiva b= new BolitaReactiva();


  Lider l = new Lider ();
  int cantBoli= 5;


  Lider [][]lSeguidores = new Lider[2][5];
  float sumaX, sumaY, comodin;
  int index, cual;

  float movX, movY, velX, velY;

  BolitaReactiva [] banda= new BolitaReactiva[cantBoli];



  Mundo ()

  {
    movX=1;
    movY=1;
    velX=-2;
    velY=1;


    for (int i=0; i <cantBoli; i++)
    {
      banda[i]= new BolitaReactiva();
      lSeguidores[0][i]= new Lider();
      lSeguidores[1][i]= new Lider();
    }

    sumaX=80;// es el valor máximo del tam de bolitaReactiva
    sumaY=-sumaX/2;
    comodin=0;
  }

  void dibuja()
  {

    creaLider();
    comportamiento();
    for (int i=0; i <cantBoli; i++)
    {
      banda[i].dibuja();
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
        if (banda[i].getLugar()==false &&  lSeguidores[0][i].getOcupado()==false )
        {
          banda[i].evaluaDistancia(lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);
          if ( banda[i].disty< sumaX*2)    
          {
            banda[i].evaluaAvance(lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);
            if ( banda[i].disty< sumaX/4)    
            {
              banda[i].setLugar(true);
              lSeguidores[0][i].setOcupado(true);
            }
          } else {
            if (banda[i].getPosXY()[0]>=-banda[i].getTam())
            {
              banda[i].setSumaPosXY(velX, 0);
            } 

            if (banda[i].getPosXY()[0]<-banda[i].getTam() )

            {
              banda[i].setPosXY(width+banda[i].getTam(), banda[i].getPosXY()[1]);
            }
          }
        }

        if ( banda[i].getLugar() && lSeguidores[0][i].getOcupado())
        {
          banda[i].evaluaDistancia(lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);

          if ( banda[i].disty> sumaX*6)    
          {    
            banda[i].setLugar(false);
            lSeguidores[0][i].setOcupado(false);
          } else
          {
            banda[i].evaluaLugar(lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);
          }
        }
      } else
      {
        if (banda[i].getPosXY()[0]>=-banda[i].getTam())
        {
          banda[i].setSumaPosXY(velX, 0);
        } 

        if (banda[i].getPosXY()[0]<-banda[i].getTam() )

        {
          banda[i].setPosXY(width+banda[i].getTam(), banda[i].getPosXY()[1]);
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

      if (banda[i].getPosXY()[0]>=-banda[i].getTam())
      {
        banda[i].setSumaPosXY(velX, 0);
      } 

      if (banda[i].getPosXY()[0]<-banda[i].getTam() )

      {
        banda[i].setPosXY(width+banda[i].getTam(), banda[i].getPosXY()[1]);
      }
    }
  }

  /*
  void comportamientoTres()
   {
   for (int i=0; i <cantBoli; i++)
   {
   banda[i].evaluaDistancia(lSeguidores[0][cual].getPosXY()[0], lSeguidores[0][cual].getPosXY()[1]);
   
   if ( l.getExiste() && banda[i].getDisty()<banda[i].getTam()*4 && banda[i].getLugar()==true)
   {
   banda[i].evaluaAvance(lSeguidores[0][cual].getPosXY()[0], lSeguidores[0][cual].getPosXY()[1]);
   } else
   {
   banda[i].setLugar(false);
   
   if (banda[i].getPosXY()[0]>=-banda[i].getTam())
   {
   banda[i].setSumaPosXY(velX, 0);
   } 
   
   if (banda[i].getPosXY()[0]<-banda[i].getTam() )
   
   {
   banda[i].setPosXY(width+banda[i].getTam(), banda[i].getPosXY()[1]);
   }
   
   //  comportamientoArreglado();
   }
   }
   
   muestraAcopleCompleja();
   }
   
   void muestraAcopleCompleja()
   
   {
   for (int i=0; i <cantBoli; i++)
   {
   for (int k=0; k <cantBoli/2; k++)
   {
   if (lSeguidores[0][cual].getOcupado()==false)
   {
   if (banda[i].getDisty()<banda[i].getUmbral())
   {
   lSeguidores[0][cual].setOcupado(true);
   banda[i].setLugar(true);
   }
   }
   
   if ( lSeguidores[0][cual].getOcupado()==true && cual < cantBoli/2)
   {
   
   //switch (index) {
   //case 0: 
   //index=1;
   //break;
   //case 1:
   //index=0;
   //break;
   //}
   
   if (cual<cantBoli/2)
   {
   cual++;
   }
   if (cual==cantBoli/2)
   {
   
   cual=0;
   }
   }
   print("[ "+lSeguidores[0][k].getOcupado()+" ]");
   println("__"+"[ "+lSeguidores[1][k].getOcupado()+" ]");
   }
   println("________"+ cantBoli);
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
    }
  }

  void mouseReleased ()
  {
    l.mouseReleased ();
    for (int i=0; i <cantBoli; i++)
    {
      banda[i].mouseReleased();
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
