package data.info
{
	import flash.geom.Rectangle;
	
	import compoments.Box2D;
	
	import starling.animation.IAnimatable;

	/**
	 * 2D相机参与role层的碰撞计算<br>
	 * 碰撞检测并修改相机状态<br>
	 * 逐帧检查相机状态并移动相机
	 * @author yanjinwei
	 */	
	public class Camera2D extends hitableObjectInfo implements IAnimatable
	{
		/**
		 * 相机是否可移动
		 */
		public var movable:Boolean
		
		public var vx:Number;
		public var vy:Number;
		/**
		 *地图渲染器 
		 */		
		public var map:MapInfo;
		/**
		 *相机区域（参与碰撞计算） 
		 */		
		public var region:Box2D;
		
		public var leftHasRole:Boolean;
		public var rightHasRole:Boolean;
		
		public function Camera2D()
		{
			region = new Box2D();
			region.parent = this;
		}
		/**
		 *初始化相机<br>
		 * @param x 相机x位置
		 * @param y 相机y位置
		 * @param width 相机宽
		 * @param height 相机高
		 * @param map 相机所在的地图
		 */		
		public function initCamera(x:Number, y:Number, width:Number, height:Number):void
		{
			this.width = width;
			this.height = height;
			this.x = x;
			this.x = y;
		}
		
		public function move(offestX:Number,offestY:Number):void
		{
		}
		
		/**
		 *相机的每一帧处理函数 
		 * @param time
		 * 
		 */		
		public function advanceTime(time:Number):void
		{
			if(movable)
			{
				x += vx;
				y += vy;
			}
			
			vx = vy = 0;
			leftHasRole = rightHasRole = false;
		}
		
		override public function hitTest(object:Box2D, hitRectangle:Rectangle):void
		{
			if(hitRectangle.width < object.width)
			{
				if(hitRectangle.x < x)
				{
					leftHasRole = true;
					if(vx < 0)
					{
						vx = vx < object.vx ? vx : object.vx;
					}
					else
					{
						vx = object.vx;
					}
				}
				else if((hitRectangle.x + hitRectangle.width) > (x + width))
				{
					rightHasRole = true;
					if(vx > 0)
					{
						vx = vx > object.vx ? vx : object.vx;
					}
					else
					{
						vx = object.vx;
					}
				}
			}
			
			if(leftHasRole && rightHasRole)
			{
				movable = false;
			}
			else
			{
				movable = true;
			}
		}
		
		override public function get y():Number
		{
			return region.y;
		}
		
		override public function set y(value:Number):void
		{
			region.y = value;
		}
		
		override public function get x():Number
		{
			return region.x;
		}
		
		override public function set x(value:Number):void
		{
			region.x = value;
		}

		public function get pivotX():Number
		{
			return region.x + (width >> 1);
		}

		public function set pivotX(value:Number):void
		{
			region.x = value - (width >> 1);
		}

		public function get pivotY():Number
		{
			return region.y + (height >> 1);
		}

		public function set pivotY(value:Number):void
		{
			region.y = value - (height >> 1);
		}
		
		public function get width():Number
		{
			return region.width;
		}
		
		public function get height():Number
		{
			return region.height;
		}
		
		public function set width(value:Number):void
		{
			region.width = value;
		}
		
		public function set height(value:Number):void
		{
			region.height = value;
		}


	}
}