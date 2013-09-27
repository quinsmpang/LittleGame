package data
{
	public class BaseCharacterInfo extends ObjectInfo
	{
		public var sceneX:int;
		public var sceneY:int;
		public var x:int;
		public var y:int;
		
		public var roleType:int;
		public var palyerName:String;
		
		public var skillNum:int;
		public var skills:Vector.<BaseSkillInfo>;
		
		public var height:int;
		public var width:int;
		
		public var hp:int;
		
		public var actioning:IActionRenderer;
		
		public function BaseCharacterInfo()
		{
			super();
		}
	}
}