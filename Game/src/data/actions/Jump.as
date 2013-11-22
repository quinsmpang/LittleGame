package data.actions
{
	import data.infos.BaseCharacterInfo;

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
		
		public function Jump(character:BaseCharacterInfo)
		{
			this.character = character;
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