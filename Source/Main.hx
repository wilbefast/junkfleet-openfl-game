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

		DefaultFont.load();
		
		//SceneManager.add("Title", new TitleScene());
		SceneManager.add("Game", new GameScene());
		//SceneManager.add("Victory", new VictoryScene());
		
		InputManager.addInput(Keyboard.Q);
		InputManager.addInput(Keyboard.A);
		InputManager.addInput(Keyboard.S);
		InputManager.addInput(Keyboard.Z);
		InputManager.addInput(Keyboard.J);
		InputManager.addInput(Keyboard.L);
		InputManager.addInput(Keyboard.UP);
		InputManager.addInput(Keyboard.DOWN);
		InputManager.addInput(Keyboard.LEFT);
		InputManager.addInput(Keyboard.RIGHT);

		// Sound
		//SoundManager.loadSound("teleport_in");
		//SoundManager.setMuted();

		// Music
		//snd_music = Assets.getSound("assets/music.mp3"); // flash doesn't like OOG :'(
		//channel = snd_music.play();
		//channel.addEventListener(Event.SOUND_COMPLETE, onMusicEnd);

	}
}