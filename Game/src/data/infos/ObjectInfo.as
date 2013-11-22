package data.infos
{
	import Loader.StartUp;
	
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
		
		private var _renderable:Boolean;
		
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

		public function get renderable():Boolean
		{
			return _renderable;
		}

		public function set renderable(value:Boolean):void
		{
			_renderable = value;
			
			if(_renderable)
			{
				StartUp.myStage.invalidate();
				_renderable = false;
			}
		}

	}
}