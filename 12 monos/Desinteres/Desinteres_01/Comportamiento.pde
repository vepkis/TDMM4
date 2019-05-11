class Comportamiento
{


  BolitaReactiva [] bolitas= new BolitaReactiva[20];
  Comportamiento()
  {
    for (int i=0; i< bolitas.length; i++)
    {
      bolitas[i]= new BolitaReactiva();
    }
  }


  void dibuja()

  {
    for (int i=0; i< bolitas.length; i++)
    {
      bolitas[i].dibuja();
    }

    if (mousePressed)
    {
      //boli.evaluaDistancia(mouseX, mouseY);
      for (int i=0; i< bolitas.length; i++)
      {
        bolitas[i].evaluaDistancia(mouseX, mouseY);
      }
    }
  }
  
  
  
  
  
  
}//cierra clase Comportamiento
