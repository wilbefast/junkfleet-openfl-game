package hacksaw;

import flash.events.KeyboardEvent;

class InputManager
{
	// ---------------------------------------------------------------------------
	// SINGLETON
	// ---------------------------------------------------------------------------

	// protected constructor

	private function new()
	{
		// initialise empty set of input states
		states = new Map<Int, InputState>();
		
		// register events
		flash.Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, function(event : KeyboardEvent) return onKey(true, event));
		flash.Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, function(event : KeyboardEvent) return onKey(true, event));
	}

	private static var instance : InputManager;

	private static function get()
	{
		if(instance == null)
			instance = new InputManager();
		return instance;
	}

	// shortcut static functions
	
	public static function addInput(code : Int)
	{
		get().states.set(code, new InputState());
	}

	public static function getState(code : Int) : InputState
	{
		return get().states.get(code);
	}
	
	// ---------------------------------------------------------------------------
	// INPUT STATES
	// ---------------------------------------------------------------------------
	
	private var states : Map<Int, InputState>;
	
	// ---------------------------------------------------------------------------
	// INPUT EVENTS
	// ---------------------------------------------------------------------------
	
	private function onKey(pressed : Bool, event : KeyboardEvent)
	{
		var state = states.get(event.keyCode);
		if (state != null)
			state.pressed = pressed;
	}
	
	// ---------------------------------------------------------------------------
	// INPUT EVENTS
	// ---------------------------------------------------------------------------
	
}