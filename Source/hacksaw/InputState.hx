package hacksaw;

class InputState
{
	public var pressed_previously(default, null) = false;
	public var trigger(default, null) = 0;
	
	private var __pressed = false;
	public var pressed(default, set) = false;
	private function set_pressed(value : Bool) : Bool
	{
		pressed_previously = pressed;
		pressed = value;
		
		if (pressed_previously && !pressed)
			trigger = -1;
		else if (pressed && !pressed_previously)
			trigger = 1;
		else
			trigger = 0;
			
		return pressed;
	}
	
	public function new()
	{
		
	}
}