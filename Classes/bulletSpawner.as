package
{

	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.media.*;
	import flash.system.*;
	import flash.utils.*;

	public class bulletSpawner extends MovieClip
	{

		public var pos: Vector2;
		public var spawner: MovieClip;
		public var enemy: Enemy;
		public var bullet: Bullet;
		public var m: Boolean;

		public var timer: Timer;

		public var shootingFX: Sound;

		public function bulletSpawner()
		{
			//sound effect
			shootingFX = new enemyShoot();
			//sound effect

			spawner = new BulletSpawner;
			enemy = new Enemy();
			pos = new Vector2(enemy.x, enemy.y);
			bullet = new Bullet();

			m = true;
			timer = new Timer(100, 0);

			this.x = pos.x;
			this.y = pos.y;

			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			addEventListener(Event.ENTER_FRAME, Update);


			this.addChild(spawner);
		}

		public function timerHandler(event: TimerEvent): void
		{
			if (this != null)
			var randomNumber:Number = Math.random() * 1 - 1 - 0.55;
			{
				var bullet = new Bullet();
				bullet.Speed = randomNumber;
				bullet.width = randomNumber * 4;
				bullet.height = randomNumber * 4;

				if (bullet.Speed <= 0.1)
				{
					bullet.Speed = randomNumber;
				}

				bullet.x = this.x;
				bullet.y = this.y;
				if (this != null)
				{
					stage.addChild(bullet);
					shootingFX.play();
				}
			}
		}

		// Updates every frame
		public function Update(e: Event)
		{
			spawnerMovement();
		}

		// Moves spawner allong with the enemy
		public function spawnerMovement(): void
		{
			if (m == true)
			{
				this.x += 2;
				this.rotation += 1;
			}
			if (m == false)
			{
				this.x -= 2;
				this.rotation -= 1;
			}
			if (this.x == 70)
			{
				m = true;
			}
			if (this.x == 530)
			{
				m = false;
			}
		}
	}
}