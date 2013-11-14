package Loader
{
	
	import compoments.Box2D;
	import compoments.BoxWorld2D;
	
	import contorllers.PlayerContorller;
	
	import data.constType.KeyType;
	import data.infos.MapInfo;
	import data.infos.RoleInfo;
	
	import renderers.MapRenderer;
	import renderers.RoleRenderer;
	
	import starling.display.Sprite;
	
	public class GameLoader extends Sprite
	{
		public function GameLoader()
		{
			super();
			
			var mapinfo:MapInfo = new MapInfo();
			mapinfo.mapID = 1001;
			mapinfo.width = 1600;
			mapinfo.height = 1200;
			var maprenderer:MapRenderer = new MapRenderer(mapinfo);
			addChild(maprenderer);
			
			var role1:RoleInfo = new RoleInfo();
			role1.setBoby(200,300);
			var role1Renderer:RoleRenderer = new RoleRenderer(role1);
			maprenderer.addChild(role1Renderer);
			
			var player1:PlayerContorller = new PlayerContorller();
			player1.setController(role1);
			player1.setKeySlot([KeyType.A, KeyType.D, KeyType.W, KeyType.D, KeyType.J, KeyType.K]);
			
			BoxWorld2D.getInstance().addChild(role1.body);
			
			BoxWorld2D.getInstance().start();
		}
	}
}