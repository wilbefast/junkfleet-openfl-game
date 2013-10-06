package ships;

class FuelShip extends Ship
{
	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y);
		
		radius = 26;
		friction = 0.4;
		acceleration = 10;
		
		graphics.beginFill(0xFFFF00);
		graphics.drawCircle(0, 0, radius);
	}
}