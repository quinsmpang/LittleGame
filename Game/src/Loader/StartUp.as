package Loader
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import starling.core.Starling;
	
	[SWF(width="800", height="600", frameRate="60", backgroundColor="#002143")] 
	public class StartUp extends Sprite
	{
		private var myStarling:Starling
		
		public function StartUp()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			if(stage.stageWidth > 0 && stage.stageHeight > 0 )
			{
				start();
			}
			else
			{
				stage.addEventListener(Event.RESIZE,onResize);
			}
		}
		
		protected function onResize(event:Event):void
		{
			if(stage.stageWidth > 0 && stage.stageHeight > 0)
			{
				stage.removeEventListener(Event.RESIZE,onResize);
				start();
			}
		}
		
		private function start():void
		{
			myStarling = new Starling(GameLoader,stage);
			myStarling.antiAliasing = 1;
			myStarling.enableErrorChecking = true;
			myStarling.start();
		}
	}
}