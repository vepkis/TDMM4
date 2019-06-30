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
    tam=20;
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
      //   ellipse(posX, posY, tam+50, tam+50);
      arc(posX, posY, tam+30, tam+30, 0, PI-PI/4, PIE);
      arc(posX, posY, tam+30, tam+30, PI, PI+PI/5, PIE);
       arc(posX, posY, tam+30, tam+30, PI+PI/2, PI+PI/2+PI/5, PIE);
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
