void setup ()

{
  size(400, 400);
}

void draw ()

{
  //noFill();
  noFill();
  stroke(255, 102, 0);
  line(30, 20, 80, 5);
  line(80, 75, 30, 75);
  stroke(0, 0, 0);
  bezier(200, 0, 400, 0, 400, 0, 400, 200);
  bezier(400, 200, 400, 400, 400, 400, 200, 400);
  bezier(200, 200, 0, 400, 0, 0, 0, 200);
  bezier(200, 0, 0, 0, 400, 0, 200, 0);
}
