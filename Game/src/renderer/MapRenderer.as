package renderer
{
	import flash.display.BitmapData;
	
	import Loader.AssetLoader;
	
	import data.event.MapInfoUpdateEvent;
	import data.info.MapInfo;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
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
		}
		
		public function initRenderer():void
		{
			mapInfo.addEventListener(MapInfoUpdateEvent.UPDATE,renderInfos);
			
			if(mapImage == null)
			{
				var texture:Texture = Texture.fromBitmapData(new BitmapData(1600,1200));
				mapImage = new Image(texture);
			}
//			mapInfo.cameraMove(MapInfo.HEIGHT >> 2, MapInfo.WIDTH >> 2);
			AssetLoader.getloader().maploader(mapInfo.mapID.toString(),mapImage);
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			if(child is RoleRenderer)
			{
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