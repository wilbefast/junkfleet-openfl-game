package ships;

import hacksaw.GameObject;

class PlasmaBall extends GameObject
{

	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y, 8);
		
		graphics.beginFill(0xFF00FF);
			graphics.drawCircle(0, 0, radius);
		graphics.endFill();
		
		speed.y = -500;
	}
	
	// ---------------------------------------------------------------------------
	// UPDATE
	// ---------------------------------------------------------------------------

	
	public override function update(dt : Float) : Void
	{
		super.update(dt);
		
		if (y < -radius*2)
			purge = true;
	}
	
}