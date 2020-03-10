package
{

	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.media.*;
	import flash.system.*;
	import flash.utils.*;

	public class Program extends MovieClip
	{

		//Entity's
		public var player: Player;
		public var enemy: Enemy;
		public var bullet: Bullet;
		public var projectileSpawner: bulletSpawner;
		//Entity's

		//UI Entity's
		public var startButton: MovieClip;
		public var creditsButton: MovieClip;
		public var creditsScreen: MovieClip;
		public var exitButton: MovieClip;
		public var menuButton: MovieClip;
		public var whiteBoard: MovieClip;
		//UI Entity's

		//Sounds
		public var myMusic: Sound;
		public var mysoundTransform: SoundTransform;
		public var mySoundChannel: SoundChannel;
		//Soundss

		public function Program()
		{
			//Entity's
			player = new Player();
			enemy = new Enemy();
			bullet = new Bullet();
			bullet != null;
			projectileSpawner = new bulletSpawner();
			//Entity's

			//UI Entity's
			startButton = new StartButton();
			creditsButton = new CreditsButton();
			creditsScreen = new CreditsScreen();
			exitButton = new ExitButton();
			menuButton = new MenuButton();
			whiteBoard = new WhiteBoard();
			//UI Entity's

			//UI Entity Properties
			startButton.x = 300;
			startButton.y = 100;

			creditsButton.x = 300;
			creditsButton.y = 300;

			creditsScreen.y = -40;

			exitButton.x = 300;
			exitButton.y = 500;

			menuButton.x = 300;
			menuButton.y = 640;

			whiteBoard.x = 300;
			whiteBoard.y = 350;

			startButton.addEventListener(MouseEvent.CLICK, startGame);
			exitButton.addEventListener(MouseEvent.CLICK, quitGame);
			creditsButton.addEventListener(MouseEvent.CLICK, Credits);
			menuButton.addEventListener(MouseEvent.CLICK, mainMenu);
			//Entity Properties

			//Init UI
			stage.addChild(startButton);
			stage.addChild(creditsButton);
			stage.addChild(exitButton);
			//Init UI

			stage.addEventListener(Event.ENTER_FRAME, Update);

		} // end of Program constructor

		public function Update(e: Event)
		{
			enemyCollisionChecker();
			bulletCollisionChecker();

			if (player == null)
			{
				fscommand("quit");
			}
		}

		public function createMusic(): void
		{
			myMusic = new Music1();
			mysoundTransform = new SoundTransform();
			mySoundChannel = new SoundChannel();
			mySoundChannel = myMusic.play();
			mysoundTransform.volume = 0.1;
			mySoundChannel.soundTransform = mysoundTransform;
		}

		public function mainMenu(Event: MouseEvent): void
		{
			removeAll();
			stage.addChild(whiteBoard);
			stage.addChild(startButton);
			stage.addChild(creditsButton);
			stage.addChild(exitButton);
			mySoundChannel.stop();

		}

		public function Credits(event: MouseEvent): void
		{
			removeAll();
			stage.addChild(whiteBoard);
			stage.addChild(creditsScreen);
			stage.addChild(menuButton);
		}

		public function removeAll(): void
		{
			projectileSpawner.timer.stop();

			stage.addChild(startButton);
			stage.addChild(creditsButton);
			stage.addChild(creditsScreen);
			stage.addChild(menuButton);
			stage.addChild(exitButton);
			stage.addChild(player);
			stage.addChild(enemy);
			stage.addChild(projectileSpawner);
			stage.addChild(whiteBoard);

			stage.removeChild(startButton);
			stage.removeChild(creditsButton);
			stage.removeChild(creditsScreen);
			stage.removeChild(menuButton);
			stage.removeChild(exitButton);
			stage.removeChild(player);
			stage.removeChild(enemy);
			stage.removeChild(projectileSpawner);
			stage.removeChild(whiteBoard);

			bullet = null;
		}

		public function startGame(event: MouseEvent)
		{
			stage.addChild(menuButton);
			stage.addChild(player);
			stage.addChild(enemy);
			stage.addChild(projectileSpawner);

			menuButton.x = 50;
			menuButton.y = 675;
			menuButton.width = 100;
			menuButton.height = 50;

			stage.removeChild(startButton);
			stage.removeChild(creditsButton);
			stage.removeChild(exitButton);

			createMusic();

			projectileSpawner.timer.start();
		}

		public function quitGame(event: MouseEvent): void
		{
			fscommand("quit");
		}

		public function enemyCollisionChecker(): void
		{

			if (bullet != null)
			{
				if (player != null)
				{
					if (enemy.collisionChecker(player))
					{
						stage.removeChild(player);
						player = null;
					}
				}
			}
		}

		public function bulletCollisionChecker(): void
		{
			if (bullet != null)
			{
				if (player != null)
				{
					if (bullet.collisionChecker(player))
					{
						stage.removeChild(player);
						player = null;
					}
				}
			}
		}
	} // end of class
} // end of package