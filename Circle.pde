/**
 * TO-DO:
 * Create Accessor and Mutator methods for all necessary fields
 * JavaDoc Comment all methods
 *
 *
 * @author Maksymilian Sekula
 * @version 9/2/2020
 */

class Circle{
 
  // Class fields 
  private float radius;
  private float initialCircleX;
  private float initialCircleY;
  private float smallCircleX;
  private float smallCircleY;
  private float time;
  private int Num;
  private float timeChange;
  private Wave waveObject;
  
  /**
  * Contructor of class
  *
  * @param Radius The radius of the cirle
  * @param bigX The circle's x coordinate
  * @param waveObj Wave object
  */
  public Circle(int radius,int bigX, int n, Wave waveObj){
    this.radius = radius;
    initialCircleX = bigX;
    initialCircleY = height/2;
    time = 0.0;
    Num = n;
    timeChange = (0.02/n);
    waveObject = waveObj;
  }
  
  
  public void calculateSquareWaves(){
    float prevX = initialCircleX;
    float prevY = initialCircleY;
    
    for(int n = 0; n < Num; n = n+1){
      
      int N = n * 2 + 1;
      
      smallCircleX = prevX + (radius * 1.5) * (cos(N*time)/N);
      smallCircleY = prevY + (radius * 1.5) * (sin(N*time)/N);

      fill(255);
      circle(smallCircleX,smallCircleY,5);
      
      stroke(255);
      line(prevX,prevY,smallCircleX,smallCircleY);
      
      stroke(255);
      noFill(); 
      circle(prevX,prevY,((sqrt(sq(abs(smallCircleX-prevX)) + sq(abs(smallCircleY-prevY))))*2)) ;
      
      prevX = smallCircleX;
      prevY = smallCircleY;
      time += timeChange;
    }
  }
  
  public void calculateSawtoothWaves(){
    float prevX = initialCircleX;
    float prevY = initialCircleY;
    int N;
    for(int n = 1; n < Num; n = n+1){
      if (n % 2 == 0){
        N = n;
      }
      if (n % 2 == 1){
        N = -n;
      }
      else N = n ;
      smallCircleX = prevX + radius * (cos(N*time)/(N));
      smallCircleY = prevY + radius * (sin(N*time)/(N));

      fill(255);
      circle(smallCircleX,smallCircleY,5);
      
      stroke(255);
      line(prevX,prevY,smallCircleX,smallCircleY);
      
      stroke(255);
      noFill(); 
      circle(prevX,prevY,((sqrt(sq(abs(smallCircleX-prevX)) + sq(abs(smallCircleY-prevY))))*2));
      
      prevX = smallCircleX;
      prevY = smallCircleY;
      time += timeChange;
    } //<>//
  }
  
  public void calculatePulseWaves()
  {
    float prevX = initialCircleX;
    float prevY = initialCircleY;
    int N;
    
    for(int n = 1; n < Num; n = n+1){
      N = n ;
      smallCircleX = prevX + radius/4 * (cos(N*time)/PI);
      smallCircleY = prevY + radius/4 * (sin(N*time)/PI);

      fill(255);
      circle(smallCircleX,smallCircleY,5);
      
      stroke(255);
      line(prevX,prevY,smallCircleX,smallCircleY);
      
      stroke(255);
      noFill(); 
      circle(prevX,prevY,((sqrt(sq(abs(smallCircleX-prevX)) + sq(abs(smallCircleY-prevY))))*2));
      
      prevX = smallCircleX;
      prevY = smallCircleY;
      time += timeChange;
    }
  }
  
  void calculateTriangleWaves()
  {
    float prevX = initialCircleX;
    float prevY = initialCircleY;
    int N;
    
    for(int n = 1; n < Num; n = n+1){
      N = n;
      smallCircleX = prevX + (radius * 1.25) * cos(((2 * N) - 1) * time) * pow(-1, N) / sq((2 * N) - 1);
      smallCircleY = prevY + (radius * 1.25) * sin(((2 * N) - 1) * time) * pow(-1, N) / sq((2 * N) - 1);

      fill(255);
      circle(smallCircleX,smallCircleY,5);
      
      stroke(255);
      line(prevX,prevY,smallCircleX,smallCircleY);
      
      stroke(255);
      noFill(); 
      circle(prevX, prevY, ((sqrt(sq(abs(smallCircleX - prevX)) + sq(abs(smallCircleY - prevY)))) * 2));
      
      prevX = smallCircleX;
      prevY = smallCircleY;
      time += timeChange;
    }
  }
  
  public void show()
  {
    if (key == 'e'){
      calculatePulseWaves();
    }
    else if (key == 't'){
      calculateTriangleWaves();
    }
    else if (key == 'w'){
      calculateSawtoothWaves();
    }
    else{
      calculateSquareWaves();
    }

    waveObject.addToEnd(getSmallCircleYValue()); //<>//
  }
  
  
  /**
   * @return The value of the y coordinate of the smallest circle 
   */
  public float getSmallCircleYValue()
  {
    return smallCircleY;
  }
  
  /**
   * @return The value of the x coordinate of the smallest circle 
   */
   public float getSmallCircleXValue()
   {
     return smallCircleX; 
   }   
  
  
  /**
   * Increases the number of circles by 1 
   */
   public void incremenetN()
   {
     this.Num = this.Num+1;   
   }
   
  /**
   * Decreases the number of circles by 1 
   */
   public void decremenetN()
   {
     this.Num = this.Num-1;   
   }
}
