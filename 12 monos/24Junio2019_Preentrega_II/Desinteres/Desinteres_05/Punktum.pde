class Punktum
{
  float posX, posY, tam, umbral;
  color c= color(RGB);
  boolean existe= false;

  float crono;
  float rota=360;
  Punktum ()
  {
    posX=width/2;
    posY=height/2;
    tam=20;
    umbral=4;//umbral de tiempo
    //   c=color(200, 5, 5);
    c=    color(255, 50, 5);
  }

  void dibuja()
  {
  }

  void creaPunktum()
  {
    if (existe)
    {
      fill(c, 200);
      ellipse(posX, posY, tam, tam);
      adornitos();

      tiempoVida();
    }

    //    println("tiempo tiempo____"+tiempoVida());
  }

  void adornitos()
  {

    if (rota>0)
    {
      rota-=20;
    }
    if (rota<=0)
    {
      rota=360;
    }

    pushMatrix(); 
    translate(posX, posY);
    rotate(radians(rota));

    pushMatrix();
    rotate(PI/3);
    ellipse(tam, 0, tam/3, tam/3);
    ellipse(tam-tam/4, tam/3, tam/6, tam/6);

    rotate(PI/2+PI/4);
    ellipse(tam, 0, tam/3, tam/3);
    ellipse(tam-tam/4, tam/3, tam/6, tam/6);

    rotate(PI/2+PI/6);
    ellipse(tam, 0, tam/3, tam/3);
    ellipse(tam-tam/4, tam/3, tam/6, tam/6);

    popMatrix();
    popMatrix();
  }


  float tiempoVida()
  {

    if (frameCount%50 == 0)
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

  void setCrono(float crono_)
  {
    crono=crono_;
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
