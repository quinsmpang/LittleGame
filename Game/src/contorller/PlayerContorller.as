package contorller
{
	import renderer.RoleRenderer;
	
	import starling.core.Starling;
	import starling.events.KeyboardEvent;

	public class PlayerContorller
	{
		//按键插槽类型索引
		public static const MOVE:int = 0;
		public static const ATTACT:int = 4;
		public static const SKILL:int = 5;
		/**
		 *控制器按键插槽 
		 */		
		public var keySlot:Vector.<int>;
		/**
		 *控制的角色 
		 */		
		public var role:RoleRenderer;
		
		public function PlayerContorller()
		{
		}
		
		public function setController(role:RoleRenderer):void
		{
			this.role = role;
			initkey();
		}
		
		private function initkey():void
		{
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp():void
		{
			
		}
		
		private function onKeyDown():void
		{
			
		}
	}
}