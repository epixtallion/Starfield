Particle[] p = new Particle[40];
void setup()
{
	background(0);
	size(500, 500);
}
void draw()
{
	//your code here
}
class NormalParticle
{
	//Constructor
	NormalParticle(){
		dead = false;
		x = 250;
	}
	//Initialization constructor
	NormalParticle(boolean init){
		dead = false;
		if (init){
			x = (int) (Math.random()*506 - 5);
			y = (int) (Math.random()*506 - 5);
		} else {
			x = 250;
			y = 250;
		}
	}
	public void move(){

	}
	public void show(){
		
	}
}
interface Particle
{
	int x, y;
	public boolean dead;
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	//Constructor
	OddballParticle(){
		dead = false;
	}
	//Initialization constructor
	OddballParticle(boolean init){
		dead = false;
		if (init){
			x = (int) (Math.random()*506 - 5);
			y = (int) (Math.random()*506 - 5);
		} else {
			x = 250;
			y = 250;
		}
	}
	public void move(){

	}
	public void show(){

	}
}
class JumboParticle implements Particle
{
	//Constructor
	JumboParticle(){
		dead = false;
		x = 0;
		y = 0;
	}
	//Initialization constructor
	JumboParticle(boolean init){
		dead = false;
		if (init){
			x = (int) (Math.random()*506 - 5);
			y = (int) (Math.random()*506 - 5);
		} else {
			x = 250;
			y = 250;
		}
	}
	public void move(){

	}
	public void show(){
		
	}
}