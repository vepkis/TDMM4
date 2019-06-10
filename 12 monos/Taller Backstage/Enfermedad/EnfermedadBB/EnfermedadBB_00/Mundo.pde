class Mundo
{

  int cant= 50;
  Cardumen [] card= new Cardumen[cant];
  int tam;


  float cambiaTam;
  boolean accionaTam= false;





  Mundo()
  {
    tam=40;

    for (int i=0; i<cant; i++)
    {
      card[i] = new Cardumen (4, random(tam*6, width-(tam*6)), random(tam*6, height-(tam*6)), tam);
      // ellipse.add= new float [][];
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
  }




  void mousePressed()

  {
    accionaTam=true;

    for (int i=0; i<card.length; i++)
    {
      card[i].mousePressed();
    }
  }

  void mouseReleased()
  {
    accionaTam=!accionaTam;
  }
}//cierra clase Mundo
