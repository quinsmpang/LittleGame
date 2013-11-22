package utlis
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;

	/**
	 *旋转 
	 * @author yanjinwei
	 * 
	 */	
	public class WhirlUtils
	{
		public function WhirlUtils()
		{
		}
		/**
		 *得到一个以角度旋转的容器，并自动addchild上obj的父对象<br>
		 * 效果：使对象以给点自旋转<br> 
		 * @param obj 需要旋转的对象
		 * @param center 对象选择的中心点（默认为对象中心点）
		 * @return 容器
		 */		
		public static function getTurnplate(obj:DisplayObject, center:Point = null):Sprite
		{
			var container:Sprite = new Sprite();
			if(center == null)
			{
				container.x = obj.x + (obj.width >> 1);
				container.y = obj.y + (obj.height >> 1);
				obj.x -= obj.width >>　1;
				obj.y -= obj.height >> 1;
			}
			else
			{
				container.x = obj.x + center.x;
				container.y = obj.y + center.y;
				obj.x -= center.x;
				obj.y -= center.y;
			}
			
			if(obj.parent != null)
			{
				obj.parent.addChild(container);
			}
			
			container.addChild(obj);
			
			return container;
		}
		/**
		 *顺时针旋转对象 
		 * @param obj 对象
		 * @param center 旋转中心点
		 * @param radian 弧度
		 */		
		public static function whirlObj(obj:DisplayObject, center:Point ,radian:Number):void
		{
			var newX:Number = Math.cos(radian) * obj.x  - Math.sin(radian) * obj.y;
			var newY:Number = Math.cos(radian) * obj.y  + Math.sin(radian) * obj.x;
			
			obj.x = newX;
			obj.y = newY;
		}
		/**
		 *顺时针逼进旋转靠近中心点 
		 * @param obj 对象
		 * @param center 旋转中心点
		 * @param radian 弧度
		 * @return 到达返回true
		 */		
		public static function whirlObjToPoint(obj:DisplayObject, center:Point, radian:Number):Boolean
		{
			obj.x = Math.cos(radian) * obj.x  - Math.sin(radian) * obj.y;
			obj.y = Math.cos(radian) * obj.y  + Math.sin(radian) * obj.x;
			
			if(Point.distance(center, new Point(obj.x ,obj.y)) <= 1)
			{
				return true;
			}
			else
			{
				return false;
			}
			
		}
	}
}