class Mundo
{
  Esferita e, eDoble;
  boolean tocaUser= false;
  Mundo()
  {
    e= new Esferita ();
    eDoble= new Esferita (random(e.getTam()*3, width-e.getTam()*3), random(e.getTam()*3, height-e.getTam()*3), e.getTam()*3, color(20, 20, 20), 255);
    eDoble.setUmbral(e.getTam()*4);
  }


  void dibuja()
  {
    setUserMov();
    eDoble.dibuja();
  }

  void setUserMov()
  {

    if (tocaUser)
    {
      e.setPxy(mouseX, mouseY);

      e.dibuja();
    }


    evaluaAcosador();
    reaparece();
  }

  void evaluaAcosador()
  {

    println(eDoble.disty(e.px, e.py)+"_____"+eDoble.getUmbral());

    if (eDoble.disty(e.px, e.py)< eDoble.getTam())
    {
      eDoble.evaluaAvance(e.px, e.py);
    }
  }

  void reaparece()
  {

    if ((eDoble.getPxy()[0] > width+eDoble.getTam()/2 || eDoble.getPxy()[0] < -eDoble.getTam()/2) || ( eDoble.getPxy()[1] > height+eDoble.getTam()/2 || eDoble.getPxy()[1] < -eDoble.getTam()/2))
    {
      eDoble.setPxy(random(e.getTam()*3, width-e.getTam()*3), random(e.getTam()*3, height-e.getTam()*3));
      eDoble.setSumaVel(0.4);
    }
  }



  void mousePressed()
  {

    tocaUser=true;
  }

  void mouseReleased()
  {
    tocaUser=false;
  }
}// cierra class Mundo
