class Espacio
{


  color farbe= color(200, 60, 0, 255);

  float zrPosX, zrPosY, zrTamAncho, zrTamAlto, zpPosX, zpPosY, zpTamAncho, zpTamAlto;
  float zrAlpha, zpAlpha;
  color zrFarbe= RGB, zpFarbe= RGB;



  Espacio()

  {
    zrFarbe= color(255, 255, 255);
    zrAlpha=10;
    zpFarbe= color(240, 240, 240);
    zpAlpha=255;

    zrPosX=0;
    zrPosY=0;
    zrTamAncho=(width/3)-m.nar.getTam()+10;
    zrTamAlto= height;

    zpPosX=(width/3)-m.nar.getTam()+10;
    zpPosY=0;
    zpTamAncho=width;
    zpTamAlto=height;
  }

  Espacio(float zrPosX_, float zrPosY_, float zrTamAncho_, float zrTamAlto_, float zpPosX_, float zpPosY_, float zpTamAncho_, float zpTamAlto_)

  {
    zrFarbe= color(255, 255, 255);
    zrAlpha=10;
    zpFarbe= color(240, 240, 240);
    zpAlpha=255;

    zrPosX=zrPosX_;
    zrPosY=zrPosY_;
    zrTamAncho=zrTamAncho_;
    zrTamAlto= zrTamAlto_;

    zpPosX=zpPosX_;
    zpPosY=zpPosY_;
    zpTamAncho=zpTamAncho_;
    zpTamAlto=zpTamAlto_;
  }


  void dibuja()

  {
    fill(zrFarbe, zrAlpha);
    rect(zrPosX, zrPosY, zrTamAncho, zrTamAlto);

    fill(zpFarbe, zpAlpha);
    rect(zpPosX, zpPosY, zpTamAncho, zpTamAlto);
  }



  void zonaReflejo()

  {
    fill(zrFarbe, zrAlpha);
    rect(zrPosX, zrPosY, zrTamAncho, zrTamAlto);
  }


  void zonaPelotita()
  {
    fill(zpFarbe, zpAlpha);
    rect(zpPosX, zpPosY, zpTamAncho, zpTamAlto);
  }

  void setZrPosXY(float zrPosX_, float zrPosY_)
  {
    zrPosX= zrPosX_;
    zrPosY= zrPosY_;
  }

  void setZpPosXY(float zpPosX_, float zpPosY_)
  {
    zpPosX= zpPosX_;
    zpPosY= zpPosY_;
  }

  void setZrTamAA(float zrTamAncho_, float zrTamAlto_)
  {
    zrTamAncho= zrTamAncho_;
    zrTamAlto= zrTamAlto_;
  }

  void setZpTamAA(float zpTamAncho_, float zpTamAlto_)
  {
    zpTamAncho= zpTamAncho_;
    zpTamAlto= zpTamAlto_;
  }

  void setZrFarbe(color zrFarbe_)
  {
    zrFarbe= zrFarbe_;
  }

  void setZpFarbe(color zpFarbe_)
  {
    zpFarbe= zpFarbe_;
  }


  void setZrAlpha(float zrAlpha_)
  {
    zrAlpha= zrAlpha_;
  }

  void setZpAlpha(float zpAlpha_)
  {
    zpAlpha= zpAlpha_;
  }
}// cierra class Espacio
