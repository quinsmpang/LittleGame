package data.infos
{
	import starling.events.EventDispatcher;
	/**
	 *场景图层抽象类 
	 * @author yanjinwei
	 */	
	public class SceneInfo extends EventDispatcher
	{
		public function SceneInfo()
		{
			super();
		}
		
		public function get x():Number
		{
			return 0;
		}
		
		public function set x(value:Number):void
		{
			
		}
		
		public function get y():Number
		{
			return 0;
		}
		
		public function set y(value:Number):void
		{
			
		}
		
		public function get width():Number
		{
			return 0;
		}
		
		public function set width(value:Number):void
		{
			
		}
		
		public function get height():Number
		{
			return 0;
		}
		
		public function set height(value:Number):void
		{
			
		}
		
		public function dispose():void
		{
			
		}
	}
}