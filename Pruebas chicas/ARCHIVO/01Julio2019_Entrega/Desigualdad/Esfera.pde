class Esferas {
  int posXp1, posYp1;
  int posXp2, posYp2;
  color c1;
  color c2;
  color f;
  int umbralmin;


  Esferas () {

    posXp1 = width/2-width/5;
    posYp1 = height/2;
    posXp2 = width/2 + width/5;
    posYp2 = height  /2;
    c1 = color (140, 12, 0);
    c2 = color (1, 153, 150);    
    umbralmin = 50;
  }

  void dibujar () {
    
    noStroke();
    fill (c1);
    ellipse (posXp1, posYp1, tam1, tam1);
    fill (c2);
    ellipse (posXp2, posYp2, tam2, tam2); 
    fill (c__);
    ellipse (width/2-width/3, height/2, tam1,tam1);
    fill (c___);
    ellipse (width/2+width/3, height/2, tam2,tam2); 
    
    
  }

  void cambiatamA() {
    float distanciaCentro = dist (posXp2, posYp2, mouseX, mouseY);
    if (distanciaCentro  <=  radio1 && tam2 > umbralmin) {
      tam1 += 1.3;      
      tam2 -=0.4;
      c_ = color (140, 12, 0,200);
      c__= color (1, 153, 150,200);
     
      
       
    } else {
      c_ = color (238, 100);
     
     
      
      
    }
  }


  void cambiatamB() {
    float distanciaCentro = dist (posXp1, posYp1, mouseX, mouseY);
    if (distanciaCentro  <=  radio2 && tam1 > umbralmin) {
      tam2 += 1.3;
      tam1 -=0.4;
      c_ = color (1, 153, 150,200);
      c___= color (140, 12, 0,200);
    
     
       
    }
  }
}
