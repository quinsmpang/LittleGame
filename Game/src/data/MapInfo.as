package data
{
	import data.event.MapInfoUpdateEvent;

	public class MapInfo extends ObjectInfo
	{
		public var ID:int;
		public var path:String;
		public var mapID:int;
		public var objects:Vector.<ObjectInfo>
		public static const WIDTH:int = 1600; 
		public static const HEIGHT:int = 1200;
		public var cameraX:int;
		public var cameraY:int;
		
		public function MapInfo()
		{
			super();
			objects = new Vector.<ObjectInfo>;
		}
		
		public function pushObject(info:ObjectInfo):void
		{
			objects.push(info);
		}
		
		public function popObject(info:ObjectInfo):Boolean
		{
			var resultIndex:int;
			resultIndex = objects.indexOf(info);
			if(resultIndex != -1)
			{
				objects.splice(resultIndex,1);
				return true;
			}
			else
			{
				return false;
			}
		}
		
		public function cameraMove(offestX:int,offestY:int):void
		{
			cameraX += offestX;
			cameraY += offestY;
			dispatchEvent(new MapInfoUpdateEvent(MapInfoUpdateEvent.UPDATE));
		}
		
	}
}