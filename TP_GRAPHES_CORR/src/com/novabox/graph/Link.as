package com.novabox.graph 
{
	/**
	 * Graph - Djikstra Example
	 * 
	 * @author Ophir / Nova-box
	 * @version 1.0
	 */
	 
	public class Link
	{
		
		private var value:Number;
		private var target:Node;
		
		public function Link(_target:Node, _value:Number) 
		{
			target = _target;
			SetValue(_value);
		}
		
		public function GetValue() : Number
		{
			return value;
		}
		
		public function GetTarget() : Node
		{
			return target;
		}
		
		public function SetValue(_value:Number) : void
		{
			value = _value;
		}
		
	}

}