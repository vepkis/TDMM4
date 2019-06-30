class Flipeador 
{
  float px, py, tamX, tamY, userX, userY;
  color farbe=RGB;
  float alphin;
  int sumaAlpha=0;

  int cant;
  boolean cambia=false;

  Flipeador ()
  {
    px=0;
    py=0;
    tamX=100;
    tamY=100;
    farbe=color (30, 30, 30);
  }

  Flipeador (float px_, float py_, float tamX_, float tamY_)
  {
    px=px_;
    py=py_;
    tamX=tamX_;
    tamY=tamY_;
  } 

  void dibuja ()


  {
    setAlpha();
    pushStyle();
    fill(farbe, alphin);
    //   stroke(255, 100, 0);
    rect(px, py, tamX, tamY);
    popStyle();
    //  println(cambia+"========================"+alphin);
  }



  void setPosTam(float px_, float py_, float tamX_, float tamY_)
  {
    px=px_;
    py=py_;
    tamX=tamX_;
    tamY=tamY_;
  }

  void setUserXY(float userX_, float userY_)

  {
    userX= userX_;
    userY= userY_;
  }


  void accionaLimites()
  {
    if (userX>px && userX<px+tamX && userY>py && userY<py+tamY)
    {    
      if (mousePressed)
      {
        cambia= !cambia;
      }  
      setColor();
    }
  }

  void setColor()
  {




    if (cambia)
    {
      farbe=color (238);
      alphin=0;
    } else
    {
      farbe=color (30, 30, 30);
      alphin=0;
    }
  }
  void setAlpha()
  {
    if (alphin<10 && (millis()*1000)%2==0)
    {
      alphin+=0.3;
    }

    if (alphin<100 && (millis()*1000)%2==0 && cambia==false)
    {
      alphin+=0.2;
    }
  }
  void setCambia(boolean cambia_)
  {

    cambia=cambia_;
    setColor();
  }
  float [] getLimites()
  {
    float [] lim= new float[]{px, py, px+tamX, py+tamY};
    return  lim;
  }
  boolean getCambia()
  {
    return cambia;
  }

  void mousePressed()
  {

    accionaLimites();
  }
}
