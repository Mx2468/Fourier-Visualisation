/** //<>//
 * A class that represents the set of circles at  
 *
 * TO-DO:
 * Constructor overloading?
 *
 * @author Maksymilian Sekula
 * @version 13/4/2021
 */

class Circle {

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
   * Contructor of class, only initialses variables based on default & parameter values
   *
   * @param Radius The radius of the cirle
   * @param bigX The circle's x coordinate
   * @param waveObj Wave object
   */
  public Circle(int radius, int bigX, int n, Wave waveObj) {
    this.radius = radius;
    initialCircleX = bigX;
    initialCircleY = height/2;
    time = 0.0;
    Num = n;
    timeChange = (0.02/n);
    waveObject = waveObj;
  }


  // ---- Calculation Methods ----

  /**
   * Calculates the x and y position for each circle at each timestep iteratively, 
   * using a formula that draws a square wave with the final small circle
   */
  public void calculateSquareWaves() {
    
    // Defines X and Y coordinates of previously calculated circle 
    float prevX = initialCircleX;
    float prevY = initialCircleY;
    int modifiedN;

    for (int n = 0; n < Num; n = n+1) {

      modifiedN = (n*2)+1;
      
      // Formula to calculate position of the circle to create a square wave
      smallCircleX = prevX + (radius * 1.5) * (cos(modifiedN*time)/modifiedN);
      smallCircleY = prevY + (radius * 1.5) * (sin(modifiedN*time)/modifiedN);

      fill(255);
      circle(smallCircleX, smallCircleY, 5);

      stroke(255);
      line(prevX, prevY, smallCircleX, smallCircleY);

      stroke(255);
      noFill(); 
      circle(prevX, prevY, ((sqrt(sq(abs(smallCircleX-prevX)) + sq(abs(smallCircleY-prevY))))*2)) ;

      prevX = smallCircleX;
      prevY = smallCircleY;
      time += timeChange;
    }
  }

  /**
   * Calculates the x and y position for each circle at each timestep iteratively, 
   * using a formula that draws a sawtooth wave with the final small circle
   */
  public void calculateSawtoothWaves() {
    float prevX = initialCircleX;
    float prevY = initialCircleY;
    int modifiedN;
    
    for (int n = 1; n < Num; n = n+1) {
      
      if (n % 2 == 0) {
        modifiedN = n;
      }
      
      else if (n % 2 == 1) {
        modifiedN = -n;
      } 
      
      else {
        modifiedN = n; 
      }
      
      // Formula to calculate position of the circle to create a sawtooth wave
      smallCircleX = prevX + radius * (cos(modifiedN*time)/modifiedN);
      smallCircleY = prevY + radius * (sin(modifiedN*time)/modifiedN);

      fill(255);
      circle(smallCircleX, smallCircleY, 5);

      stroke(255);
      line(prevX, prevY, smallCircleX, smallCircleY);

      stroke(255);
      noFill(); 
      circle(prevX, prevY, ((sqrt(sq(abs(smallCircleX-prevX)) + sq(abs(smallCircleY-prevY))))*2));

      prevX = smallCircleX;
      prevY = smallCircleY;
      time += timeChange;
    }
  }

  /**
   * Calculates the x and y position for each circle at each timestep iteratively, 
   * using a formula that draws a pulse wave with the final small circle
   */
  public void calculatePulseWaves()
  {
    float prevX = initialCircleX;
    float prevY = initialCircleY;
    int modifiedN;

    for (int n = 1; n < Num; n = n+1) {
      modifiedN = n ;
      
      // Formula to calculate position of the circle to create a pulse wave
      smallCircleX = prevX + radius/4 * (cos(modifiedN*time)/PI);
      smallCircleY = prevY + radius/4 * (sin(modifiedN*time)/PI);

      fill(255);
      circle(smallCircleX, smallCircleY, 5);

      stroke(255);
      line(prevX, prevY, smallCircleX, smallCircleY);

      stroke(255);
      noFill(); 
      circle(prevX, prevY, ((sqrt(sq(abs(smallCircleX-prevX)) + sq(abs(smallCircleY-prevY))))*2));

      prevX = smallCircleX;
      prevY = smallCircleY;
      time += timeChange;
    }
  }

  /**
   * Calculates the x and y position for each circle at each timestep iteratively, 
   * using a formula that draws a triangluar wave with the final small circle
   */
  void calculateTriangleWaves()
  {
    float prevX = initialCircleX;
    float prevY = initialCircleY;
    int modifiedN;

    for (int n = 1; n < Num; n = n+1) {
      modifiedN = n;
      
      // Formula to calculate position of the circle to create a triangular wave
      smallCircleX = prevX + (radius * 1.25) * cos(((2*modifiedN)-1)*time)*pow(-1, modifiedN)/sq((2*modifiedN)-1);
      smallCircleY = prevY + (radius * 1.25) * sin(((2*modifiedN)-1)*time)*pow(-1, modifiedN)/sq((2*modifiedN)-1);

      fill(255);
      circle(smallCircleX, smallCircleY, 5);

      stroke(255);
      line(prevX, prevY, smallCircleX, smallCircleY);

      stroke(255);
      noFill(); 
      circle(prevX, prevY, ((sqrt(sq(abs(smallCircleX - prevX)) + sq(abs(smallCircleY - prevY)))) * 2));

      prevX = smallCircleX;
      prevY = smallCircleY;
      time += timeChange;
    }
  }
  
  
  /**
   * Calculates the y value of the wave at this timepoint and appends it to the Wave's list
   */
  public void show()
  {
    // Changes the type of wave based upon the key pressed
    if (key == 'e') {
      calculatePulseWaves();
    } else if (key == 't') {
      calculateTriangleWaves();
    } else if (key == 'w') {
      calculateSawtoothWaves();
    } else {
      calculateSquareWaves();
    }
    
    // Adds the most recent calculated value to the wave object
    waveObject.addToEnd(getSmallCircleYValue());
  }

  // ---- Accessor & Mutator methods ----

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
    // Upper limit on number of circles - preformance limitations
    if(this.Num <1000){
      this.Num = this.Num+1;
    }
  }

  /**
   * Decreases the number of circles by 1 
   */
  public void decremenetN()
  {
    if(this.Num>0){
      this.Num = this.Num-1;
    }
  }
  
  /**
   * Doubles the time step
   */
  public void doubleTime()
  {
    timeChange = timeChange*2;
  }
  
  /**
   * Halves the time step
   */
 public void halfTime()
 {
   timeChange = timeChange/2;
 }
}
