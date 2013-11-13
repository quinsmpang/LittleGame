package data.info
{
	import flash.geom.Rectangle;
	
	import compoments.Box2D;
	
	import data.action.IActionRenderer;
	import data.event.RoleInfoUpdateEvent;

	/**
	 * 基础人物图层类<br>
	 * 具有以下特性
	 * <li> 组合了box2D实现人物之间的碰撞检测</li>
	 * <li> 对外接口表现为一个人物的图层信息</li>
	 * @author yanjinwei
	 */
	public class BaseCharacterInfo extends hitableObjectInfo
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
		/**
		 *设置人物躯体<br>
		 * 躯体参与碰撞计算 
		 * @param width
		 * @param height
		 * 
		 */		
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
		/**
		 * 执行动作
		 * @param action :Class
		 * 
		 */		
		public function doAction(action:Class):void
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
			
			actioning.start();
		}
		/**
		 *停止动作 
		 * @param action :Class
		 * @return 
		 * 
		 */		
		public function stopAction(action:Class):void
		{
			if(actioning is action)
			{
				actioning.stop();
			}
		}
		/**
		 *设置人物场景坐标 
		 * @param posx
		 * @param posy
		 * 
		 */		
		public function setScenePos(posx:Number,posy:Number):void
		{
			pivotX = posx;
			pivotY = posy;
			dispatchEvent(new RoleInfoUpdateEvent(RoleInfoUpdateEvent.UPDATE)); 
		}
		
		public function get pivotX():Number
		{
			return body.x + (body.width >> 1);
		}
		
		public function set pivotX(value:Number):void
		{
			body.x = value - (body.width >> 1);
		}
		
		public function get pivotY():Number
		{
			return body.y + (body.height >> 1);
		}
		
		public function set pivotY(value:Number):void
		{
			body.y = value - (body.height >> 1);
		}
	}
}