package renderers
{
	import Loader.AssetLoader;
	
	import data.event.MapInfoUpdateEvent;
	import data.infos.MapInfo;
	
	import starling.display.DisplayObject;
	import starling.display.Image;

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
		
		/**
		 *地图初始化的一次渲染
		 *地图贴图也会重新渲染 
		 */		
		override public function renderInfos():void
		{
			AssetLoader.getloader().maploader(mapInfo.mapID.toString());
			if(mapImage.parent == null)
			{
				addChild(mapImage);
			}
			renderChild();
		}
		
		[Inline]
		final protected function renderChild():void
		{
			var len:int = mapInfo.objects.length;
			for(var i:int ; i < len ; i ++)
			{
				var renderer:BaseRenderer =  new mapInfo.objects[i].rendererClass();
			}
		}
		
		public function set mapInfo(info:MapInfo):void
		{
			if(mapInfo == info)
			{
				return;
			}
			
			if(mapInfo)
			{
				mapInfo.removeEventListeners();
			}
			
			mapInfo = info;
			
			if(mapInfo)
			{
				initEvent();
			}
			
			renderInfos();
		}
		
		[Inline]
		final protected function initEvent():void
		{
			mapInfo.addEventListener(MapInfoUpdateEvent.UPDATE,renderInfos);
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