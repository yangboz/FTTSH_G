package com.fttsh.apps.mobile.g.views.components
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import assets.EmbededAssets;
	
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	
	import spark.components.Image;
	import spark.components.TextInput;
	
	/**
	 * SearchTexInput.as class.Custom this Text Input with icon inside like mac os x search text input with prompting text.
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Nov 26, 2010 2:57:42 PM
	 */   	 
	public class SearchTexInput extends TextInput
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		private var _image:Image;
		private var _promptText:String;
		//
		protected var focused:Boolean;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		
		//----------------------------------------------------------------------
		//
		//    States
		//
		//----------------------------------------------------------------------
		
		[SkinState("focused")];
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//-------------------------------------------------------------------------- 
		public function get promptText():String
		{
			return _promptText;
		}
		//
		public function set promptText(value:String):void
		{
			_promptText = value;
		}
		//--------------------------------------------------------------------------
		//
		//  Protected properties
		//
		//-------------------------------------------------------------------------- 
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		public function SearchTexInput()
		{
			//TODO: implement function
			super();
			//
		}     	
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		override protected function createChildren():void
		{
			super.createChildren();
			
			_image = new Image();
			_image.source = EmbededAssets.ICON_OCTOPUS;
			//
			addChild(_image);
			//
			_image.addEventListener(MouseEvent.CLICK,imageClickHandler);
			//
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			this._image.width = 16;
			this._image.height = 16;
			
			this._image.x = this.width - this._image.width - 5;
			this._image.y = this.height - this._image.height;
			
			this.textField.width = this.width - this._image.width - 5;
		}
		//
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if (instance == this.textView)
			{
				this.textView.addEventListener(FocusEvent.FOCUS_IN, onFocusInHandler);
				this.textView.addEventListener(FocusEvent.FOCUS_OUT, onFocusOutHandler);
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			
			if (instance == this.textView)
			{
				this.textView.removeEventListener(FocusEvent.FOCUS_IN, onFocusInHandler);
				this.textView.removeEventListener(FocusEvent.FOCUS_OUT, onFocusOutHandler);
			}
		}
		
		override protected function getCurrentSkinState():String
		{
			if (focused)
			{
				return "focused";
			}
			else
			{
				return super.getCurrentSkinState();
			}
		}

		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		//
		private function imageClickHandler(event:MouseEvent):void
		{
			this.text = "";
		}
		//
		private function onFocusInHandler(event:FocusEvent):void
		{
			focused = true;
			invalidateSkinState();
		}
		
		private function onFocusOutHandler(event:FocusEvent):void
		{
			focused = false;
			invalidateSkinState();
		}

	}
	
}