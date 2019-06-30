class Narciso
{
  float tx, ty, px, py, tam;
  color farbe= RGB;
  float alpha;
  Narciso()
  {
    tam= 40;

    px=width-tam*2;
    py= height/2;
    farbe= color(255, 100, 5);
    alpha=255;
  }

  Narciso(float px_, float py_, float tam_, float alpha_)
  {
    tam= tam_;

    px=px_;
    py= py_;
    farbe= color(255, 100, 5);
    alpha= alpha_;
  }

  void dibuja()
  {
    pushMatrix();
    pushStyle();
    fill(farbe, alpha);
    ellipse(px, py, tam, tam);
    popStyle();
    popMatrix();
  }

  void setPxPy(float px_, float py_)
  {

    px= px_;
    py= py_;
  }

  void setPx(float px_)
  {

    px=px_;
  }
  void setPy(float py_)
  {

    py=py_;
  }
  void setTxTy(float tx_, float ty_)
  {
    tx=tx_;
    ty=ty_;
  }

  void setTam(float tam_)
  {
    tam=tam_;
  }

  void setFarbe(color farbe_)
  {
    farbe= farbe_;
  }

  void setAlpha(float alpha_)
  {
    alpha= alpha_;
  }


  float getTam()
  {
    return tam;
  }

  float [] getPxPy()
  {
    float [] pxy= new float []{px, py};
    return pxy;
  }

  float getAlpha()
  {
    return alpha;
  }
}//____ cierra class Narciso
