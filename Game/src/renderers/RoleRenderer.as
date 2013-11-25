package renderers
{
	import flash.events.Event;
	
	import compoments.CycleTimer;
	
	import data.event.RoleInfoUpdateEvent;
	import data.infos.ObjectInfo;
	import data.infos.RoleInfo;
	
	import starling.animation.IAnimatable;
	import starling.display.DisplayObjectContainer;

	/**
	 * 角色渲染器
	 * @author yanjinwei
	 * 
	 */
	public class RoleRenderer extends BaseRenderer implements IAnimatable
	{
		public var action:DisplayObjectContainer;
		
		public function RoleRenderer(info:RoleInfo = null)
		{
			super();
			if(info)
			{
				renderInfo = info;
			}
			action = new DisplayObjectContainer();
			addChild(action);
		}
		/**
		 *角色初始化渲染<br> 
		 *每次设置info调用<br>
		 * info为空则清空角色渲染器<br>
		 */		
		override public function renderInit():void
		{
			super.renderInit();
			
			if(roleInfo == null)
			{
				clearRenderer();
				return;
			}
			
			action.x = roleInfo.pivotX;
			action.y = roleInfo.pivotY;
			
			x = roleInfo.x;
			y = roleInfo.y;
		}
		
		/**
		 *渲染角色图层
		 */		
		public function renderRole():void
		{
			x = roleInfo.x;
			y = roleInfo.y;
		}
		/**
		 *逐帧渲染 
		 * @param time
		 */		
		public function advanceTime(time:Number):void
		{
			renderRole();
		}
		
		public function get roleInfo():RoleInfo
		{
			return renderInfo as RoleInfo;
		}
		
		/**
		 *角色图层 
		 * @param info
		 * 
		 */		
		override public function set renderInfo(info:ObjectInfo):void
		{
			if(roleInfo == info)
			
			if(roleInfo)
			{
				roleInfo.removeEventListeners();
				CycleTimer.getInstance().renderJuggler.remove(this);
			}
			
			super.renderInfo = info;
			
			if(roleInfo)
			{
				roleInfo.addEventListener(RoleInfoUpdateEvent.UPDATE,renderInit);
				roleInfo.addEventListener(Event.REMOVED_FROM_STAGE,dispose);
				CycleTimer.getInstance().renderJuggler.add(this);
			}
			renderInit();
		}
		
		override public function dispose():void
		{
			super.dispose();
			roleInfo.removeEventListener(Event.REMOVED_FROM_STAGE,dispose);
			roleInfo.removeEventListener(RoleInfoUpdateEvent.UPDATE,renderInit);
			CycleTimer.getInstance().renderJuggler.remove(this);
		}
	}
}