class Comportamiento
{
  int cant=10;

  BolitaReactiva [] bolitas= new BolitaReactiva[cant];
  int [] contComida= new int[cant];
  int topeContComida=6, cual=-8;

  Punktum p= new Punktum ();

  float rotacion=0.5;
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

    if (p.getExiste())
    {
      for (int i=0; i< bolitas.length; i++)
      {
        bolitas[i].evaluaDistancia(p.getPosXY()[0], p.getPosXY()[1]);
        bolitas[i].evaluaAvance(p.getPosXY()[0], p.getPosXY()[1]);
      }

      evalua();
    }



    p.creaPunktum();
  }

  void evalua()
  {
    for (int i=0; i< bolitas.length; i++)
    {
      if (bolitas[i].getDisty()<= bolitas[i].getUmbral() &&  bolitas[i].getDespierta()) {
        bolitas [i].setVel(1);
        bolitas [i].setTamSuma(20);
        p.setExiste(false);
        contComida[i]++;
        println(bolitas [i].getVel()+"___Cual___"+i+"_____contComida_: "+contComida[i]);

        cual=i;
      }

      if (contComida[i]>= topeContComida) {


        bolitas[i].setDespierta(false);
        contComida[i]=0;
      }

      println(i+"==="+bolitas[i].getDespierta());
    }
  }



  void mousePressed()
  {
    p.setPosicion(mouseX, mouseY);
    p.setExiste(true);
  }
}//cierra clase Comportamiento
