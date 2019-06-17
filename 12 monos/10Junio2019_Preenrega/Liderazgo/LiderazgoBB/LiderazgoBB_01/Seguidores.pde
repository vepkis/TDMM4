class Seguidores
{

  float px, py, disty;
  boolean ocupado= false;

  void Seguidores()

  {
    //
  }

  void Seguidores(float px_, float py_, boolean ocupado_)

  {
    px=px_;
    py=py_;
    ocupado=ocupado_;
  }

  void visualizar()
  {
    pushStyle();
    ellipse(px, py, 10, 10);
    popStyle();
  }
  void evaDisty(float otherX_, float otherY_)
  {
    disty= dist(px, py, otherX_, otherY_);
  }

  void evaluaOcupacion(float umbral)
  {
    ocupado= (disty<umbral?true:false);
  }

  boolean getOcupado()
  {
    return ocupado;
  }
}//cierra class Seguidores
