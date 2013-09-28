package data
{
	import data.event.MapInfoUpdateEvent;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.utils.RectangleUtil;

	/**
	 * 地图信息类<br>
	 * 包含背景信息和显示对象信息<br>
	 * 地图具有以下特性
	 * <ul>
	 * 	<li>实现了IAnimatable,当包含有显示对象时，将计算显示对象与相机的碰撞，并调整相机位置</li>
	 * 	<li>逐帧调整显示对象的位置信息</li>
	 * @author yanjinwei
	 * 
	 */
	public class MapInfo extends ObjectInfo implements IAnimatable
	{
		//地图信息
		public static const WIDTH:int = 1600; 
		public static const HEIGHT:int = 1200;
		public var mapID:int;
		/**
		 *相机 
		 */		
		public var camera:Camera2D;
		
		/**
		 *显示对象列表 
		 */		
		public var objects:Vector.<ObjectInfo>;
		
		public function MapInfo()
		{
			super();
			objects = new Vector.<ObjectInfo>;
			camera = new Camera2D(0,0,WIDTH >> 1, HEIGHT >> 1);
			Starling.juggler.add(this);
			Starling.juggler.add(camera);
		}
		
		public function advanceTime(time:Number):void
		{
			var intersectRectangle:Rectangle;
			var i:int;
			
			// 遍历所有显示对象并处理移动
			for each(var obj:ObjectInfo in objects)
			{
				//显示对象为人物
				if(obj is BaseCharacterInfo)
				{
					var characterInfo:BaseCharacterInfo = obj as BaseCharacterInfo;
					characterInfo.cameraMove(time);
					
					intersectRectangle = camera.intersection(characterInfo.body);
					if(intersectRectangle.width < characterInfo.body.width - 4)
					{
						cameraMove(characterInfo.vx * time, characterInfo.vy * time);
						characterInfo.stop(time);
					}
				}
			}
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
		
		public function cameraMove(offestX:Number,offestY:Number):void
		{
			camera.move(offestX,offestY);
			dispatchEvent(new MapInfoUpdateEvent(MapInfoUpdateEvent.UPDATE));
		}
		
		override public function dispose():void
		{
			Starling.juggler.remove(camera);
			Starling.juggler.remove(this);
		}
		
		
	}
}