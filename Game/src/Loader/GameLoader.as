package Loader
{
	
	import data.info.MapInfo;
	
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