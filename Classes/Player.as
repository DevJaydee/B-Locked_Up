package
{

	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.media.*;
	import flash.system.*;


	public class Player extends MovieClip
	{

		public var moveUp: Boolean = false;
		public var moveDown: Boolean = false;
		public var moveLeft: Boolean = false;
		public var moveRight: Boolean = false;

		public var shooting: Boolean = false;

		public var shootingFX: Sound;
		
		public var playerSpeed: Vector2;
		public var position: Vector2;

		public function Player()
		{
			// setting vectors
			playerSpeed = new Vector2(4, 4);
			position = new Vector2(300, 650);
			// setting vectors

			//Sounds
			shootingFX = new playerShoot();
			//Sounds

			this.x = position.x;
			this.y = position.y;

			addEventListener(Event.ADDED_TO_STAGE, Init);
			
			// constructor code
		}
		
		public function Init(e: Event)
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			stage.addEventListener(Event.ENTER_FRAME, shootingHandeler);
		}

		public function shootingHandeler(e: Event): void
		{
			if (shooting == true)
			{
				shooting = false;
			}
		}

		public function keyDownHandler(event: KeyboardEvent): void
		{
			//keyCode 38 = UP
			if (event.keyCode == 38)
			{
				moveUp = true;
			}
			//keyCode 40 = DOWN
			if (event.keyCode == 40)
			{
				moveDown = true;
			}
			//keyCode 37 = LEFT
			if (event.keyCode == 37)
			{
				moveLeft = true;
			}
			//keyCode 39 = RIGHT
			if (event.keyCode == 39)
			{
				moveRight = true;
			}
			//Keycode 88 = X
			if (event.keyCode == 88)
			{
				shooting = true;
			}
			//Keycode 90 = Z
			if (event.keyCode == 90)
			{
				shooting = true;
			}
		}

		public function keyUpHandler(event: KeyboardEvent): void
		{
			//keyCode 38 = UP
			if (event.keyCode == 38)
			{
				moveUp = false;
			}
			//keyCode 40 = DOWN
			if (event.keyCode == 40)
			{
				moveDown = false;
			}
			//keyCode 37 = LEFT
			if (event.keyCode == 37)
			{
				moveLeft = false;
			}
			//keyCode 39 = RIGHT
			if (event.keyCode == 39)
			{
				moveRight = false;
			}
			//Keycode 88 = X
			if (event.keyCode == 88)
			{
				shooting = false;
			}
			//Keycode 90 = Z
			if (event.keyCode == 90)
			{
				shooting = false;
			}
		}

		private function enterFrameHandler(event: Event): void
		{

			// Move up, down, left, or right
			if (moveLeft && !moveRight)
			{
				this.x -= playerSpeed.x;
				this.rotation = 270;
			}
			if (moveRight && !moveLeft)
			{
				this.x += playerSpeed.x;
				this.rotation = 90;
			}
			if (moveUp && !moveDown)
			{
				this.y -= playerSpeed.y;
				this.rotation = 0;
			}
			if (moveDown && !moveUp)
			{
				this.y += playerSpeed.y;
				this.rotation = 180;
			}

			//Border Collision
			if (this.x >= 600)
			{
				moveLeft = false;
				this.x = 600;
			}
			if (this.x <= 0)
			{
				moveRight = false;
				this.x = 0;
			}
			if (this.y >= 700)
			{
				moveUp = false;
				this.y = 700;
			}
			if (this.y <= 0)
			{
				moveDown = false;
				this.y = 0;
			}

			// Move diagonally
			if (moveLeft && moveUp && !moveRight && !moveDown)
			{
				this.rotation = 315;
			}
			if (moveRight && moveUp && !moveLeft && !moveDown)
			{
				this.rotation = 45;
			}
			if (moveLeft && moveDown && !moveRight && !moveUp)
			{
				this.rotation = 225;
			}
			if (moveRight && moveDown && !moveLeft && !moveUp)
			{
				this.rotation = 135;
			}

			// Character Shooting
			if (shooting == true)
			{
				var b = new Player_Bullet();

				b.x = this.x;
				b.y = this.y;

				b.width = 10;
				b.height = 10;

				stage.addChild(b);
				shootingFX.play();
			}
		}
	}
}