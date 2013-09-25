package Loader
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Loader extends Sprite
	{
		public function Loader()
		{
			var a:Quad = new Quad(200,200);
			addEventListener(Event.ADDED_TO_STAGE,onAdded);
		}
		
		protected function onAdded(event:Event):void
		{
		}
	}
}