package Loader
{
	
	import data.MapInfo;
	import data.RoleInfo;
	
	import flash.ui.Mouse;
	
	import renderer.MapLayer;
	import renderer.MapRenderer;
	import renderer.RoleRenderer;
	
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
			
			
			var roleinfo1:RoleInfo = new RoleInfo();
			roleinfo1.setBoby(30,60);
			roleinfo1.palyer = 1;
			var rolerenderer1:RoleRenderer = new RoleRenderer(roleinfo1);
			maprenderer.addChild(rolerenderer1);
			
			var roleinfo2:RoleInfo = new RoleInfo();
			roleinfo2.setBoby(30,60);
			roleinfo2.palyer = 2;
			var rolerenderer2:RoleRenderer = new RoleRenderer(roleinfo2);
			maprenderer.addChild(rolerenderer2);
		}
	}
}