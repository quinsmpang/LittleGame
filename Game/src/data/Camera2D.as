package data
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import renderer.MapRenderer;
	
	import starling.animation.IAnimatable;
	/**
	 * 2D相机，实现了IAnimatable，逐帧检查场景类info状态来决定相机是否可移动
	 * @author yanjinwei
	 * 
	 */	
	public class Camera2D extends Rectangle implements IAnimatable
	{
		/**
		 * 相机是否可移动
		 */
		public var movable:Boolean
		/**
		 *地图渲染器 
		 */		
		public var map:MapRenderer;
		/**
		 *基础中心点 
		 */		
		public var baseCenter:Point;
		/**
		 *相机中心点 
		 */		
		private var _cameraCenter:Point;
		/**
		 *相机注册点 
		 */		
		public var location:Point;
		//相机新的yi'dong
		public var newX:Number;
		public var newY:Number;

		public function Camera2D(x:Number=0, y:Number=0, width:Number=0, height:Number=0)
		{
			super(x, y, width, height);
			newX = x;
			newY = y;
		}
		
		public function advanceTime(time:Number):void
		{
			if(!map)
			{
				return;
			}
			if(!map.mapInfo)
			{
				return;
			}
			var offestX:Number = newX - x;
			var offestY:Number = newY - y;
			x = newX;
			y = newY;
			map.mapImage.x = -x;
			map.mapImage.y = -y;
			//当存在2个以上角色时，检查角色边界状态
			if(map.mapInfo.objects.length > 1)
			{
				var liftnum:int; // 左边界role 数量
				var rightnum:int; // 右边界role 数量
				for each(var objInfo:BaseCharacterInfo in map.mapInfo.objects)
				{
					if(objInfo.body.x < x)
					{
						liftnum ++;
					}
					else if(objInfo.body.x  + objInfo.body.width >  x + width)
					{
						rightnum ++;
					}
					
					objInfo.setScenePos(objInfo.sceneX -= offestX,objInfo.sceneY -= offestY);
				}
				movable = liftnum <= 0 || rightnum <= 0;
			}
			else
			{
				movable = true;
			}
		}
		
		public function move(offestX:Number,offestY:Number):void
		{
			if(movable)
			{
				newX =  x + offestX;
				newY =  y +offestY;
			}
		}
	}
}