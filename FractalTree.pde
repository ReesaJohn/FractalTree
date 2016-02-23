private double fractionLength = .8; 
private int smallestBranch = 5; 
private double branchAngle = 0.1;  
public void setup() 
{   
	size(750,600);    
	noLoop(); 
} 
public void draw() 
{   
	background(16,25,74);   
	stroke(255,255,255);   
	line(375,600,375,420);   
	drawBranches(375,420,100,3*Math.PI/2,255,255,255); 

} 
public void drawBranches(int x,int y, double branchLength, double angle,int r, int g,int b) 
{    


	double angle1,angle2;
	int endX1,endY1,endX2,endY2;

	
	angle1 = angle+branchAngle;
	angle2 = angle-branchAngle;

	branchLength = branchLength*fractionLength;


	 endX1 = (int)(branchLength*Math.cos(angle1) + x);
	 endY1 = (int)(branchLength*Math.sin(angle1) + y);

	 endX2 = (int)(branchLength*Math.cos(angle2) + x);
	 endY2 = (int)(branchLength*Math.sin(angle2) + y);

	stroke(r,g,b);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	
	
if (branchLength>smallestBranch) {
   


	drawBranches(endX1,endY1,branchLength,angle1,r-5,g-1,b);
	drawBranches(endX2,endY2,branchLength,angle2,r-1,g-3,b);

	}
} 

public void mouseMoved() {

 double myX,myY;

 myX= mouseX*0.01;
 myY= mouseY*0.01;
 branchAngle=branchAngle+myX-myY;

 redraw();
	
}