class Punktum
{
  float posX, posY, tam, umbral;
  color c= color(RGB);
  boolean existe= false;

  float crono;

  Punktum ()
  {
    posX=width/2;
    posY=height/2;
    tam=8;
    umbral=3;
    c=color(255, 100, 5);
  }

  void dibuja()
  {
  }

  void creaPunktum()
  {
    if (existe)
    {
      fill(c);
      ellipse(posX, posY, tam+50, tam+50);
      //     tiempoVida();
    }

    //    println("tiempo tiempo____"+tiempoVida());
  }

  float tiempoVida()
  {

    if (frameCount%60 == 0)
    {
      crono+=1;
    }

    if (crono==umbral)
    {
      crono=0;
      setExiste(false);
    }

    return crono;
  }


  void setColor (float r_, float g_, float b_, float a_)
  {
    c= color(r_, g_, b_, a_);
  }
  void setPosicion(float posX_, float posY_)
  {
    posX=posX_;
    posY=posY_;
  }

  void setTam(float tam_)
  {
    tam= tam_;
  }

  void setExiste(boolean existe_)
  {
    existe=existe_;
  }

  boolean getExiste()
  {
    return existe;
  }

  float [] getPosXY()
  {
    float [] posXY= new float [] {posX, posY};
    return posXY;
  }
}//cierra clase Punktum
