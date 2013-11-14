package renderers
{
	import flash.display.BitmapData;
	
	import data.event.RoleInfoUpdateEvent;
	import data.infos.RoleInfo;
	
	import starling.display.Image;
	import starling.textures.Texture;

	/**
	 * 角色渲染器
	 * @author yanjinwei
	 * 
	 */
	public class RoleRenderer extends BaseRenderer
	{
		public var roleImage:Image;
		
		public function RoleRenderer(info:RoleInfo = null)
		{
			super();
			if(info)
			{
				roleInfo = info;
			}
		}
		/**
		 *角色初始化渲染<br> 
		 * info为空则清空角色渲染器
		 */		
		override public function renderInit():void
		{
			super.renderInit();
			
			if(roleInfo == null)
			{
				clearRenderer();
			}
			
			var texture:Texture = Texture.fromBitmapData(new BitmapData(roleInfo.body.width,roleInfo.body.height,true,0xff00ffff));
			roleImage = new Image(texture);
			addChild(roleImage);
		
			x = roleInfo.x;
			y = roleInfo.y;
		}
		
		/**
		 *渲染角色 图层
		 */		
		public function renderRole():void
		{
			x = roleInfo.x;
			y = roleInfo.y;
		}
		
		public function get roleInfo():RoleInfo
		{
			return renderInfo as RoleInfo;
		}
		
		public function set roleInfo(info:RoleInfo):void
		{
			if(roleInfo)
			{
				roleInfo.removeEventListeners();
			}
			
			renderInfo = info;
			
			if(roleInfo)
			{
				roleInfo.addEventListener(RoleInfoUpdateEvent.UPDATE,renderInit);
			}
			renderInit();
		}
		
		override public function dispose():void
		{
			super.dispose();
			roleInfo.removeEventListener(RoleInfoUpdateEvent.UPDATE,renderInit);
		}
	}
}