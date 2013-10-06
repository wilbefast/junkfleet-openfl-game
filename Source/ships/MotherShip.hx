package ships;

class MotherShip extends Ship
{
	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y);
		
		radius = 32;
		friction = 0.4;
		acceleration = 10;
		
		graphics.beginFill(0x000000);
		graphics.drawCircle(0, 0, radius);
	}
}