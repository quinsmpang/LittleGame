package renderers
{
	import data.infos.ObjectInfo;
	
	import starling.display.DisplayObjectContainer;
	/**
	 *渲染器基类
	 * @author yanjinwei
	 */
	public class BaseRenderer extends DisplayObjectContainer
	{
		private var _renderInfo:ObjectInfo;
		
		public function BaseRenderer()
		{
			super();
		}
		/**
		 * 对renderInfo的初始化渲染
		 */		
		public function renderInit():void
		{
			
		}
		/**
		 *清空渲染器 
		 */		
		public function clearRenderer():void
		{
			
		}

		public function get renderInfo():ObjectInfo
		{
			return _renderInfo;
		}

		public function set renderInfo(value:ObjectInfo):void
		{
			_renderInfo = value;
		}

	}
}