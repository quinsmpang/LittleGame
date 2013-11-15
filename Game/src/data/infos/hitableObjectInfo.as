package data.infos
{
	import flash.geom.Rectangle;
	
	import compoments.Box2D;

	/**
	 * 能参与碰撞检测的图层抽象类<br>
	 * @author yanjinwei
	 */	
	public class hitableObjectInfo extends ObjectInfo
	{
		public var body:Box2D;
		
		public function hitableObjectInfo()
		{
			super();
			body = new Box2D();
		}
		/**
		 *碰撞回调函数 
		 * @param object 碰撞到的Box
		 * @param hitRectangle 碰撞区域
		 */		
		public function hitTest(object:Box2D, hitRectangle:Rectangle):void
		{
		}

		public function dispose():void
		{
			
		}
	}
}