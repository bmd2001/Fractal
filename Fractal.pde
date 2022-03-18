int MAXITER = 1000;
HashMap<PVector, Integer> fractalPoints = new HashMap();

void setup(){
  size(660 , 600);
  background(0);
  for(int i = 0; i < 600; i++){
    for(int j = 0; j < 600; j++){
      float x = map(i, 0, 600, -2.00, 0.47);
      float y = map(j, 0, 600, -1.12, 1.12);
      int currentIter = 0;
      PVector z = new PVector(0, 0);
      while(currentIter < MAXITER){
        float tempx = pow(z.x, 2) - pow(z.y, 2);
        float tempy = 2*z.x*z.y;
        z.x = tempx + x;
        z.y = tempy + y;
        currentIter ++;
        if(abs(z.x + z.y) > 16){
          break;
        }
      }
    fractalPoints.put(new PVector(i, j), currentIter*10+50);
    }
  }
}

void draw(){
  for(HashMap.Entry<PVector, Integer> entry : fractalPoints.entrySet()){
    PVector v = entry.getKey();
    Integer c = entry.getValue();
    stroke(c);
    circle(v.x+25, v.y, 1f);
  }
  save("fractal.png");
}
