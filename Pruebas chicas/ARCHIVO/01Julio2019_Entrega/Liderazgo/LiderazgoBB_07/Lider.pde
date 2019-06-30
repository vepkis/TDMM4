class Lider
{ 
  float posX, posY, tam, umbral;
  color c= color(RGB);
  boolean existe= false;

  Lider ()
  {
    posX=width/2;
    posY=height/2;
    tam=40;
    umbral=4;//umbral de tiempo
    //   c=color(200, 5, 5);
    c=color(255, 100, 0);
  }

  void dibuja()
  {
  }

  void creaPunktum()
  {
    if (existe)
    {

      fill(c, 20);
      ellipse(posX, posY, tam*4, tam*4);

      fill(c);
      ellipse(posX, posY, tam, tam);
      //    tiempoVida();
    }
  }



  void setColor (float r_, float g_, float b_, float a_)
  {
    c= color(r_, g_, b_, a_);
  }
  void setPosXY(float posX_, float posY_)
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


  void mousePressed ()

  {
    existe= true;
  }

  void mouseReleased ()
  {
    existe= false;
  }
}//cierra cass Lider
