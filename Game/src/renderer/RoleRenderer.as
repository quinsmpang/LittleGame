package renderer
{
	import flash.display.BitmapData;
	
	import data.RoleInfo;
	import data.event.RoleInfoUpdateEvent;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.events.KeyboardEvent;
	import starling.textures.Texture;

	/**
	 * 人物渲染器
	 * @author yanjinwei
	 * 
	 */
	public class RoleRenderer extends BaseRenderer
	{
		public var roleImage:Image;
		
		public function RoleRenderer(info:RoleInfo)
		{
			super();
			roleInfo = info;
		}
		
		override public function renderInfos():void
		{
			super.renderInfos();
			x = roleInfo.sceneX;
			y = roleInfo.sceneY;
		}
		
		
		public function get roleInfo():RoleInfo
		{
			return renderInfo as RoleInfo;
		}
		
		public function set roleInfo(info:RoleInfo):void
		{
			renderInfo = info;
			initRenderer();
		}
		
		public function initRenderer():void
		{
			roleInfo.addEventListener(RoleInfoUpdateEvent.UPDATE,renderInfos);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN,onMove);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP,onStop);
			
			if(roleImage == null)
			{
				var texture:Texture = Texture.fromBitmapData(new BitmapData(roleInfo.body.width,roleInfo.body.height,true,0xff00ffff));
				roleImage = new Image(texture);
				addChild(roleImage);
			}
		}
		
		protected function onStop(e:KeyboardEvent):void
		{
			roleInfo.vx = roleInfo.vy = 0;
		}
		
		protected function onMove(e:KeyboardEvent):void
		{
		}
	}
}