package Loader
{
	
	import compoments.BoxWorld2D;
	import compoments.CycleTimer;
	
	import contorllers.PlayerContorller;
	
	import data.constType.KeyType;
	import data.infos.MapInfo;
	import data.infos.RoleInfo;
	
	import renderers.MapRenderer;
	
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
			
//			var role1:RoleInfo = new RoleInfo();
//			role1.name = "玩家1";
//			role1.setBoby(120,196);
//			mapinfo.addObject(role1);
			var role2:RoleInfo = new RoleInfo();
			role2.name = "玩家2";
			role2.setBoby(120,196);
			mapinfo.addObject(role2);
			
			var player1:PlayerContorller = new PlayerContorller();
//			player1.setController(role1);
			player1.setKeySlot([KeyType.A, KeyType.D, KeyType.W, KeyType.D, KeyType.J, KeyType.K]);
			var player2:PlayerContorller = new PlayerContorller();
			player2.setController(role2);
			player2.setKeySlot([KeyType.LEFT, KeyType.RIGHT, KeyType.UP, KeyType.DOWN , KeyType.KEY1, KeyType.KEY2]);
			
//			BoxWorld2D.getInstance().addChild(role1.body);
			BoxWorld2D.getInstance().addChild(role2.body);
			BoxWorld2D.getInstance().start();
			CycleTimer.getInstance().start();
		}
	}
}