package data.infos
{
	import data.event.MapInfoUpdateEvent;

	/**
	 * 地图信息类<br>
	 * 包含背景信息和显示对象信息<br>
	 * 地图具有以下特性
	 * 	<li>存储所有加载于地图的图层信息</li>
	 * 	<li>拥有显示地图的相机对象</li>
	 * @author yanjinwei
	 */
	public class MapInfo extends SceneInfo
	{
		private var _width:Number;
		private var _height:Number;
		
		public var mapID:int;
		
		/**
		 *显示对象列表 
		 */		
		public var objects:Vector.<ObjectInfo>;
		
		public function MapInfo()
		{
			super();
			objects = new Vector.<ObjectInfo>;
		}
		/**
		 *初始化地图 
		 * @param width 地图宽
		 * @param height 地图高
		 * 
		 */		
		public function initMap(width:Number , height:Number):void
		{
			this.width = width;
			this.height = height;
		}
		/**
		 *加载显示对象
		 * @param info
		 */		
		public function addObject(info:hitableObjectInfo):void
		{
			objects.push(info);
			dispatchEvent(new MapInfoUpdateEvent(MapInfoUpdateEvent.CHILD_UPDATE,false,info));
		}
		
		/**
		 *删除显示对象 
		 * @param info
		 * @return 
		 * 
		 */		
		public function removeObject(info:hitableObjectInfo):Boolean
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
		
		public function moveTo(x:Number, y:Number):void
		{
			this.x = x;
			this.y = y;
			dispatchEvent(new MapInfoUpdateEvent(MapInfoUpdateEvent.LOCATE_UPDATE));
		}
		
		override public function get height():Number
		{
			return _height;
		}
		
		override public function set height(value:Number):void
		{
			_height = value;
		}
		
		override public function get width():Number
		{
			return _width;
		}
		
		override public function set width(value:Number):void
		{
			_width = value;
		}
		
		override public function dispose():void
		{
		}
		
		
	}
}