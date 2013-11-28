package data.actions
{
	import data.infos.BaseCharacterInfo;
	/**
	 * 左移动
	 * @author yanjinwei
	 * 
	 */
	public class LeftMove extends BaseAction
	{	
		public function LeftMove(character:BaseCharacterInfo = null)
		{
			this.character = character;
		}
		
		override public function start():void
		{
			if(character != null)
			{
				character.body.vx = -10;
			}
		}
		
		override public function stop():void
		{
			if(character != null)
			{
				character.body.vx = 0;
			}
		}
	}
}