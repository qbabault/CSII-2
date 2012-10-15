package com.novabox.graph 
{
	/**
	 * Graph - Djikstra Example
	 * 
	 * @author Ophir / Nova-box
	 * @version 1.0
	 */
	 
	public class Graph
	{
		protected var nodes:Array;
		
		public function Graph() 
		{
			nodes = new Array();
		}
		
		public function AddNode(_label:String) : void
		{
			var node:Node = new Node(_label);
			nodes.push(node);
		}
		
		public function AddLink(_sourceLabel:String, _targetLabel:String, _value:Number) : void
		{
			var sourceNode:Node = GetNode(_sourceLabel);
			var targetNode:Node = GetNode(_targetLabel);
			
			if ((sourceNode != null) && (targetNode != null))
			{
				sourceNode.AddLink(targetNode, _value);
			}
		}
		
		public function GetNode(_label:String) : Node
		{
			for (var i:int = 0; i < nodes.length; i++)
			{
				var node:Node = (nodes[i] as Node);
				if (node.GetLabel() == _label)
				{
					return node;
				}
			}
			return null;
		}
			
		public function Trace() : void
		{
			for (var i:int = 0; i < nodes.length; i++)
			{
				var node:Node = (nodes[i] as Node);
				var links:Array = node.GetLinks();
				
				for (var j:int = 0; j < links.length; j++)
				{
					var link:Link = (links[j] as Link);
					var linkedNode:Node = link.GetTarget();
					
					trace(node.GetLabel() + " -> " + linkedNode.GetLabel() + " (" + link.GetValue() + ")");
				}
			}
		}
		
		
		
	}

}