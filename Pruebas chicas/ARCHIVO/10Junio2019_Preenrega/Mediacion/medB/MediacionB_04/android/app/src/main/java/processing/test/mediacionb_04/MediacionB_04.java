package processing.test.mediacionb_04;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class MediacionB_04 extends PApplet {

Mundo m;
public void setup()

{
  //size (800, 800); 
  ///---------------------
  
  orientation(LANDSCAPE);
  ///---------------------

  noStroke();
  m= new Mundo(width, height, 3, 2);
  //  background(255);
  background(240);
}


public void draw ()

{


  m.dibuja();

  //  f.setUserXY(mouseX, mouseY);
  //f.dibuja();
}


public void mousePressed()
{
  m.mousePressed();
}


public void keyPressed()

{
  m.keyPressed();
}
class BolitaLoca

{
  float px, py, tam, movX, movY, limWInicial, limWFinal, limHInicial, limHFinal;
  int farbe;
  boolean cambiaPlano;

  BolitaLoca()
  {
    tam=40;
    px= random(width-tam); 
    py= random(height-tam); 
    movX=2;
    movY=movX*2;

    limWInicial=0;
    limWFinal=width;

    limHInicial=0;
    limHFinal= height;
    farbe= color(255, 100, 0, 255);
  }

  BolitaLoca(float limWIni_, float limHIni_, float limWFin_, float limHFin_)
  {
    tam=40;
    limWInicial=limWIni_;
    limWFinal=limWFin_;

    limHInicial=limHIni_;
    limHFinal= limHFin_;

    px= random(limWInicial+tam, limWFinal-tam); 
    py= random(limHInicial+tam, limHFinal-tam); 
    movX=3;
    movY=movX*2;


    farbe= color(255, 100, 0, 255);
  }

  public void dibuja()
  {
    pushStyle();
    fill(farbe);
    ellipse(px, py, tam, tam);
    popStyle();

    //println("_PX___"+px+"___PY____"+py+"_____movY_"+movY);

    //    println("__WInicial__"+limWInicial+"__WFinal__"+limWFinal);
  }


  public void setLimitesNuevos(float limWIni_, float limHIni_, float limWFin_, float limHFin_)
  {
    limWInicial=limWIni_;
    limWFinal=limWFin_;

    limHInicial=limHIni_;
    limHFinal= limHFin_;
  }

  public void comportamiento()

  {
    //   println(tam+"__px__"+px+"__py__"+py);
    if ((px<=limWFinal || px>=limWInicial) && (py <= limHFinal || py>=limHInicial))
    {
      px+=movX;
      py+=movY;
    }
    if (px>limWFinal-tam || px<limWInicial+tam)
    {
      movX*=-1;
    }
    if (py>limHFinal-tam || py<limHInicial+tam)
    {
      movY*=-1;
    }
  }

  public float [] getPosXY()

  {
    float [] pos= new float []{px, py}; 

    return pos;
  }

  public float getTam()
  {
    return tam;
  }
}// cierra clase BolitaLoca
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

  public void dibuja()

  {
    fill(255, 255, 255, 20);
    rect(0, 0, width/2, height);
    rect(width/2, 0, width, height);

    dibujaEntrada();
    dibujaSalida();
  }


  public void dibujaEntrada()
  {
    rect(iniX, iniY, tamX, tamY);
  }

  public void dibujaSalida()
  {
    rect(finX, finY, tamX, tamY);
  }


  public void setiniXY (float iniX_, float iniY_)
  {
    iniX= iniX_;
    iniY= iniY_;
  }

  public void setfinXY (float finX_, float finY_)
  {
    finX= finX_;
    finY= finY_;
  }


  public float [] getTamXY()
  {
    float [] tamXY= new float[]{tamX, tamY};

    return tamXY;
  }


  public float [] getLimitesEntrada()
  {
    float [] limIni= new float[]{iniX, iniY, iniX+tamX, iniX+tamY};

    return  limIni;
  }


  public float [] getLimitesSalida()
  {
    float [] limFin= new float[]{finX, finY, width, height};

    return  limFin;
  }

  public float [] [] getLimites()
  {
    float [] limIni= new float[]{iniX, iniY, iniX+tamX, iniX+tamY};
    float [] limFin= new float[]{finX, finY, width, height};

    float [][] limites= new float [][]{(limIni), (limFin)};
    return  limites;
  }
}//cierra clase EntradaSalida
class Flipeador 
{
  float px, py, tamX, tamY, userX, userY;
  int farbe=RGB;
  float alphin;
  int sumaAlpha=0;

  int cant;
  boolean cambia=false;

  Flipeador ()
  {
    px=0;
    py=0;
    tamX=100;
    tamY=100;
    farbe=color (30, 30, 30);
  }

  Flipeador (float px_, float py_, float tamX_, float tamY_)
  {
    px=px_;
    py=py_;
    tamX=tamX_;
    tamY=tamY_;
  } 

  public void dibuja ()


  {
    setAlpha();
    pushStyle();
    fill(farbe, alphin);
    //   stroke(255, 100, 0);
    rect(px, py, tamX, tamY);
    popStyle();
    //  println(cambia+"========================"+alphin);
  }



  public void setPosTam(float px_, float py_, float tamX_, float tamY_)
  {
    px=px_;
    py=py_;
    tamX=tamX_;
    tamY=tamY_;
  }

  public void setUserXY(float userX_, float userY_)

  {
    userX= userX_;
    userY= userY_;
  }


  public void accionaLimites()
  {
    if (userX>px && userX<px+tamX && userY>py && userY<py+tamY)
    {    
      if (mousePressed)
      {
        cambia= !cambia;
      }  
      setColor();
    }
  }

  public void setColor()
  {




    if (cambia)
    {
      farbe=color (238);
      alphin=0;
    } else
    {
      farbe=color (30, 30, 30);
      alphin=0;
    }
  }
  public void setAlpha()
  {
    if (alphin<10 && (millis()*1000)%2==0)
    {
      alphin+=0.3f;
    }

    if (alphin<100 && (millis()*1000)%2==0 && cambia==false)
    {
      alphin+=0.2f;
    }
  }
  public void setCambia(boolean cambia_)
  {

    cambia=cambia_;
    setColor();
  }
  public float [] getLimites()
  {
    float [] lim= new float[]{px, py, px+tamX, py+tamY};
    return  lim;
  }
  public boolean getCambia()
  {
    return cambia;
  }

  public void mousePressed()
  {

    accionaLimites();
  }
}
class Mundo
{


  Flipeador [] flipper= new Flipeador[2];
  EntradaSalida es;
  BolitaLoca boli;
  BolitaLoca boliDos;
  boolean hayEncuentro;
  String etapas="inicio";

  Mundo()
  {
    for (int i= 0; i< flipper.length; i++)
    {
      flipper[i]= new Flipeador ((width/3), (height/2)*i, width/3, height/2);
    }

    es= new EntradaSalida(width, height, 3, 1);
    boli= new BolitaLoca(0, 0, es.getTamXY()[0], es.getTamXY()[1]);
    //   boliDos= new BolitaLoca(es.getLimites()[0][1], es.getLimites()[0][2], es.getLimites()[0][3], es.getLimites()[0][4]);
  }

  Mundo(float ancho_, float alto_, float cantW_, float cantH_)
  {
    float tamX=ancho_/cantW_;
    float tamY=alto_/cantH_;

    for (int i= 0; i< flipper.length; i++)
    {
      flipper[i]= new Flipeador (tamX, tamY*i, tamX, tamY);
    }

    es= new EntradaSalida(cantW_, cantH_);
    boli= new BolitaLoca(0, 0, tamX, tamY);
    //  boliDos= new BolitaLoca(es.getLimitesSalida()[0], es.getLimitesSalida()[2], es.getLimitesSalida()[1], es.getLimitesSalida()[3]);
    boliDos= new BolitaLoca(es.getLimitesSalida()[0], es.getLimitesSalida()[1], es.getLimitesSalida()[2], es.getLimitesSalida()[3]);

    //    println(""+es.getLimitesSalida()[2]+"_____"+es.getLimitesSalida()[3]);
  }

  public void dibuja()
  {
    for (int i= 0; i< flipper.length; i++)
    {
      flipper[i].setUserXY(mouseX, mouseY);
      flipper[i].dibuja();
    }

    es.dibuja();
    boli.comportamiento();
    boli.dibuja();
    if (hayEncuentro) {
      boliDos.comportamiento();
    }
    boliDos.dibuja();



    recorrido();

    encuentro();
  }

  public void recorrido()
  {

    if (flipper[0].getCambia() && flipper[1].getCambia()==false && etapas=="inicio")
    {
      etapas="iterin_1";
    }

    // reducir el campo de rebote

    if (flipper[0].getCambia() && flipper[1].getCambia()&& etapas=="paso_1")
    {
      etapas="iterin_2";
    }




    if (etapas=="iterin_1" && boli.getPosXY()[0]> flipper[0].getLimites()[0]+(boli.getTam()*2))
    {

      etapas="paso_1";
    }

    if (etapas=="iterin_2" && boli.getPosXY()[1]> flipper[1].getLimites()[1]+(boli.getTam()*2) && boli.getPosXY()[0]>flipper[1].getLimites()[0])
    {
      flipper[0].setCambia(false);
      etapas="paso_2";
    }

    if (etapas=="paso_2" && boli.getPosXY()[1]> es.getLimites()[1][1]+(boli.getTam()*2) && boli.getPosXY()[0]>es.getLimites()[1][0]+(boli.getTam()*2))
    {
      flipper[1].setCambia(false);

      etapas="fin";
    }


    avance();
    //   println(flipper[0].getCambia()+"___etapas___"+etapas);
  }

  public void avance()
  {
    if (etapas=="inicio")
    {
      boli.setLimitesNuevos(es.getLimites()[0][0], es.getLimites()[0][1], es.getLimites()[0][2], es.getLimites()[0][3]);
      //  println(es.getLimites()[0][0]);
    }

    if (etapas=="iterin_1")
    {
      boli.setLimitesNuevos(es.getLimites()[0][0], es.getLimites()[0][1], flipper[0].getLimites()[2], flipper[0].getLimites()[3]);
      // println(flipper[0].getLimites()[3]);
    }    

    if (etapas=="paso_1")
    {
      boli.setLimitesNuevos(flipper[0].getLimites()[0], flipper[0].getLimites()[1], flipper[0].getLimites()[2], flipper[0].getLimites()[3]);
    }

    if (etapas=="iterin_2")
    {
      boli.setLimitesNuevos(flipper[0].getLimites()[0], flipper[0].getLimites()[1], flipper[1].getLimites()[2], flipper[1].getLimites()[3]);
    }  

    if (etapas=="paso_2")
    {
      boli.setLimitesNuevos(flipper[1].getLimites()[0], flipper[1].getLimites()[1], es.getLimites()[1][2], es.getLimites()[1][3]);
    }

    if (etapas=="fin")
    {
      boli.setLimitesNuevos(es.getLimites()[1][0], es.getLimites()[1][1], es.getLimites()[1][2], es.getLimites()[1][3]);
    }
  }

  public void encuentro()
  {

    float disty= dist(boli.getPosXY()[0], boli.getPosXY()[1], boliDos.getPosXY()[0], boliDos.getPosXY()[1]);

    if (disty< boliDos.getTam()*2)
    {
      hayEncuentro=true;
    } 

    //  println(hayEncuentro+"______"+disty);
  }

  public void mousePressed()
  {
    for (int i= 0; i< flipper.length; i++)
    {
      flipper[i].mousePressed();
    }
  }
  public void keyPressed()
  {
    if (key=='e')
    {
      etapas="esperando";
    }
    //  println(key);
  }
}//cierra class Mundo
  public void settings() {  fullScreen(); }
}
