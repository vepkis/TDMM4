class Mundo
{

  int cant= 4;
  Cardumen [] card= new Cardumen[cant];
  int tam;

  float giraParticula;

  int cambiaNum;
  float cambiaTam;
  boolean accionaTam= false;





  Mundo()
  {
    tam=20;

    for (int i=0; i<cant; i++)
    {
      card[0] = new Cardumen (4, random(tam*6, width-(tam*6)), random(tam*6, height-(tam*6)), tam);
      card[1] = new Cardumen (4, random(tam*6, width-(tam*6)), random(tam*6, height-(tam*6)), tam);
      card[2] = new Cardumen (4, random(tam*6, width-(tam*6)), random(tam*6, height-(tam*6)), tam);
      card[3] = new Cardumen (4, random(tam*6, width-(tam*6)), random(tam*6, height-(tam*6)), tam);
    }
  }

  void dibuja()
  {
    for (int i=0; i<card.length; i++)
    {
      card[i].dibuja();
    }
  }

  void accionaRota()
  {

    if (giraParticula<360) {
      giraParticula++;
    }
    if (giraParticula==360)
    {
      giraParticula=0;
    }
  }

  /*
  void dibuja()
   {
   
   accionRandom();
   pushStyle();
   //  tint(204, 10, 10, 200);
   // f.dibuja();
   popStyle();
   
   pushStyle();
   blendMode(SCREEN);
   
   tint(204, 10, 10);
   ff[0].dibuja();
   //   blend(ff[0].dibuja(), 0, width, height, 0, 0, width/2, height/2, LIGHTEST);
   popStyle();
   println(accionaTam);
   }
   */
  void accionRandom()
  {
  }


  /*
  void accionRandom()
   {
   if (accionaTam)
   {
   if (cambiaNum < f.getFiguritaSize()-1)
   {
   cambiaNum++;
   } else
   {
   cambiaNum=0;
   }
   
   f.setNum(cambiaNum);
   }
   }
   */

  void mousePressed()

  {
    accionaTam=true;
    card[0].mousePressed();
  }

  void mouseReleased()
  {
    accionaTam=!accionaTam;
  }
}//cierra clase Mundo
