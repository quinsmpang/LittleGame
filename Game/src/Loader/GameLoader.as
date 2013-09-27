package Loader
{
	
	import data.MapInfo;
	
	import flash.ui.Mouse;
	
	import renderer.MapLayer;
	import renderer.MapRenderer;
	
	import starling.display.Sprite;
	
	public class GameLoader extends Sprite
	{
		public function GameLoader()
		{
			super();
			
			var mapinfo:MapInfo = new MapInfo();
			mapinfo.mapID = 1001;
			var maprenderer:MapRenderer = new MapRenderer(mapinfo);
			addChild(maprenderer);
		}
	}
}