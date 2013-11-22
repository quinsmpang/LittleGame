package Loader
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import starling.core.Starling;
	
	import utlis.ShortcutUtil;
	
	[SWF(width="954", height="560", frameRate="60", backgroundColor="#002143")] 
	public class StartUp extends Sprite
	{
		/**
		 *flash的舞台 
		 */		
		public static var myStage:Stage;
		
		private var myStarling:Starling
		
		public function StartUp()
		{
			super();
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			myStage = stage;
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
			
			ShortcutUtil.init(myStage);
		}
	}
}