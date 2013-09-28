package data
{
	import data.event.RoleInfoUpdateEvent;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * 基础人物信息类<br>
	 * 包含人物的显示信息<br>
	 * @see roleType
	 * @author yanjinwei
	 * 
	 */
	public class BaseCharacterInfo extends ObjectInfo
	{
		//场景坐标 （相对相机）
		public var sceneX:Number = 0;
		public var sceneY:Number = 0;
		//人物速度
		public var vx:Number = 0;
		public var vy:Number = 0;
		//加载info的相机
		public var camera:Rectangle;
		
		public var roleType:int;
		public var palyerName:String;
		//玩家几
		public var palyer:int
		
		public var skillNum:int;
		public var skills:Vector.<BaseSkillInfo>;
		
		public var hp:int;
		
		public var actioning:IActionRenderer;
		
		public var body:Rectangle;
		
		public function BaseCharacterInfo()
		{
			super();
		}
		
		public function setBoby(width:Number , height:Number):void
		{
			if(body == null)
			{
				body = new Rectangle(0,0,width,height);
			}
			else
			{
				body.width = width;
				body.height = height;
			}
		}
		/**
		 *人物相机内移动 
		 */		
		[Inline]
		final public function cameraMove(time:Number):void
		{
			sceneX += vx * time;	
			sceneY += vy * time;
			if(camera)
			{
				body.x = camera.x + sceneX;
				body.y = camera.y + sceneY;
			}
			if(vx != 0 || vy != 0)
			{
				dispatchEvent(new RoleInfoUpdateEvent(RoleInfoUpdateEvent.UPDATE));
			}
		}
		/**
		 *停止人物移动，并回退上一次的移动 
		 */		
		[Inline]
		final public function stop(time:Number):void
		{
			sceneX -= vx * time;
			sceneY -= vy * time;
			vx = vy = 0;
			dispatchEvent(new RoleInfoUpdateEvent(RoleInfoUpdateEvent.UPDATE));
		}

		/**
		 * 人物实体中心点
		 * @return 人物实体中心点
		 * 
		 */		
		public function get bodyCenter():Point
		{
			var x:Number = sceneX + body.width >> 1;
			var y:Number = sceneY + body.height >> 1;
			return new Point(x,y);
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

	}
}