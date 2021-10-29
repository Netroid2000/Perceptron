
Punto[] points = new Punto[2000];
Neurona brain;
float m = 0.5;
float b = 0;

float tam;

void setup(){
  
  size(600, 600);
  
  for(int i = 0; i < points.length ; i++){
    points[i] = new Punto(random(0, width) - width/2, random(0, height) - height/2);
  
     tam = width/2;
  
     brain = new Neurona(2, 0.05); 
  }
  
 
  
  println(frameCount);
}

void draw(){
  
  background(200);
  Ejes();
  strokeWeight(1);
  line(width/2 - width/m, 0, width/2 + width/m, height);
  
  for(int i = 0; i<points.length; i++){
    points[i].x = random(0, width) - width/2;
    points[i].y = random(0, height) - height/2;
  }
  
  for(Punto p : points){
    p.tipo = int(brain.Classify(p.x/tam, p.y/tam));
    p.Pintar();
  }
  
  float x = random(0, width) - width/2;
  float y = random(0, height) - height/2;
  
  brain.Training(x, y, y < m * x + b ? 1 : -1);
  
  delay(100);
  
  //noLoop();
}

void Ejes() {
  strokeWeight(1);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}
