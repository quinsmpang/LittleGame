package renderer
{
	import Loader.AssetLoader;
	
	import data.MapInfo;
	import data.constType.KeyType;
	import data.event.MapInfoUpdateEvent;
	
	import flash.display.BitmapData;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.events.KeyboardEvent;
	import starling.textures.Texture;

	/**
	 * 地图渲染器
	 * @author yanjinwei
	 * 
	 */
	public class MapRenderer extends BaseRenderer
	{
		public var mapImage:Image;
		
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
		}
		
		public function set mapInfo(info:MapInfo):void
		{
			renderInfo = info;
			initRenderer();
		}
		
		public function initRenderer():void
		{
			mapInfo.addEventListener(MapInfoUpdateEvent.UPDATE,renderInfos);
			
			if(mapImage == null)
			{
				var texture:Texture = Texture.fromBitmapData(new BitmapData(1600,1200));
				mapImage = new Image(texture);
			}
			mapInfo.camera.map = this;
			mapInfo.cameraMove(MapInfo.HEIGHT >> 2, MapInfo.WIDTH >> 2);
			AssetLoader.getloader().maploader(mapInfo.mapID.toString(),mapImage);
		}
		
//		private function onCameraMove(e:KeyboardEvent):void
//		{
//			switch(e.keyCode)
//			{
//				case KeyType.UP:
//					mapInfo.cameraMove(0,-10);
//					break;
//				case KeyType.DOWN:
//					mapInfo.cameraMove(0,10);
//					break;
//				case KeyType.LEFT:
//					mapInfo.cameraMove(-10,0);
//					break;
//				case KeyType.RIGHT:
//					mapInfo.cameraMove(10,0);
//					break;
//			}
//		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			if(child is RoleRenderer)
			{
				RoleRenderer(child).roleInfo.camera = mapInfo.camera;
				mapInfo.pushObject( RoleRenderer(child).roleInfo);
			}
			return super.addChild(child);
		}
		
		override public function removeChild(child:DisplayObject, dispose:Boolean=false):DisplayObject
		{
			if(child is RoleRenderer)
			{
				RoleRenderer(child).roleInfo.camera = null;
				mapInfo.popObject(RoleRenderer(child).roleInfo);
			}
			return super.removeChild(child, dispose);
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