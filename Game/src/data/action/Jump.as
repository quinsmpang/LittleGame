package data.action
{
	import data.info.BaseCharacterInfo;

	/**
	 *跳跃 
	 * @author yanjinwei
	 * 
	 */	
	public class Jump implements IActionRenderer
	{
		/**
		 *执行动作的人物 
		 */		
		public var character:BaseCharacterInfo;
		
		public function Jump()
		{
		}
		
		public function start():void
		{
			if(character.isJump == false)
			{
				character.body.vy = 10;
				character.isJump = true;
			}
		}
		
		public function stop():void
		{
		}
	}
}