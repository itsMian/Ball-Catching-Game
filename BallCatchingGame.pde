PImage bg;
int m = 0, h = 0, s = 0;
float r = random(0,255), g = random(0,255), b = random(0,255);
float x = random(0,500);
float y = 0;
int hits = 0;
boolean check = false;
boolean paused = false;
void setup(){
  size(500,700);
  frameRate(120);
  bg = loadImage("background.jpg");
}
void draw(){
  if(paused == true) return;
  else{
  background(bg);
  scoreboard();
  drawBall();
  }
}
void drawBall(){
  fill(r,g,b);
  ellipse(x,y,50,50);
  y++;
}
void scoreboard(){
  fill(255);
  rect(0,600,500,100);
  textSize(15);
  textAlign(CENTER);
  fill(0,0,255);
  text("Missed",60,635);
  text(m,60,665);
  fill(255,0,0);
  text("Hits",245,635);
  text(h,245,665);
  fill(0);
  text("Score",435,635);
  text(s,435,665);
  if(check==true){
    y = 0;
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    x = random(0,500);
    check = false;
  }
  if(y>=575 && check==false){
    y = 0;
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    x = random(0,500);
    m++;
  }
  s = h-m;
  if(s>=20 && s<50) text("Nice",435,690);
  if(s>=50 && s<100) text("Perfect",435,690);
  if(s>=100) text("WOW",435,690);
}
void mouseClicked(){
  if(mouseX > x-25 && mouseX < x+25 && mouseY > y-25 && mouseY < y+25){
    if(paused==false){
      h = h + 1;
      check = true;
    }
  }
}
void keyPressed(){
  if(key == 's') paused = true;
  else if(key == 'r') paused = false;
}
