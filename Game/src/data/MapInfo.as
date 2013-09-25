package data
{
	import flash.display.Bitmap;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	

	public class MapInfo extends DisplayObjectContainer
	{
		public var ID:int;
		public var path:String;
		public var mapInfo:Bitmap;
		public var objects:Vector.<ObjectInfo>
		
		public function MapInfo()
		{
			objects = new Vector.<ObjectInfo>;
		}
		
		public function pushObject(info:ObjectInfo):void
		{
			objects.push(info);
			addChild(info);
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
		
	}
}