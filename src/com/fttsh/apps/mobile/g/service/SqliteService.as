package com.fttsh.apps.mobile.g.service
{
	import com.fttsh.apps.mobile.g.Constants;
	import com.fttsh.apps.mobile.g.events.SqliteLoadEvent;
	import com.fttsh.apps.mobile.g.model.SqliteModel;
	import com.fttsh.apps.mobile.g.model.vo.NeighborhoodInfo;
	import com.fttsh.apps.mobile.g.model.vo.POICategory;
	import com.fttsh.apps.mobile.g.model.vo.POIImages;
	import com.fttsh.apps.mobile.g.model.vo.POIInfo;
	import com.fttsh.apps.mobile.g.model.vo.POINeighborhood;
	import com.fttsh.apps.mobile.g.model.vo.UserInfo;
	import com.fttsh.apps.mobile.g.utils.ArrayCollectionUtils;
	import com.fttsh.apps.mobile.g.utils.LogUtil;
	
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLSchemaResult;
	import flash.data.SQLStatement;
	import flash.errors.SQLError;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.rpc.Responder;
	
	import nz.co.codec.flexorm.EntityManager;
	import nz.co.codec.flexorm.EntityManagerAsync;
	
	import org.robotlegs.mvcs.Actor;

	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * SqliteService.as class.   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 9.0
	 * Created Nov 23, 2010 5:01:10 PM
	 */   	 
	public class SqliteService extends Actor implements ISqliteService
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var model:SqliteModel;
		//
//		protected var em:EntityManager = EntityManager.instance;
//		protected var emAsyc:EntityManagerAsync = EntityManagerAsync.instance;
		private var sqlConnection:SQLConnection;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(SqliteService);
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
		public function SqliteService()
		{
			//TODO: implement function
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		public function load():void
		{
			var dbFile:File = File.applicationDirectory.resolvePath(Constants.DB_FILE_PATH);
			this.sqlConnection = new SQLConnection();
			//
			try
			{
//				this.sqlConnection.open(dbFile);
				this.sqlConnection.openAsync(dbFile);
				this.sqlConnection.addEventListener(SQLEvent.OPEN,function(event:SQLEvent):void
				{
					findAll(Constants.DB_TABLE_NEIGHBORHOOD_INFO);
					findAll(Constants.DB_TABLE_POI_CATEGORY);
					findAll(Constants.DB_TABLE_POI_IMAGES);
					findAll(Constants.DB_TABLE_POI_INFO);
					findAll(Constants.DB_TABLE_POI_NEIGHBORHOOD);
					findAll(Constants.DB_TABLE_USER_INFO);
					//loaded sqlite data entities to model.
					//			this.model.loadedNeighborhoodInfos = em.findAll(NeighborhoodInfo);
					//			var neighborhoodInfo:NeighborhoodInfo = new NeighborhoodInfo();
					//			neighborhoodInfo.NeighborhoodImage  = "asdfa";
					//			neighborhoodInfo.NeighborhoodInfoID  = 0;
					//			neighborhoodInfo.NeighborhoodName = "name00";
					//			this.em.save(neighborhoodInfo);
					//			var result:Object = this.em.loadItem(NeighborhoodInfo,0);
					//
//					model.loadedPOICategorys = em.findAll(POICategory);
					//			this.model.loadedPOIImages = em.findAll(POIImages);
					//			this.model.loadedPOIInfos = em.findAll(POIInfo);
					//			this.model.loadedPOINeighborhoods = em.findAll(POINeighborhood);
					//			this.model.loadedUserInfos = em.findAll(UserInfo);
					//dispatch robotlegs sytem events;
				});
//				em.sqlConnection  = sqlConnection;
//				emAsyc.sqlConnection = this.sqlConnection;
			}catch(error:SQLError)
			{
				LOG.fatal(Constants.MSG_ERROR_DB_CONNECTION,error.details);
			}
		}
		
		virtual public function save(value:Object):void
		{
			//TODO: implement function
		}
		
		public function remove(value:Object):void
		{
			this.sqlConnection.close();
		}    
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
		
		private function findAll(tabelName:String):void
		{
			var _tableName:String = tabelName;
			var sql:String = String("SELECT * FROM ").concat(_tableName);
			var sqlStateMent:SQLStatement = new SQLStatement();
			sqlStateMent.sqlConnection = sqlConnection;
			sqlStateMent.text = sql;
			sqlStateMent.execute();
			sqlStateMent.addEventListener(SQLErrorEvent.ERROR,function(event:SQLErrorEvent):void
			{
				LOG.error(event.text);
			});
			sqlStateMent.addEventListener(SQLEvent.RESULT,function(event:SQLEvent):void
			{
				var sqlResult:SQLResult =  sqlStateMent.getResult();
				//
				switch(_tableName)
				{
					case Constants.DB_TABLE_NEIGHBORHOOD_INFO:
						model.loadedNeighborhoodInfos = new ArrayCollection(sqlResult.data);
						break;
					case Constants.DB_TABLE_POI_CATEGORY:
						model.loadedPOICategorys = new ArrayCollection(sqlResult.data);
						break;
					case Constants.DB_TABLE_POI_IMAGES:
						model.loadedPOIImages = new ArrayCollection(sqlResult.data);
						break;
					case Constants.DB_TABLE_POI_INFO:
						model.loadedPOIInfos = new ArrayCollection(sqlResult.data);
						break;
					case Constants.DB_TABLE_POI_NEIGHBORHOOD:
						model.loadedPOINeighborhoods = new ArrayCollection(sqlResult.data);
						break;
					case Constants.DB_TABLE_USER_INFO:
						model.loadedUserInfos = new ArrayCollection(sqlResult.data);
						//
						dispatch(new SqliteLoadEvent(SqliteLoadEvent.SQLITE_LOAD_COMPLETE));
						break;
					default:
						break;
				}
			});
		}
	}
	
}