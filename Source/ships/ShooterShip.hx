package ships;

class ShooterShip extends Ship
{

	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y);
		
		radius = 18;
		friction = 0.7;
		acceleration = 10;
		
		graphics.beginFill(0xFF0000);
		graphics.drawCircle(0, 0, radius);
	}
	
}