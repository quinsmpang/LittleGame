package compoments
{
	import flash.geom.Rectangle;
	
	import data.infos.hitableObjectInfo;

	/**
	 *具有物理属性的一个盒子 
	 * @author Administrator
	 * 
	 */	
	public class Box2D
	{
		private var _parent:hitableObjectInfo
		
		/**
		 *躯体，用做碰撞检测 
		 */		
		public var body:Rectangle;
		
		//物理基本属性
		public var friction:Number = 0;
		public var mass:Number = 0;
		public var vx:Number = 0;
		public var vy:Number = 0;
		public var ax:Number = 0;
		public var ay:Number = 0;
		
		public function Box2D()
		{
			body = new Rectangle();
		}
		
		public function get parent():hitableObjectInfo
		{
			return _parent;
		}
		/**
		 *Box2D的显示对象载体 
		 * @param value
		 * 
		 */		
		public function set parent(value:hitableObjectInfo):void
		{
			_parent = value;
		}
		
		public function get x():Number
		{
			return body.x;
		}
		
		public function set x(value:Number):void
		{
			body.x = value;
		}
		
		public function get y():Number
		{
			return body.y;
		}
		
		public function set y(value:Number):void
		{
			body.y = value;
		}

		public function get width():Number
		{
			return body.width;
		}

		public function set width(value:Number):void
		{
			body.setTo(x,y,value,height);
		}

		public function get height():Number
		{
			return body.height;
		}

		public function set height(value:Number):void
		{
			body.setTo(x,y,width,value);
		}
		/**
		 *与其他盒子碰撞时被调用，传入与自身碰撞的盒子与碰撞区域<br>
		 * 与多个盒子碰撞会多次调用此方法 
		 * @param object :Box2D 与自身碰撞的盒子
		 * @param hitRectangle :Rectangle 碰撞区域
		 */		
		public function hitTest(object:Box2D, hitRectangle:Rectangle):void
		{
			if(parent)
			{
				parent.hitTest(object, hitRectangle);
			}
		}
	}
}