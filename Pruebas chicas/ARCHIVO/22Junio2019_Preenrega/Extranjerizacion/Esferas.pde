class Esferas {
  Esfera[] esf;
  int cant;
  int i, e=-1;
  color aux; 
  color principal;
  color zona1;
  color zona2;
  color zona3;
  int tam;




  Esferas() { 
    zona1 = color(140, 12, 0);
    zona2 = color(80, 80, 80);
    zona3 = color(1, 153, 150);
    tam =40;
    cant  = 9;
    principal = color (255, 100, 5);


    esf = new Esfera[25];   

    //MOUSE X MOUSE Y PUNTERO)
    esf[2] = new Esfera (50, int (random(width/2-width/3, width/2+width/3)), int (random(65, height/3)), principal);


    esf[1]= new Esfera (50, int (random(width/2-width/3, width/2+width/3)), int (random(65, height/3)), zona1);
    esf[0]= new Esfera (50, int (random(width/2-width/3, width/2+width/3)), int (random(65, height/3)), zona1);
    esf[3]= new Esfera (50, int (random(width/2-width/3, width/2+width/3)), int (random(65, height/3)), zona1);
    esf[4]= new Esfera (50, int (random(width/2-width/3, width/2+width/3)), int (random(65, height/3)), zona1);
    esf[5]= new Esfera (50, int (random(width/2-width/3, width/2+width/3)), int (random(65, height/3)), zona1);
    esf[6]= new Esfera (50, int (random(width/2-width/3, width/2+width/3)), int (random(65, height/3)), zona1);
    esf[7]= new Esfera (50, int (random(width/2-width/3, width/2+width/3)), int (random(65, height/3)), zona1);
    esf[8]= new Esfera (50, int (random(width/2-width/3, width/2+width/3)), int (random(65, height/3)), zona1);
    esf[9]= new Esfera (50, int (random(width/2-width/3, width/2+width/3)), int (random(65, height/3)), zona1);


    
    esf[10]= new Esfera (75 , int (random(tam, width/2-tam*2)), int (random(height/2, height-tam)), zona2);
    esf[11]= new Esfera ( 75, int (random(tam, width/2-tam*2)), int (random(height/2, height-tam)), zona2);
    esf[12]= new Esfera ( 75, int (random(tam, width/2-tam*2)), int (random(height/2, height-tam)), zona2);
    esf[13]= new Esfera ( 75, int (random(tam, width/2-tam*2)), int (random(height/2, height-tam)), zona2);
    esf[14]= new Esfera ( 75, int (random(tam, width/2-tam*2)), int (random(height/2, height-tam)), zona2);
    esf[15]= new Esfera ( 75, int (random(tam, width/2-tam*2)), int (random(height/2, height-tam)), zona2);
    esf[16]= new Esfera ( 75, int (random(tam, width/2-tam*2)), int (random(height/2, height-tam)), zona2);




    esf[17] = new Esfera(65, int (random(width/2 +tam*2, width-tam)), int (random(height/2 +tam, height-tam)), zona3); 
    esf[18] = new Esfera(65, int (random(width/2 +tam*2, width-tam)), int (random(height/2 +tam, height-tam)), zona3);    
    esf[19] = new Esfera(65, int (random(width/2 +tam*2, width-tam)), int (random(height/2 +tam, height-tam)), zona3); 
    esf[20] = new Esfera(65, int (random(width/2 +tam*2, width-tam)), int (random(height/2 +tam, height-tam)), zona3); 
    esf[21] = new Esfera(65, int (random(width/2 +tam*2, width-tam)), int (random(height/2 +tam, height-tam)), zona3); 
    esf[22] = new Esfera(65, int (random(width/2 +tam*2, width-tam)), int (random(height/2 +tam, height-tam)), zona3);    
    esf[23] = new Esfera(65, int (random(width/2 +tam*2, width-tam)), int (random(height/2 +tam, height-tam)), zona3);
  }

  /*

   for (int i=cant*2; i< cant*3-1; i++)
   {
   
   esf[i]= new Esfera ( 35, int (random(width/2-width/3, width/2+width/6)), int (random(height/2)), zona3);
   }
   }
   
   */




  void dibujar() {

    for (i=0; i<24; i++)
      esf[i].dibujar();
  }   



  void mover(int i_, int px_, int py_) {

    esf[i_].mover(px_, py_);
  } 


  int tocar(int i_) {
    int retorno=-1;

    for (i=0; i<24; i++) {
      if (i != i_)
        if (dist(esf[i_].PosX(), esf[i_].PosY(), esf[i].PosX(), esf[i].PosY()) < esf[i_].Radio() + esf[i].Radio()) {
          retorno=i;  
          if (e != i) {
            e=i;

            aux= esf[i].col();
            esf[i].setColor(esf[i_].col());
            esf[i_].setColor(aux);
          }
        }
    }

    return retorno;
  }
}
/*
// IZQUIERDA SUPERIOR
 
 esf[1] = new Esfera(65, int (random (width/2-width/3,width/2+width/3)), height/5, zona1);    
 esf[2] = new Esfera(65, int (random (width/2-width/3,width/2+width/3)), height/5, zona1);
 esf[3] = new Esfera(65, int (random (width/2-width/3,width/2+width/3)), height/5, zona1);    
 esf[4] = new Esfera(65, int (random (width/2-width/3,width/2+width/3)), height/5, zona1);
 esf[5] = new Esfera(65, int (random (width/2-width/3,width/2+width/3)), height/5, zona1);    
 esf[6] = new Esfera(65, int (random (width/2-width/3,width/2+width/3)), height/5, zona1);
 esf[7] = new Esfera(65, int (random (width/2-width/3,width/2+width/3)), height/5, zona1);    
 esf[8] = new Esfera(65, int (random (width/2-width/3,width/2+width/3)), height/5, zona1);
 
 // IZQUIERDA INFERIOR
 esf[9] = new Esfera (75, width/3, height/2+height/4, zona2);   
 esf[10] = new Esfera(75, width/3, height/2+height/4, zona2);
 esf[11] = new Esfera(75, width/3, height/2+height/4, zona2); 
 esf[12] = new Esfera(75, width/3, height/2+height/4, zona2);
 esf[13] = new Esfera(75, width/3, height/2+height/4, zona2); 
 esf[14] = new Esfera(75, width/3, height/2+height/4, zona2);  
 esf[15] = new Esfera(75, width/3, height/2+height/4, zona2); 
 esf[16] = new Esfera(75, width/3, height/2+height/4, zona2); 
 
 
 
 // DERECHA SUPERIOR
 esf[17] = new Esfera(75, width/8, height/2+height/4, zona2); 
 esf[18] = new Esfera(70, width/8 + width/3, height/5, zona3);    
 esf[19] = new Esfera(70, width/8+ width/4, height/5, zona3);
 esf[20] = new Esfera(80, width/8 + width/5, height/2+height/4, zona3);   
 esf[21] = new Esfera(80, width/8 + width/3, height/2+height/4, zona3);
 esf[22] = new Esfera(70, width/8 + width/3, height/5, zona3);    
 esf[23] = new Esfera(70, width/8+ width/4, height/5, zona3);
 }
 
     
    for (int i=1; i< cant; i++)
     {
     
     esf[i]= new Esfera (50, int (random(width/2-width/3, width/2+width/3)), int (random(65, height/3)), zona1);
     }  
     
     
     for (int i=cant; i< cant*2; i++)
     {
     
     esf[i]= new Esfera ( 35, int (random(tam, width/2)), int (random(height/2, height-tam)), zona2);
     }
     
     
 
 */
