class Mundo
{

  int cant= 24;
  Cardumen [] card= new Cardumen[cant];
  int tam, cual;


  float cambiaTam;
  boolean accionaTam= false;





  Mundo()
  {
    tam=80;

    for (int i=0; i<cant; i++)
    {
      card[i] = new Cardumen (4, random(tam*2, width-(tam*2)), random(tam*2, height-(tam*2)), tam);
      // ellipse.add= new float [][];
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
  }

  void accionaRota()
  {
  }

  void DistyColonias()//esto no funciona... hay que modificarlo
  {
    float [] distyCol= new float [cant];

    for (int i=0; i<card.length; i++)
    {
      distyCol [i]= dist ( card[cual].getZeroXY()[0], card[cual].getZeroXY()[1], card[i].getZeroXY()[0], card[i].getZeroXY()[1]);

      if (distyCol [i]< 100)
      {
        card[i].hayMovimiento=! card[i].hayMovimiento;
      }
    }
  }

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
