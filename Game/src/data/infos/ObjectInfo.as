package data.infos
{
	import renderers.BaseRenderer;
	
	import starling.events.EventDispatcher;

	/**
	 *能够显示的图层 
	 * @author yanjinwei
	 * 
	 */	
	public class ObjectInfo extends EventDispatcher
	{
		/**
		 *渲染器 
		 */		
		public var myRenderer:BaseRenderer;
		/**
		 *渲染器类型 
		 */		
		public var rendererClass:Class;
		
		public function ObjectInfo()
		{
		}
		
		public function get x():Number
		{
			return 0;
		}
		
		public function set x(value:Number):void
		{
			
		}
		
		public function set y(value:Number):void
		{
		}
		
		public function get y():Number
		{
			return 0;
		}
	}
}