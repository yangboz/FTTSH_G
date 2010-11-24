package com.fttsh.apps.mobile.g.model.vo
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	[Bindable]
	[Table(name="POIImages")]
//	FOREIGN KEY ([POIID])
//	REFERENCES [POIInfo]([POIID])
	/**
	 * POIImages.as class.   	
	 * @author knight.zhou
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Jul 21, 2010 12:05:50 PM
	 */   	 
	public class POIImages
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		[Id]
		[Column(name="POIImagesID")]
		public var POIImagesID:int;
		
		[Column(name="POIID")]
		public var POIID:int;
		
		[Column(name="POIImagesPath")]
		public var POIImagesPath:String;
		
		[Column(name="POIImagesLevel")]
		public var POIImagesLevel:int;
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
		public function POIImages()
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