import flash.display.Sprite;
import flash.ui.Keyboard;
import flash.Lib;
import flash.events.Event;
import flash.events.KeyboardEvent;

import hacksaw.DefaultFont;
import hacksaw.DefaultTextField;
import hacksaw.SoundManager;
import hacksaw.SceneManager;
import hacksaw.InputManager;

class Main extends Sprite 
{
	public function new () 
	{
		super ();

		// ------------------------------------------------------------------------
		// Start Hacksaw
		// ------------------------------------------------------------------------

		// Font
		DefaultFont.load();
		
		// Scenes
		//SceneManager.add("Title", new TitleScene());
		SceneManager.add("Game", new GameScene());
		//SceneManager.add("Victory", new VictoryScene());
		
		// Input
		InputManager.addInput("frontLeft", Keyboard.Q);
		InputManager.addInput("frontRight", Keyboard.S);
		InputManager.addInput("backLeft", Keyboard.A);
		InputManager.addInput("backRight", Keyboard.Z);
		InputManager.addInput("start", Keyboard.J);
		InputManager.addInput("exit", Keyboard.L);
		InputManager.addInput("up", Keyboard.UP);
		InputManager.addInput("down", Keyboard.DOWN);
		InputManager.addInput("left", Keyboard.LEFT);
		InputManager.addInput("right", Keyboard.RIGHT);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, 
			function(event : KeyboardEvent) if (event.keyCode == Keyboard.ESCAPE) return Sys.exit(0));

		// Sound
		//SoundManager.loadSound("teleport_in");
		//SoundManager.setMuted();

		// Music
		//snd_music = Assets.getSound("assets/music.mp3"); // flash doesn't like OOG :'(
		//channel = snd_music.play();
		//channel.addEventListener(Event.SOUND_COMPLETE, onMusicEnd);
	}
}