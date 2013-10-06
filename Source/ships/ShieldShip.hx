package ships;

class ShieldShip extends Ship
{
	public var shield : Shield;
	
	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y);
		
		radius = 14;
		friction = 0.4;
		acceleration = 10;
		
		graphics.beginFill(0x0000FF);
			graphics.drawCircle(0, 0, radius);
		graphics.endFill();
		
		shield = new Shield(x, y);
	}
	
	// ---------------------------------------------------------------------------
	// UPDATE
	// ---------------------------------------------------------------------------

	public override function update(dt : Float) : Void
	{
		super.update(dt);
		
		shield.x = x;
		shield.y = y;
	}
}