package contorllers
{
	import data.infos.BaseCharacterInfo;

	/**
	 *手柄基类 
	 * @author yanjinwei
	 * 
	 */	
	public class Pad
	{
		public function Pad()
		{
		}
		
		/**
		 *当前手柄操作的对象（数组） 
		 */		
		public var objectInfos:Vector.<BaseCharacterInfo> = new Vector.<BaseCharacterInfo>();
		
		/**
		 *添加一个被操作的人物 
		 */		
		public function addObject(info:BaseCharacterInfo):void
		{
			objectInfos.push(info);
		}
		
		/**
		 *删除一个操作对象 
		 * @param info
		 * 
		 */		
		public function removeObject(info:BaseCharacterInfo):void
		{
			objectInfos.splice(objectInfos.indexOf(info),1);
		}
		
		/**
		 *删除所有操作对象 
		 */		
		public function removeAllObject():void
		{
			while(objectInfos.length)
			{
				removeObject(objectInfos[0]);
			}
		}
		
		/**
		 *资源回收 
		 */		
		public function dispose():void
		{
			removeAllObject();
			objectInfos = null;
		}
		
	}
}