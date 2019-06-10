Esferas p1;


int tam1;
int tam2;
int radio1;
int radio2;


void setup() {

   fullScreen();
  p1 = new Esferas();

  tam1 = 160;
  tam2 = 160;
  radio1 = tam1/2;
  radio2 = tam2/2;
}


void draw () {


  p1.dibujar();
  p1.cambiatamA();
  p1.cambiatamB();
}
