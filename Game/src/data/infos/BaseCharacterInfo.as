package data.infos
{
	import data.actions.BaseAction;
	import data.actions.Jump;
	import data.event.RoleInfoUpdateEvent;
	
	import org.osflash.signals.Signal;

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
		
		public var hp:int;
		
		public var actioning:BaseAction;
		
		private var _actionUpdate:Signal;
		
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
			body.width = width;
			body.height = height;
			body.parent = this;
		}
		/**
		 * 执行动作
		 * @param action :Class
		 * 
		 */		
		public function doAction(action:Class):void
		{
			if(action == null)
			{
				throw Error("动作为空!");
			}
			
			if(actioning is action)
			{
				return;
			}
			
			if(actioning != null && action != Jump)
			{
				actioning.stop();
			}
			
			var doAction:BaseAction = new action(this);
			doAction.start();
			if(!(actioning is Jump))
			{
				actioning = doAction;
			}
			
			this.actionUpdate.dispatch();
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
			centerX = posx;
			centerY = posy;
			dispatchEvent(new RoleInfoUpdateEvent(RoleInfoUpdateEvent.UPDATE)); 
		}
		
		public function get height():Number
		{
			return body.height;
		}
		
		public function get width():Number
		{
			return body.width;
		}
		
		public function get centerX():Number
		{
			return body.x + (body.width >> 1);
		}
		
		public function set centerX(value:Number):void
		{
			body.x = value - (body.width >> 1);
		}
		
		public function get centerY():Number
		{
			return body.y + (body.height >> 1);
		}
		
		public function set centerY(value:Number):void
		{
			body.y = value - (body.height >> 1);
		}
		
		override public function get x():Number
		{
			return body.x;
		}
		
		override public function set x(value:Number):void
		{
			body.x = value;
			renderable = true;
		}
		
		override public function set y(value:Number):void
		{
			body.y = value;
		}
		
		override public function get y():Number
		{
			return body.y;
		}

		public function get actionUpdate():Signal
		{
			if(_actionUpdate == null)
			{
				_actionUpdate = new Signal();
			}
			
			return _actionUpdate;
		}

	}
}