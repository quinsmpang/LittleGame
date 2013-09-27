package renderer
{
	import Loader.AssetLoader;
	
	import data.MapInfo;
	import data.constType.KeyType;
	import data.event.MapInfoUpdateEvent;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;

	public class MapRenderer extends BaseRenderer
	{
		public var mapImage:Image;
		public var camera:Object;
		
		public function MapRenderer(info:MapInfo)
		{
			super();
			mapInfo = info;
		}
		
		override public function renderInfos():void
		{
			super.renderInfos();
			if(mapImage.parent == null)
			{
				addChild(mapImage);
			}
			mapImage.x = -mapInfo.cameraX;
			mapImage.y = -mapInfo.cameraY;
		}
		
		public function set mapInfo(info:MapInfo):void
		{
			renderInfo = info;
			initRenderer();
		}
		
		public function initRenderer():void
		{
			mapInfo.addEventListener(MapInfoUpdateEvent.UPDATE,renderInfos);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN,onCameraMove);
			
			if(mapImage == null)
			{
				var texture:Texture = Texture.fromBitmapData(new BitmapData(1600,1200));
				mapImage = new Image(texture);
			}
			if(camera == null)
			{
				camera = new Object();
				camera.height = MapInfo.HEIGHT >> 1;
				camera.width = MapInfo.WIDTH >> 1;
				mapInfo.cameraMove(MapInfo.HEIGHT >> 2, MapInfo.WIDTH >> 2);
			}
			AssetLoader.getloader().maploader(mapInfo.mapID.toString(),mapImage);
		}
		
		private function onCameraMove(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case KeyType.UP:
					mapInfo.cameraMove(0,-10);
					break;
				case KeyType.DOWN:
					mapInfo.cameraMove(0,10);
					break;
				case KeyType.LEFT:
					mapInfo.cameraMove(-10,0);
					break;
				case KeyType.RIGHT:
					mapInfo.cameraMove(10,0);
					break;
			}
		}
		
		public function get mapInfo():MapInfo
		{
			return renderInfo  as MapInfo;
		}
		
		override public function stop():void
		{
			super.stop();
		}
		
	}
}