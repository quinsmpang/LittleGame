package data
{
	import flash.geom.Point;
	
	import starling.events.EventDispatcher;

	/**
	 * 显示对象信息抽象类
	 * @author yanjinwei
	 * 
	 */	
	public class ObjectInfo extends EventDispatcher
	{
		/**
		 *场景坐标
		 */
		public var coordination:Point;
		
		public function ObjectInfo()
		{
			super();
		}
		
		public function dispose():void
		{
			
		}
	}
}