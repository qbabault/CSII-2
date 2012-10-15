package com.novabox.graph
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	
	/**
	 * Graph - Djikstra Example
	 * 
	 * @author Ophir / Nova-box
	 * @version 1.0
	 */
	 
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var graph:DrawableGraph = new DrawableGraph();
			
			graph.AddNodeWithPosition("A", new Point(20,30));
			graph.AddNodeWithPosition("B", new Point(150,30));
			graph.AddNodeWithPosition("C", new Point(60,100));
			graph.AddNodeWithPosition("D", new Point(20,200));
			graph.AddNodeWithPosition("E", new Point(150,200));
			
			graph.AddLink("A", "B", 5);
			graph.AddLink("A", "C", 5);
			graph.AddLink("B", "C", 5);
			graph.AddLink("B", "E", 10);
			graph.AddLink("E", "D", 10);
			
			
			graph.Trace();
			
			graph.Draw();
			
			var graphSprite:Sprite = graph.GetSprite();
			
			addChild(graphSprite);
		}
		
	}
	
}