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
		public var friction:Number;
		public var mass:Number;
		public var vx:Number;
		public var vy:Number;
		public var ax:Number;
		public var ay:Number;
		public var x:Number;
		public var y:Number;
		
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

		public function get width():Number
		{
			return body.width;
		}

		public function set width(value:Number):void
		{
			body.setTo(0,0,value,height);
		}

		public function get height():Number
		{
			return body.height;
		}

		public function set height(value:Number):void
		{
			body.setTo(0,0,width,value);
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