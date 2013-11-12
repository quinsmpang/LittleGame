package data
{
	import starling.events.EventDispatcher;

	/**
	 * 显示对象信息抽象类
	 * @author yanjinwei
	 * 
	 */	
	public class ObjectInfo extends EventDispatcher
	{
		private var _sceneX:int;
		private var _sceneY:int;
		
		public function ObjectInfo()
		{
			super();
		}
		
		/**
		 *场景坐标Y 
		 */
		public function get sceneY():int
		{
			return _sceneY;
		}

		/**
		 * @private
		 */
		public function set sceneY(value:int):void
		{
			_sceneY = value;
		}

		/**
		 *场景坐标X
		 */
		public function get sceneX():int
		{
			return _sceneX;
		}

		/**
		 * @private
		 */
		public function set sceneX(value:int):void
		{
			_sceneX = value;
		}

		public function dispose():void
		{
			
		}
	}
}