package compoments
{
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import org.bytearray.gif.events.FrameEvent;
	import org.bytearray.gif.player.GIFPlayer;
	
	import starling.display.Image;
	import starling.textures.Texture;

	/**
	 *GIF动画
	 * @see org.bytearray.gif.player.GIFPlayer
	 * @author yanjinwei
	 */	
	public class GIFAnimation extends Image
	{
		private var _gifPlayer:GIFPlayer;
		private var _defalutSize:Number = 64;
		
		public function GIFAnimation(pAutoPlay:Boolean = false)
		{
			super(Texture.fromColor(_defalutSize,_defalutSize,0x0));
			_gifPlayer = new GIFPlayer(pAutoPlay);
			_gifPlayer.addEventListener(FrameEvent.FRAME_RENDERED,onRenderFrame);
		}
		
		protected function onRenderFrame(event:Event):void
		{
			if(_gifPlayer.bitmapData != null)
			{
				texture = Texture.fromBitmapData(_gifPlayer.bitmapData);
			}
		}
		
		public function load(pRequest:URLRequest):void
		{
			_gifPlayer.load(pRequest);
		}
		
		public function play():void
		{
			_gifPlayer.play();
		}
		
		public function gotoAndPlay(pFrame:int):void
		{
			_gifPlayer.gotoAndPlay(pFrame);
		}
		
		public function gotoAndStop(pFrame:int):void
		{
			_gifPlayer.gotoAndStop(pFrame);
		}
		
		public function get currentFrame():int
		{
			return _gifPlayer.currentFrame;
		}
		
		public function stop():void
		{
			_gifPlayer.stop();
		}
		
		override public function dispose():void
		{
			super.dispose();
			_gifPlayer.removeEventListener(FrameEvent.FRAME_RENDERED,onRenderFrame);
			_gifPlayer.dispose();
		}
		
		
	}
}