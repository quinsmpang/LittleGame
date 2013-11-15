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
		private var _x:Number;
		private var _y:Number;
		
		public function ObjectInfo()
		{
		}
		
		public function get x():Number
		{
			return _x;
		}
		
		public function set x(value:Number):void
		{
			_x = value;
		}
		
		public function set y(value:Number):void
		{
			_y = value;
		}
		
		public function get y():Number
		{
			return _y;
		}

		/**
		 *渲染器类型 
		 */
		public function get rendererClass():Class
		{
			return BaseRenderer;
		}
	}
}