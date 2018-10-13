//add to top
Button green_button = new Button(900, 100, 1, color(0, 100, 0));
Button red_button = new Button(900, 200, 2, color(100, 0, 0));
Button brown_button = new Button(900, 300, 3, color(139, 69, 19));
Button white_button = new Button(900, 00, 0, color(255, 255, 255));

color block_color = color(0, 0, 0);
int block_value = 0;
int i;
int k;
void setup() {
  size(1000, 800); 
  noCursor();
}
int block_size = 80;
int[][] map = new int[block_size][block_size];
boolean drawn = false;
void draw() {
  background(255, 255, 255);
  boolean drawn = false;
  for (i = 0; i < (800/block_size)-1; i+=1) {
    for (k = 0; k < (800/block_size)-1; k+=1) {
      //NEW check if a block has been drawn
      stroke(0);
      if(map[k][i] != 0){
        fill(getColor(map[k][i]));
      }else{
        fill(255);  
      }

      rect(k*block_size, i*block_size, block_size, block_size);
      if (dist(k*block_size, i*block_size, mouseX, mouseY) < block_size && !drawn) {
        fill(block_color);
        rect(k*block_size, i*block_size, block_size, block_size);
        if (mousePressed == true) {
          map[k][i] = block_value;
        }
        drawn = true;
      }
    }
  }
  //draw our buttons
  green_button.draw();
  red_button.draw();
  brown_button.draw();
  white_button.draw();
  fill(0, 0, 0);
  stroke(255);
  rect(mouseX, mouseY, 15, 15);
}


//the button class
class Button {
  int locationX;
  int locationY;//position of button
  int num_value;
  color button_color;
  int button_width = 40;
  public Button(int locationX, int locationY, int num_value, color button_color) {
    this.locationX = locationX;
    this.locationY = locationY;
    this.num_value = num_value;
    this.button_color = button_color;
  }
  void draw() {
    ellipseMode(CENTER);
    fill(button_color);
    ellipse(locationX, locationY, button_width, button_width);
    fill(255);

    textAlign(CENTER);
    textSize(16);
    text(num_value+" ", locationX, locationY);
    mouse_over();//call mouse over
  }

  void mouse_over() {
    if (dist(locationX, locationY, mouseX, mouseY) < button_width) {
      if (mousePressed == true) {
        block_color = this.button_color;
        block_value = this.num_value;
        //print("in");
      }
    }
  }
}

//check color
color getColor(int map_value){
 if(map_value == 1){
   //print(map_value);
   return color(0, 100, 0);
 }
  if(map_value == 2){
   //print(map_value);
   return color(100, 0, 0);
 }
  if(map_value == 3){
   //print(map_value);
   return color(139, 69, 19);
 }
 return color(255,255,255);
}

//keypress export
void keyPressed(){
 if(key == 'x'){//x for export
   print("[\n");
  for(int j = 0; j < 8; j += 1){
    print("[");
   for(int x = 0; x < 8; x+=1){
     print(map[j][x] +",");
   }
   print("],\n");
  }
  print("]\n");
 }
}
