package com.novabox.graph 
{
	/**
	 * Graph - Djikstra Example
	 * 
	 * @author Ophir / Nova-box
	 * @version 1.0
	 */
	 
	public class Node
	{
		private var label:String;
		private var links:Array;
		
		public function Node(_label:String) 
		{
			label = _label;
			links = new Array();
		}
	
		public function GetLabel() : String
		{
			return label;
		}
		
		public function AddLink(_target:Node, _value:Number) : void
		{
			var link:Link = new Link(_target, _value);
			links.push(link);
		}
		
		public function GetLinks() : Array
		{
			return links;
		}
	}

}