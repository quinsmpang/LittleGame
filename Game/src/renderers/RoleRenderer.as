package renderers
{
	import flash.display.BitmapData;
	
	import data.event.RoleInfoUpdateEvent;
	import data.infos.RoleInfo;
	
	import starling.display.Image;
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
			
			x = roleInfo.pivotX;
			y = roleInfo.pivotY;
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
			if(roleImage == null)
			{
				var texture:Texture = Texture.fromBitmapData(new BitmapData(roleInfo.body.width,roleInfo.body.height,true,0xff00ffff));
				roleImage = new Image(texture);
				roleImage.pivotX = roleInfo.body.width >> 1;
				roleImage.pivotY = roleInfo.body.height >> 1;
				roleImage.x -= roleInfo.body.width << 1;
				roleImage.y -= roleInfo.body.height << 1;
				addChild(roleImage);
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
			roleInfo.removeEventListener(RoleInfoUpdateEvent.UPDATE,renderInfos);
		}
	}
}