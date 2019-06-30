class Remoras 
{

  float tx, ty, tz, vel, px, py, tam, angulo, movSin;
  float tComodin=5;
  float tope=20;

  ArrayList primitivos= new ArrayList();
  color farbe=RGB;
  float alpha;

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
  }


  void dibuja()

  {
    pushMatrix();
    translate(tx, ty);
    rotate(radians(angulo+vel));
    fill(farbe, alpha);
    ellipse(px, py+movSin, tam, tam);
    popMatrix();
  }

  void setMovimiento()
  {

    if (tx<width)
    {
      tx+=0.3;
    } else
    {
      tx=0;
    }
    movSin+=tComodin;

    if (movSin==tope || movSin==-tope)
    {
      tComodin*=-0.5;
    }
  }

  void setVel(float vel_)
  {
    vel= vel_;
  }

  void setPX(float px_)
  {
    px=px_;
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

  float getPX()
  {
    return px;
  }

  float [] getTxTy()
  {
    float [] txy= {tx, ty};
    return txy;
  }

  float [] getTP()
  {
    float [] tp= {(tx+px), (ty+py)};
    return tp;
  }

  float getTam()
  {
    return tam;
  }
}//cierra class Remoras
