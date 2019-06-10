class Flipeador 
{
  float px, py, tamX, tamY, userX, userY;
  color farbe=RGB;
  int cant;
  boolean cambia=false;

  Flipeador ()
  {
    px=0;
    py=0;
    tamX=100;
    tamY=100;
    farbe=0;
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

    fill(farbe);
    rect(px, py, tamX, tamY);
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
      farbe=255;
    } else
    {
      farbe=0;
    }
  }


  void mousePressed()
  {

    accionaLimites();
  }
}
