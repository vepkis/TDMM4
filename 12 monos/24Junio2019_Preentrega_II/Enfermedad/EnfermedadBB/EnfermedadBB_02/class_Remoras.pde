class Remoras 
{

  float tx, ty, tz, vel, px, py, tam, angulo, movSin;
  float tSuma;
  float tAmplitud=100;

  ArrayList primitivos= new ArrayList();
  color farbe=RGB;
  float alpha;
  boolean inicio= false;



  Remoras ()
  {
    tx=100; 
    ty=100;
    tz=0;
    px=50;
    py=0;
    tam=100;
  }

  Remoras (float tx_, float ty_, float px_, float py_, float tam_, float angulo_, color farbe_, float alpha_)
  {

    tx=tx_; 
    ty=ty_;
    tz=0;
    px= px_;
    py=py_;
    tam=tam_;
    angulo=angulo_;
    farbe= farbe_;
    alpha=alpha_;

    ellipseMode(CENTER);
  }


  void dibuja()

  {
    condicionInicial();
  }


  void condicionInicial()
  {
    if (inicio)
    {

      pushMatrix();
      translate(tx, ty);
      rotate(0);
      fill(farbe, alpha);
      ellipse(0, py, tam, tam);
      popMatrix();
    } else
    {
      pushMatrix();
      translate(tx, ty+movSin);
      rotate(radians(angulo+vel));
      fill(farbe, alpha);
      ellipse(px, py, tam, tam);
      popMatrix();
    }
  }




  void setMovimiento()
  {

    if (tx<width)
    {
      tx+=0.9;
    } else
    {
      tx=0;
    }

    tSuma+=0.6;

    movSin=sin (radians(tSuma))*tAmplitud;
    //ty=movSin;

  //  println(tAmplitud+"________________"+movSin);
  }

  //----------------------------------------v S E T T E R S

  void setInicio(boolean inicio_)
  {
    inicio=inicio_;
  }

  void setVel(float vel_)
  {
    vel= vel_;
  }

  void setPX(float px_)
  {
    px=px_;
  }
  void setPY(float py_)
  {
    py=py_;
  }
  void setMovSin(float movSin_)
  {
    movSin=movSin_;
  }

  void setTam(float tam_)
  {
    tam=tam_;
  }

  void setTxTy(float tx_, float ty_)
  {
    tx=tx_;
    ty=ty_;
  }


  //----------------------------------------v S E T T E R S

  boolean getInicio()
  {
    return inicio;
  }


  float getPX()
  {
    return px;
  }
  float getPY()
  {
    return py;
  }

  float getMovSin()
  {
    return movSin;
  }

  float [] getTxTy()
  {
    float [] txy= {tx, ty+movSin};
    return txy;
  }

  float [] getTP()
  {
    float [] tp= {(tx+px), (ty+py+movSin)};
    return tp;
  }

  float getTam()
  {
    return tam;
  }

  float getAngVel()
  {
    return angulo+vel;
  }
}//cierra class Remorasas
