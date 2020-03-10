package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class Player_Bullet extends MovieClip
	{

		public var posX: Number;
		public var posY: Number;
		
		public var Speed:Number = 10;

		public var finalPos: Vector2;

		public function Player_Bullet()
		{
			finalPos = new Vector2(posX, posY);

			this.x = finalPos.x;
			this.y = finalPos.y;

			addEventListener(Event.ENTER_FRAME, update);
		}

		public function update(e: Event): void
		{
			this.rotation += 6;
			this.y -= Speed;
			
			removeBullet();
		}
		
		public function removeBullet():void
		{
			if(this.y <= -10 && Speed > 0 && this.parent != null)
			{
				removeEventListener(Event.ENTER_FRAME, update);
				this.parent.removeChild(this);				
			}
		}
	}
}