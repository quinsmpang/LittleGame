package data.event
{
	import starling.events.Event;
	
	public class RoleInfoUpdateEvent extends Event
	{
		public static const UPDATE:String = "update";
		
		public function RoleInfoUpdateEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
		}
	}
}