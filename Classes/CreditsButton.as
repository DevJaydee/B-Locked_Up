package
{

	import flash.display.*;
	import flash.events.*;
	import flash.net.drm.VoucherAccessInfo;


	public class CreditsButton extends MovieClip
	{


		public function CreditsButton()
		{

			this.addEventListener(MouseEvent.MOUSE_OVER, DecreaseAlpha);
			this.addEventListener(MouseEvent.MOUSE_OUT, RestoreAlpha);
			// constructor code
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