import flash.display.Sprite;
import flash.ui.Keyboard;

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
		InputManager.addInput("A", Keyboard.Q);
		InputManager.addInput("B", Keyboard.S);
		InputManager.addInput("C", Keyboard.A);
		InputManager.addInput("D", Keyboard.Z);
		InputManager.addInput("start", Keyboard.J);
		InputManager.addInput("exit", Keyboard.L);
		InputManager.addInput("up", Keyboard.UP);
		InputManager.addInput("down", Keyboard.DOWN);
		InputManager.addInput("left", Keyboard.LEFT);
		InputManager.addInput("right", Keyboard.RIGHT);

		// Sound
		//SoundManager.loadSound("teleport_in");
		//SoundManager.setMuted();

		// Music
		//snd_music = Assets.getSound("assets/music.mp3"); // flash doesn't like OOG :'(
		//channel = snd_music.play();
		//channel.addEventListener(Event.SOUND_COMPLETE, onMusicEnd);
	}
}