package renderers
{
	import flash.events.Event;
	
	import Loader.GIFLoader;
	
	import compoments.CycleTimer;
	import compoments.GIFAnimation;
	
	import data.event.RoleInfoUpdateEvent;
	import data.infos.ObjectInfo;
	import data.infos.RoleInfo;
	
	import starling.animation.IAnimatable;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	/**
	 * 角色渲染器
	 * @author yanjinwei
	 * 
	 */
	public class RoleRenderer extends BaseRenderer implements IAnimatable
	{
		public var action:Sprite;
		private var currentGIFAction:GIFAnimation;
		
		public function RoleRenderer(info:RoleInfo = null)
		{
			super();
			if(info)
			{
				renderInfo = info;
			}
			action = new Sprite();
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
			
//			var testBody:Image = new Image(Texture.fromColor(roleInfo.width,roleInfo.height));
//			addChildAt(testBody,0);
			
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
				roleInfo.actionUpdate.removeAll();
				CycleTimer.getInstance().renderJuggler.remove(this);
			}
			
			super.renderInfo = info;
			
			if(roleInfo)
			{
				roleInfo.addEventListener(RoleInfoUpdateEvent.UPDATE,renderInit);
				roleInfo.addEventListener(Event.REMOVED_FROM_STAGE,dispose);
				roleInfo.actionUpdate.add(onRenderAction);
				CycleTimer.getInstance().renderJuggler.add(this);
			}
			renderInit();
		}
		
		private function onRenderAction():void
		{
			if(roleInfo.actioning)
			{
				if(currentGIFAction != null)
				{
					action.removeChild(currentGIFAction);
					currentGIFAction.stop();
				}
				var gif:GIFAnimation = GIFLoader.instance.load(roleInfo.actioning.gifID);
				gif.pivotX = 34;
				gif.pivotY = 49;
				gif.x = (roleInfo.width >> 1);
				gif.y = (roleInfo.height >> 1);
				gif.scaleX = 2;
				gif.scaleY = 2;
				action.addChild(gif);
				currentGIFAction = gif;
			}
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