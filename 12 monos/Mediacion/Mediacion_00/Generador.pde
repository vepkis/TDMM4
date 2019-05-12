class Generador
{
  float nx, ny, ntam;

  float posX, posY, tam, pPosX, pPosY;
  float angulo, anguloRegreso;
  float vel, disty, distyRegreso, dir, umbral;


  Generador()
  {
    ntam= 100;
    nx= width-ntam/2;
    ny= height-ntam/2;
  }
  Generador(float nx_, float ny_, float ntam_)
  {
    ntam=ntam_;
    nx= nx_;
    ny= ny_;
  }


  void dibuja()
  {
  }


  void creaNucleo()
  { 

    ellipse(nx, ny, ntam, ntam);
    ellipse(nx, ny, ntam/3, ntam/3);
  }
}// termina la clase Generador
