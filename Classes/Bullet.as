package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class Bullet extends MovieClip
	{

		public var posX: Number;
		public var posY: Number;

		public var Speed: Number = 10;

		public var finalPos: Vector2;

		public var player: Player;
		public var spawner: bulletSpawner;

		public function Bullet()
		{
			finalPos = new Vector2(posX, posY);
			player = new Player();

			this.x = finalPos.x;
			this.y = finalPos.y;

			addEventListener(Event.ENTER_FRAME, update);
		}

		public function update(e: Event): void
		{
			this.rotation += 6;
			this.y -= Speed;

			removeBullet();
			if (this == null)
			{
				this.parent.removeChild(this);
			}
		}

		public function removeBullet(): void
		{
			if (this.y >= 710)
			{
				removeEventListener(Event.ENTER_FRAME, update);
				this.parent.removeChild(this);
			}
		}

		//Collision checker for bullets
		public function collisionChecker(other: MovieClip): Boolean
		{
			if (this.hitTestObject(player))
			{
				return true;
				trace("desu");
			}
			return false;
		}
	}
}