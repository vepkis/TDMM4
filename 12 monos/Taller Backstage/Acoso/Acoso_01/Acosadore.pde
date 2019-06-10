class Acosadore
{
  int valor;
  Acosadore()
  {
    valor=50;
  }

  void dibuja()

  {
    transladaCorte(width/2, height/2);
  }

  void creaCorteBasico()
  {
    beginShape();
    vertex(-valor, -valor);
    vertex(valor, -valor);
    vertex(valor, valor);
    vertex(-valor, valor);
    vertex(-valor, -valor);
    endShape();
  }

  void transladaCorte(float tx, float ty)
  {
    pushMatrix();
    translate(tx, ty);
    creaCorteBasico();
    popMatrix();
  }
}//cierra class Acosadore
