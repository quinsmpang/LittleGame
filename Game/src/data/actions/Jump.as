package data.actions
{
	import flash.geom.Point;
	
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
				character.isJump = true;
			}
		}
		
		override public function stop():void
		{
		}
		
		override public function get gifActionInfo():GIFActionInfo
		{
			var info:GIFActionInfo = new GIFActionInfo();
			info.gifID = 1002;
			info.center = new Point(34,49);
			return info;
		}
		
	}
}