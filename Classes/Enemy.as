package
{

	import flash.display.*;
	import flash.events.*;


	public class Enemy extends MovieClip
	{
		public var position: Vector2;

		public var bulletarray_Shield: Array;
		public var m: Boolean;
		
		public var b:Bullet = new Bullet();


		public function Enemy()
		{
			//Enemy Position
			position = new Vector2(70, 60);

			m = true;

			this.x = position.x;
			this.y = position.y;
			//Enemy Position

			//Make & Fill Arrays
			bulletarray_Shield = new Array();
			//Make & Fill Arrays

			addEventListener(Event.ENTER_FRAME, Update);

			fillShieldArray();
			enemyBulletShield();
		}

		//Updates everyFrame (60 Times every second)
		public function Update(e: Event)
		{
			enemyMovement();
		}

		public function enemyMovement(): void
		{
			if (m == true)
			{
				this.x += 2;
				this.rotation += 2;
			}
			if (m == false)
			{
				this.x -= 2;
				this.rotation -= 2;
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

		//puts bullets in the Shield Array
		public function fillShieldArray(): void
		{
			for (var i = 0; i < 20; i++)
			{
				bulletarray_Shield[i] = new Bullet();
			}
		}

		//makes shield out of bulletarray_Shield
		public function enemyBulletShield(): void
		{
			var distance = 50;
			var angle = 0;
			for each(var bullet in bulletarray_Shield)
			{
				angle += 360 / bulletarray_Shield.length;
				var pos = new Vector2(distance * Math.cos(angle * (Math.PI / 180)), distance * Math.sin(angle * (Math.PI / 180)));

				bullet.x = pos.x;
				bullet.y = pos.y;

				bullet.Speed = 0;

				this.addChild(bullet);
			}
		}

		//Collision checker for bullets
		public function collisionChecker(other: MovieClip): Boolean
		{
			for each(var bullet in bulletarray_Shield)
			{
				if (other.hitTestPoint(bullet.x + this.x, bullet.y + this.y))
				{
					return true;
				}
			}
			return false;
		}
	}
}