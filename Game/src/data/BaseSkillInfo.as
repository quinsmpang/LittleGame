package data
{
	public class BaseSkillInfo extends ObjectInfo
	{
		public static const ATTACK:int = 1;
		public static const DEFENSE:int = 2;
		public static const	MOBILE:int = 4;
		
		public var ID:int;
		public var name:String;
		public var cd:int;
		public var skillType:int;
		public var propertyAffects = {};
		
		public var sceneX:int;
		public var sceneY:int;
		
		public function BaseSkillInfo()
		{
			super();
		}
		
		public function setPropertyAffects(name:String,value:int):void
		{
			propertyAffects[name] = value;
		}
	}
}