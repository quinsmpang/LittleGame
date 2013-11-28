package data.actions
{
	import data.infos.BaseCharacterInfo;
	/**
	 *右移动 
	 * @author yanjinwei
	 * 
	 */
	public class RightMove extends BaseAction
	{
		public function RightMove(character:BaseCharacterInfo = null)
		{
			this.character = character;
		}
		
		override public function start():void
		{
			if(character != null)
			{
				character.body.vx = 10;
			}
		}
		
		override public function stop():void
		{
			if(character != null)
			{
				character.body.vx = 0;
			}
		}
		
		override public function render(isPlay:Boolean):void
		{
			if(isPlay)
			{
				
			}
			else
			{
				
			}
		}
		
		override public function get gifID():int
		{
			return 1000;
		}
		
	}
}