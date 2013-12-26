package ships;

import hacksaw.GameObject;

class PlasmaBall extends GameObject
{

	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y, 8);
		
		graphics.beginFill(0xFF00FF);
			graphics.drawRect( -10, -5, 5, 10);
			graphics.drawRect( 5, -5, 5, 10);
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