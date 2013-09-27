package renderer
{
	import starling.display.DisplayObjectContainer;
	
	public class MapLayer extends DisplayObjectContainer
	{
		private static var _instance:MapLayer;
		
		public function MapLayer()
		{
			super();
			if(_instance != null)
			{
				throw new Error("only one instance");
			}
		}

		public static function getLayer():MapLayer
		{
			if(_instance == null)
			{
				_instance = new MapLayer();
			}
			return _instance;
		}

	}
}