package ships;

import hacksaw.GameObject;
import hacksaw.LineGraphics;

class Shield extends GameObject
{
	var strength = 1.0;
	
	public function new(__x : Float, __y : Float) 
	{
		super(__x, __y, 96);
		
		addChild(LineGraphics.drawCircle(0, 0, radius, 0x0000FF, 3));
	}
	
}