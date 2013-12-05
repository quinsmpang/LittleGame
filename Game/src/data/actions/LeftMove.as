package data.actions
{
	import flash.geom.Point;
	
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
		
		override public function get gifActionInfo():GIFActionInfo
		{
			var info:GIFActionInfo = new GIFActionInfo();
			info.gifID = 1001;
			info.center = new Point(24,50);
			return info;
		}
		
		override public function render(isPlay:Boolean):void
		{
			super.render(isPlay);
		}
		
	}
}