package data.constType
{
	public class KeyType
	{
		public static const ENTER:int = 13;
		public static const SHIFT:int = 16;
		
		public static const CTRL:int = 17;
		public static const ALT:int = 18;
		
		public static const ESC:int = 27;
		public static const SPACE:int = 32;
		
		public static const N0:int = 48;
		public static const N1:int = 49;
		public static const N2:int = 50;
		public static const N3:int = 51;
		public static const N4:int = 52;
		public static const N5:int = 53;
		public static const N6:int = 54;
		public static const N7:int = 55;
		public static const N8:int = 56;
		public static const N9:int = 57;
		
		public static const A:int = 65;
		public static const B:int = 66;
		public static const C:int = 67;
		public static const D:int = 68;
		public static const E:int = 69;
		public static const F:int = 70;
		public static const G:int = 71;
		
		/*+++++++CAI++++++++*/
		public static const H:int = 72;
		public static const I:int = 73;
		/*+++++++CAI++++++++*/
		
		public static const J:int = 74;
		public static const K:int = 75;
		public static const L:int = 76;
		public static const M:int = 77;
		public static const N:int = 78;
		public static const O:int = 79;
		public static const P:int = 80;
		public static const Q:int = 81;
		public static const R:int = 82;
		public static const S:int = 83;
		public static const T:int = 84;
		public static const U:int = 85;
		public static const V:int = 86;
		public static const W:int = 87;
		public static const X:int = 88;
		public static const Z:int = 90;
		
//		public static const KEY0:int = 48;
//		public static const KEY1:int = 49;
//		public static const KEY2:int = 50;
//		public static const KEY3:int = 51;
//		public static const KEY4:int = 52;
//		public static const KEY5:int = 53;
//		public static const KEY6:int = 54;
//		public static const KEY7:int = 55;
//		public static const KEY8:int = 56;		
//		public static const KEY9:int = 57;
		
		
		public static const KEY0:int = 96;
		public static const KEY1:int = 97;
		public static const KEY2:int = 98;
		public static const KEY3:int = 99;
		public static const KEY4:int = 100;
		public static const KEY5:int = 101;
		public static const KEY6:int = 102;
		public static const KEY7:int = 103;
		public static const KEY8:int = 104;		
		public static const KEY9:int = 105;
		
		public static const F8:int = 119;
		public static const F9:int = 120;
		
		public static const UP:int = 38;
		public static const DOWN:int = 40;
		public static const LEFT:int = 37;
		public static const RIGHT:int = 39;
		
		public static const CHANGETARGET:int = 192/*9*/;
	
		public static function getShortCutBarKey(bar:int):int
		{
			switch(bar)
			{
				case 0:
					return N0;
				case 1:
					return N1;
				case 2:
					return N2;
				case 3:
					return N3;
				case 4:
					return N4;
				case 5:
					return N5;
				case 6:
					return N6;
				case 7:
					return N7;
				case 8:
					return N8;
				case 9:
					return N9;
				default:
					return 0;
			}
		}
	}
}