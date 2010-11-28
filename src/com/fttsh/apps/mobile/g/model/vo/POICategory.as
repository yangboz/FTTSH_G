package com.fttsh.apps.mobile.g.model.vo
{
	import mx.collections.IList;

	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	[Bindable]
	[Table(name="POICategory")]
//	PRIMARY KEY ([POICategoryID])
	/**
	 * POICategory.as class.   	
	 * @author knight.zhou
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Jul 21, 2010 10:35:19 AM
	 */   	 
	public class POICategory
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		[Id]
//		[Column(name="POICategoryID")]
		public var POICategoryID:String;
		
		[Column(name="POICategoryNameChinese")]
		public var POICategoryNameChinese:String;
		
		[Column(name="POICategoryNameEnglish")]
		public var POICategoryNameEnglish:String;
		
		[Column(name="POICategoryImage")]
		public var POICategoryImage:String;
		
		[Column(name="POICategoryNameImage")]
		public var POICategoryNameImage:Object;
		
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