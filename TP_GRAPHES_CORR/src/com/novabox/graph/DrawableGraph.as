package com.novabox.graph 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author me
	 */
	public class DrawableGraph extends Graph
	{
		public static const NODE_COLOR:int = 0x006600;
		public static const NODE_RADIUS:Number = 20;
		public static const NODE_LABEL_FORMAT:TextFormat = new TextFormat("Arial", 16, 0XFFFFFF);
		private static const ARROW_SIZE:Number = 10;
		
		protected var nodePositions : Array;
		protected var nodeSprites:Array;
		protected var graphSprite : Sprite;
		
		public function DrawableGraph() 
		{
			nodePositions = new Array();
			nodeSprites = new Array();
			graphSprite = new Sprite();
		}
		
		
		public function AddNodeWithPosition(_label:String, _position:Point) : void
		{
			super.AddNode(_label);
			
			SetNodePosition(_label, _position);
			
		}
		
		public function SetNodePosition(_label:String,_position:Point) : void
		{
			var node:Node = GetNode(_label);
			if (node != null) {
				nodePositions[_label] = _position;
			}
			
		}

		public function GetNodePosition(_label:String) : Point
		{
			var node:Node = GetNode(_label);
			
			if (node != null) {
				return nodePositions[_label] ;
			}
			return null;
		}
		
		public function GetSprite() : Sprite {
			return graphSprite;
			
		}
		
		public function Draw() : void {
			DrawNodes();
			Drawlinks();
		}
		public function DrawNodes() : void {
			for each(var node:Node in nodes) {
				//Dessiner un node
				DrawNode(node);

			}
		}
		
		public function DrawNode(_node:Node) : void {
			
			var nodeSprite:Sprite = new Sprite();
			
			nodeSprites[_node.GetLabel()] = nodeSprite;
			
			nodeSprite.graphics.beginFill(NODE_COLOR, 1);
			nodeSprite.graphics.drawCircle(0, 0, NODE_RADIUS);
			nodeSprite.graphics.endFill();
			
			var labelText:TextField = new TextField();
			
			labelText.text = _node.GetLabel();
			labelText.autoSize = TextFieldAutoSize.CENTER;
			labelText.setTextFormat(NODE_LABEL_FORMAT);
			nodeSprite.addChild(labelText);
			labelText.x = -labelText.textWidth / 2;
			labelText.y = -labelText.textHeight / 2;
			
			graphSprite.addChild(nodeSprite);
			
			var position:Point = GetNodePosition(_node.GetLabel());
			
			nodeSprite.x = position.x;
			nodeSprite.y = position.y;
		}
		
		public function Drawlinks():void {
			
			for each(var node:Node in nodes) {
				DrawNodeLinks(node);
			}
			
			
		}
		
		public function DrawNodeLinks(_node:Node) : void {
			var links : Array = _node.GetLinks();
			
			for each(var link:Link in links) {
				DrawLink(_node.GetLabel(), link.GetTarget().GetLabel(), link.GetValue());
			}
			
		}
		
		public function DrawLink(_sourceLabel:String, _targetLabel:String, _value:Number) : void
		{
			var sourcePosition:Point = GetNodePosition(_sourceLabel);
			var targetPosition:Point = GetNodePosition(_targetLabel);
			
			var linkVector:Point = targetPosition.subtract(sourcePosition);
			
			var offsetVector:Point = new Point(linkVector.x, linkVector.y);
			offsetVector.normalize(NODE_RADIUS);
			
			var linkSprite:Sprite = new Sprite();
			
			linkVector.normalize(linkVector.length - NODE_RADIUS * 2);
			
			linkSprite.graphics.lineStyle(2,0);
			linkSprite.graphics.moveTo(0, 0);
			linkSprite.graphics.lineTo(linkVector.x, linkVector.y);
			
			graphSprite.addChild(linkSprite);
			
			linkSprite.x = sourcePosition.x + offsetVector.x;
			linkSprite.y = sourcePosition.y + offsetVector.y;
			
			var arrow:Sprite = new Sprite();
			
			arrow.graphics.beginFill(0, 1);
			arrow.graphics.lineStyle(2, 0);
			arrow.graphics.moveTo( -ARROW_SIZE, -ARROW_SIZE);
			arrow.graphics.lineTo( -ARROW_SIZE, ARROW_SIZE);
			arrow.graphics.lineTo(ARROW_SIZE, 0);
			arrow.graphics.lineTo( -ARROW_SIZE, -ARROW_SIZE);
			arrow.graphics.endFill();
			
			var arrowRotation:Number = Math.atan2(linkVector.y, linkVector.x);
			
			arrow.rotation = arrowRotation;
			
			linkSprite.addChild(arrow);
		}
		
	}

}