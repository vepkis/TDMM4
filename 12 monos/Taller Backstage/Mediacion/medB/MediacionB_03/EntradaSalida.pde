class EntradaSalida
{
  float iniX, iniY, finX, finY, tamX, tamY;

  EntradaSalida(float cantW_, float cantH_)
  {

    tamX=width/cantW_;
    tamY=height/cantH_;

    iniX=0;
    iniY=0;
    finX=width-tamX;
    finY=height-tamY;
  }

  EntradaSalida(float sizeW_, float sizeH_, float cantW_, float cantH_)
  {

    float tamX=sizeW_/cantW_;
    float tamY=sizeH_/cantH_;

    iniX=0;
    iniY=0;
    finX=width-tamX;
    finY=height-tamY;
  }

  void dibuja()

  {
    dibujaEntrada();
    dibujaSalida();
  }


  void dibujaEntrada()
  {
    rect(iniX, iniY, tamX, tamY);
  }

  void dibujaSalida()
  {
    rect(finX, finY, tamX, tamY);
  }


  void setiniXY (float iniX_, float iniY_)
  {
    iniX= iniX_;
    iniY= iniY_;
  }

  void setfinXY (float finX_, float finY_)
  {
    finX= finX_;
    finY= finY_;
  }


  float [] getTamXY()
  {
    float [] tamXY= new float[]{tamX, tamY};

    return tamXY;
  }


  float [] getLimitesEntrada()
  {
    float [] limIni= new float[]{iniX, iniY, iniX+tamX, iniX+tamY};

    return  limIni;
  }


  float [] getLimitesSalida()
  {
    float [] limFin= new float[]{finX, finY, width, height};

    return  limFin;
  }

  float [] [] getLimites()
  {
    float [] limIni= new float[]{iniX, iniY, iniX+tamX, iniX+tamY};
    float [] limFin= new float[]{finX, finY, width, height};

    float [][] limites= new float [][]{(limIni), (limFin)};
    return  limites;
  }
}//cierra clase EntradaSalida
