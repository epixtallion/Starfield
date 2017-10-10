Particle[] p = new Particle[80];
void setup()
{
	background(0);
	size(500, 500);
	for (int i = 0; i < p.length; i++){
		p[i] = randParticle(true);
	}

}
void draw()
{
	fill(0);
	rect(0,0,500,500);
	for (int i = 0; i < p.length; i++){
		if(p[i].isDead()) p[i] = randParticle(false);
		p[i].move();
		p[i].show();
	}
}
Particle randParticle(boolean init){
	int chance = (int) (Math.random()*101 - 1);
	if (chance < 3) return new OddballParticle(init);
	else if (chance < 15) return new JumboParticle(init);
	else return new NormalParticle(init);
}
class NormalParticle implements Particle
{
	int x, y, speed;
	boolean dead = false;
  	double angle;
	color c;
	NormalParticle(){
	  c = color((int) (Math.random()*25+230),
	    (int) (Math.random()*25+230),
	    (int) (Math.random()*25+230));
	  x = 250;
	  y = 250;
	  angle = Math.random()*365-3;
	}
	//Constructor
	NormalParticle(boolean init){
		c = color((int) (Math.random()*25+230),
			(int) (Math.random()*25+230),
			(int) (Math.random()*25+230));
		speed = (int) (Math.random()*7+2);
		if (init){
			x = (int) (Math.random()*506 - 5);
			y = (int) (Math.random()*506 - 5);
			angle = angleXY(x, y);
		} else {
			x = 250;
			y = 250;
			angle = Math.random()*365-3;
		}
	}

	public boolean isDead(){ return dead; }
	public void move(){
		x = x + (int) (xValueAngle(angle)*speed);
		y = y + (int) (yValueAngle(angle)*speed);
	}
	public void show(){
		if (x < 0 || x > 500 || y < 0 || y > 500){
			dead = true;
			x = 0;
			y = 0;
		} else {
			stroke(255,255,255);
			point(x,y);
		}
	}
}
interface Particle
{
	public boolean isDead();
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	int x, y;
	boolean dead = false;
	color c;
	//Constructor
	OddballParticle(boolean init){
    if (init){
      x = (int) (Math.random()*506 - 5);
      y = (int) (Math.random()*506 - 5);
    } else {
      x = 250;
      y = 250;
    }
	}

 	public boolean isDead(){ return dead; }
	public void move(){
		x = x + (int) (Math.random()*9-4);
		y = y + (int) (Math.random()*9-4);
	}
	public void show(){
		if (x < 0 || x > 500 || y < 0 || y > 500){
			dead = true;
			x = 0;
			y = 0;
		} else {
			fill(255, 50, 50);
			ellipse(x, y, 20, 20);
		}
	}
}
class JumboParticle extends NormalParticle
{
	//Constructor
	JumboParticle(boolean init){
	speed = (int) (Math.random()*7+2);
    c = color((int) (Math.random()*25+230),
      (int) (Math.random()*25+230),
      (int) (Math.random()*25+230));
    if (init){
      x = (int) (Math.random()*506 - 5);
      y = (int) (Math.random()*506 - 5);
      angle = atan((float) (x-250) / (float) (250 - y));
    } else {
      x = 250;
      y = 250;
      angle = (float) Math.random()*360;
    }
	}
	public void show(){
		if (x < 0 || x > 500 || y < 0 || y > 500){
			dead = true;
			x = 0;
			y = 0;
		} else {
			fill(255);
			rect(x-10, y-10, 20, 20);
		}
		angle = angle + (int) (Math.random()*5);
	}
}

double xValueAngle(double angle){
	if (angle == 360) return 0;
	return (Math.sin(radians((float)angle)));
}
double yValueAngle(double angle){
	if (angle == 270 || angle == 90) return 0;
	else if (angle == 180) return 1;
	return (Math.cos(radians((float)angle)));
}
int angleXY(int x, int y){
	double dX = (double) x - 250;
	double dY = (double) y - 250;
	return (int) degrees((float)Math.atan(dX/dY));
}
/*Test
int[] x = {0, 30, 45, 60, 90, 120, 135, 150, 180, 210, 225, 240, 270, 300, 315, 330, 360};
int[]
void test() {
	for(int i = 0; i < x.length; i++){
		System.out.println("x of angle "+x[i]+": "+ sin(radians(x[i]))*50);
		System.out.println("y of angle "+x[i]+": "+ cos(radians(x[i]))*50);
	}
}*/