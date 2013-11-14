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
		
		public function MapRenderer(info:MapInfo = null)
		{
			super();
			if(info != null)
			{
				mapInfo = info;
			}
		}
		
		/**
		 *地图初始化渲染<br>
		 * info为空则会清空地图渲染器
		 */		
		override public function renderInit():void
		{
			if(mapInfo == null)
			{
				clearRenderer();
			}
			
			mapImage = AssetLoader.getloader().maploader(mapInfo.mapID.toString());
			
			if(mapImage.parent == null)
			{
				addChild(mapImage);
			}
			renderChild();
		}
		/**
		 *地图图层update后调用此函数进行渲染 
		 */		
		public function renderMapInfo():void
		{
			renderChild();
		}
		
		protected function renderChild():void
		{
			var len:int = mapInfo.objects.length;
			for(var i:int ; i < len ; i ++)
			{
				var renderer:BaseRenderer =  new mapInfo.objects[i].rendererClass();
				renderer.renderInfo =  mapInfo.objects[i];
				mapInfo.objects[i].myRenderer = renderer;
				addChild(renderer);
			}
		}
		/**
		 *地图图层 
		 * @param info
		 * 
		 */		
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
			
			renderInfo = info;
			
			if(mapInfo)
			{
				initEvent();
			}
			
			renderInit();
		}
		
		public function get mapInfo():MapInfo
		{
			return renderInfo  as MapInfo;
		}
		
		[Inline]
		final protected function initEvent():void
		{
			mapInfo.addEventListener(MapInfoUpdateEvent.UPDATE,renderChild);
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
		
		override public function dispose():void
		{
			super.dispose();
			if(mapInfo)
			{
				mapInfo.removeEventListeners();
			}
		}
		
	}
}