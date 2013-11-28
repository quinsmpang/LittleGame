package data.actions
{
	import data.infos.BaseCharacterInfo;

	/**
	 *跳跃 
	 * @author yanjinwei
	 * 
	 */	
	public class Jump extends BaseAction
	{
		public function Jump(character:BaseCharacterInfo)
		{
			this.character = character;
		}
		
		override public function start():void
		{
			if(character != null)
			{
				character.body.vy = -30;
			}
		}
		
		override public function stop():void
		{
		}
	}
}