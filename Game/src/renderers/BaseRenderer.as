package renderers
{
	import data.infos.hitableObjectInfo;
	
	import starling.display.DisplayObjectContainer;

	public class BaseRenderer extends DisplayObjectContainer
	{
		public var renderInfo:hitableObjectInfo;
		
		public function BaseRenderer()
		{
			super();
		}
		
		public function renderInfos():void
		{
			
		}
	}
}