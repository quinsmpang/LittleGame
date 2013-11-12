package data
{
	import flash.geom.Rectangle;
	
	import compoments.Box2D;
	
	import data.action.IActionRenderer;
	import data.event.RoleInfoUpdateEvent;

	/**
	 * 基础人物信息类<br>
	 * 包含人物的显示信息<br>
	 * @see roleType
	 * @author yanjinwei
	 * 
	 */
	public class BaseCharacterInfo extends ObjectInfo
	{
		//人物速度
		public var vx:Number = 0;
		public var vy:Number = 0;
		//加载info的相机
		public var camera:Rectangle;
		
		public var hp:int;
		
		public var actioning:IActionRenderer;
		public var isJump:Boolean;
		
		public var body:Box2D;
		
		public function BaseCharacterInfo()
		{
			super();
		}
		
		public function setBoby(width:Number , height:Number):void
		{
			if(body == null)
			{
				body = new Box2D();
			}
			else
			{
				body.width = width;
				body.height = height;
			}
		}
		
		public function getAction(action:Class):IActionRenderer
		{
			if(actioning is action)
			{
				actioning.stop();
			}
			else
			{
				actioning.stop();
				actioning = new action();
			}
			return actioning;
		}
		/**
		 *设置人物场景坐标 
		 * @param posx
		 * @param posy
		 * 
		 */		
		public function setScenePos(posx:Number,posy:Number):void
		{
			sceneX = posx;
			sceneY = posy;
			dispatchEvent(new RoleInfoUpdateEvent(RoleInfoUpdateEvent.UPDATE));
		}
		
		override public function get sceneX():int
		{
			return body.x + (body.width >> 1);
		}
		
		override public function set sceneX(value:int):void
		{
			body.x = value - (body.width >> 1);
		}
		
		override public function get sceneY():int
		{
			return body.y + (body.height >> 1);
		}
		
		override public function set sceneY(value:int):void
		{
			body.y = value - (body.height >> 1);
		}
	}
}