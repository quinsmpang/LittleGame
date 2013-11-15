package renderers
{
	import Loader.AssetLoader;
	
	import data.event.MapInfoUpdateEvent;
	import data.infos.Camera2D;
	import data.infos.MapInfo;
	import data.infos.ObjectInfo;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.events.Event;

	/**
	 * 地图渲染器
	 * @author yanjinwei
	 * 
	 */
	public class MapRenderer extends BaseRenderer
	{
		public var mapImage:Image;
		
		/**
		 *相机 
		 */		
		public var camera:Camera2D;
		public function MapRenderer(info:MapInfo = null)
		{
			super();
			camera = new Camera2D();
			camera.initCamera(0,0,Starling.current.stage.stageWidth,Starling.current.stage.stageHeight);
			if(info != null)
			{
				renderInfo = info;
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
			renderChilds();
		}
		/**
		 *地图图层update后调用此函数进行渲染 
		 */		
		public function renderMapInfo():void
		{
			renderChilds();
		}
		
		protected function renderChilds():void
		{
			removeChildren(1,numChildren);
			var len:int = mapInfo.objects.length;
			for(var i:int = 0 ; i < len ; i ++)
			{
				var rendererClass:Class = mapInfo.objects[i].rendererClass;
				var renderer:BaseRenderer =  new rendererClass(); 
				renderer.renderInfo =  mapInfo.objects[i];
				super.addChild(renderer);
			}
		}
		
		protected function renderChild(e:Event):void
		{
			var objectInfo:ObjectInfo = e.data as ObjectInfo;
			var renderer:BaseRenderer = new objectInfo.rendererClass();
			renderer.renderInfo = objectInfo;
			super.addChild(renderer);
			
		}
		/**
		 *地图图层 
		 * @param info
		 * 
		 */		
		override public function set renderInfo(info:ObjectInfo):void
		{
			if(mapInfo == info)
			{
				return;
			}
			
			if(mapInfo)
			{
				camera.map = null;
				mapInfo.removeEventListeners();
			}
			
			super.renderInfo = info;
			
			if(mapInfo)
			{
				camera.map = mapInfo;
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
			mapInfo.addEventListener(MapInfoUpdateEvent.LOCATE_UPDATE,renderLocate);
			mapInfo.addEventListener(MapInfoUpdateEvent.CHILD_UPDATE,renderChild);
		}
		
		private function renderLocate():void
		{
			this.x = mapInfo.x;
			this.y = mapInfo.y;
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			if(child is RoleRenderer)
			{
				mapInfo.addObject( RoleRenderer(child).roleInfo);
			}
			return super.addChild(child);
		}
		
		override public function removeChild(child:DisplayObject, dispose:Boolean=false):DisplayObject
		{
			if(child is RoleRenderer)
			{
				mapInfo.removeObject(RoleRenderer(child).roleInfo);
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