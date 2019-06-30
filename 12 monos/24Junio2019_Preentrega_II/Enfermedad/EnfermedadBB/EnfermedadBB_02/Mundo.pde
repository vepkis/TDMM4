class Mundo
{

  int cant= 20;
  Cardumen [] card= new Cardumen[cant];
  float []posX= new float [cant];
  float []posY= new float [cant];

  int tam;
  int cual;


  float cambiaTam;
  boolean accionaTam= false;





  Mundo()
  {
    tam=50;
    for (int i=0; i<cant; i++)
    {
      posX[i]=random(tam*2, width-(tam*2));
      posY[i]=random(tam*2, height-(tam*2));
    }
    for (int i=0; i<cant; i++)
    {
      card[i] = new Cardumen (4, posX[i], posY[i], tam);
      //  card[i].setTxTy();
    }
  }

  void dibuja()
  {

    for (int i=0; i<card.length; i++)
    {
      card[i].dibuja();
    }
  //  textSize(40);
   // text(cual, width/2, 100);

    distyColonias();
  }

  void accionaRota()
  {
  }

  void distyColonias()
  {
    float [] distyCol= new float [cant];

    for (int i=0; i<card.length; i++)
    {
      for (int j=0; j<card.length; j++)
      {
        for (int h=0; h<4; h++)
        {
          if (i!=j)
          {
            distyCol [j]= dist ( card[j].getZeroCantXY()[h][0], card[j].getZeroCantXY()[h][1], card[i].getZeroCantXY()[h][0], card[i].getZeroCantXY()[h][1]);

            if (distyCol [j]< 100   && card[j].getHayMovimiento())
            {
              card[i].setHayMovimiento(true);
            }
          }
        }
        //  println(cual+ "___"+distyCol [1]);
      }
    }
    //    println("");
  }



  /*
  void distyColonias()
   {
   float [] distyCol= new float [cant];
   
   for (int i=0; i<card.length; i++)
   {
   for (int j=0; j<card.length; j++)
   {
   if (i!=j)
   {
   distyCol [j]= dist ( card[j].getZeroXY()[0], card[j].getZeroXY()[1], card[i].getZeroXY()[0], card[i].getZeroXY()[1]);
   
   if (distyCol [j]< 100   && card[j].getHayMovimiento())
   {
   card[i].setHayMovimiento(true);
   }
   }
   }
   println(cual+ "___"+distyCol [1]);
   }
   println("");
   }
   */

  void mousePressed()

  {
    accionaTam=true;

    for (int i=0; i<card.length; i++)
    {
      card[i].mousePressed();

      if (card[i].hayMovimiento)
      {
        cual=i;
      }
    }

    //  DistyColonias();
  }

  void mouseReleased()
  {
    accionaTam=!accionaTam;
  }
}//cierra clase Mundo
