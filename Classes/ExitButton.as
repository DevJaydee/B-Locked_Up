package
{

	import flash.display.*;
	import flash.events.*;


	public class ExitButton extends MovieClip
	{


		public function ExitButton()
		{
			this.addEventListener(MouseEvent.MOUSE_OVER, DecreaseAlpha);
			this.addEventListener(MouseEvent.MOUSE_OUT, RestoreAlpha);
		}

		public function DecreaseAlpha(event: MouseEvent): void
		{
			this.alpha = 0.8;
		}

		public function RestoreAlpha(event: MouseEvent): void
		{
			this.alpha = 1;
		}
	}

}