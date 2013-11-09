package compoments
{
	import flash.geom.Rectangle;

	/**
	 *具有物理属性的一个盒子 
	 * @author Administrator
	 * 
	 */	
	public class Box2D
	{
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
		
		public function Box2D()
		{
			body = new Rectangle(height , width);
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
	}
}