package com.fttsh.apps.mobile.g.model.vo
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	[Bindable]
	[Table(name="POIInfo")]
//	FOREIGN KEY ([POICategoryID])
//	REFERENCES [POICategory]([POICategoryID])
	/**
	 * POIInfo.as class.   	
	 * @author knight.zhou
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Jul 21, 2010 1:48:49 PM
	 */   	 
	public class POIInfo
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		[Id]
		[Column(name="POIID")]
		public var POIID:int;
		
		[Column(name="POICategoryID")]
		public var POICategoryID:String;
		
		[Column(name="POIPointX")]
		public var POIPointX:int;
		
		[Column(name="POIPointY")]
		public var POIPointY:int;
		
		[Column(name="POINameEnglish")]
		public var POINameEnglish:String;
		
		[Column(name="POINameChinese")]
		public var POINameChinese:String;
		
		[Column(name="POITips")]
		public var POITips:String;
		
		[Column(name="POIIntroduction")]
		public var POIIntroduction:String;
		
		[Column(name="POIBusinessHours")]
		public var POIBusinessHours:String;
		
		[Column(name="POICost")]
		public var POICost:String;
		
		[Column(name="POIStar")]
		public var POIStar:String;
		
		[Column(name="POIDistance")]
		public var POIDistance:String;
		
		[Column(name="POITelephone")]
		public var POITelephone:String;
		
		[Column(name="POIAddress")]
		public var POIAddress:String;
		
		[Column(name="POIWebsite")]
		public var POIWebsite:String;
		
		[Column(name="POISubway")]
		public var POISubway:String;
		
		[Column(name="POIWhereto")]
		public var POIWhereto:String;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//-------------------------------------------------------------------------- 
		
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
		public function POIInfo()
		{
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
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
	}
	
}