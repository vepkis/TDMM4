class Mundo
{
  Esferita e;//user
  Esferita [] eDoble= new Esferita[24];
  int tamVictim;


  boolean tocaUser= false;
  Mundo()
  {
    e= new Esferita ();

    tamVictim= int(e.getTam()/2);
    for (int i=0; i< eDoble.length; i++)
    {
      eDoble[i]= new Esferita (random(tamVictim, width-tamVictim), random(tamVictim, height-tamVictim), random(tamVictim*3, tamVictim*3.7), 200);
      eDoble[i].setUmbral(tamVictim*6);
      eDoble[i].setVel(8);
    }
  }


  void dibuja()
  {
    setUserMov();
    for (int i=0; i< eDoble.length; i++)
    {
      eDoble[i].dibuja();
    }
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
    for (int i=0; i< eDoble.length; i++)
    {
      //    println(eDoble[i].disty(e.px, e.py)+"_____"+eDoble[i].getUmbral());

      if (eDoble[i].disty(e.px, e.py)< eDoble[i].getTam())
      {
        eDoble[i].evaluaAvance(e.px, e.py);
      }
    }
  }

  void reaparece()
  {

    for (int i=0; i< eDoble.length; i++)
    {
      if ((eDoble[i].getPxy()[0] > width+eDoble[i].getTam()/4 || eDoble[i].getPxy()[0] < -eDoble[i].getTam()/4) || ( eDoble[i].getPxy()[1] > height+eDoble[i].getTam()/4 || eDoble[i].getPxy()[1] < -eDoble[i].getTam()/4))
      {
        eDoble[i].setPxy(random(e.getTam()*3, width-e.getTam()*3), random(e.getTam()*3, height-e.getTam()*3));
        eDoble[i].setSumaVel(4);
      }
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
