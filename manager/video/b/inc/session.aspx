<script language="jscript" runat="server">
var Mosession={
	_d:new Date(1970,0,1),
	SessionId:"",
	Timeout:120000,
	Refresh:function(){Application.Lock();Application(this.SessionId)=(new Date())-this._d;Application.UnLock();},
	New:function(){this.SessionId=Math.random().toString();this.Refresh();},
	Init:function(){this.SessionId=(""+Request.QueryString("sessionid")+"");if(this.SessionId=="undefined")this.New();},
	Get:function(key){
		if(this.SessionId==""){
			this.New();
			return "";
		}
		var date = Application(this.SessionId);
		if(typeof date=="number"){
			var d = parseInt(((new Date())-this._d-date)/1000);
			if(d>this.Timeout)return "";
		}else{
			return "";	
		}
		this.Refresh();
		return Application.Contents(this.SessionId+"_"+key);
	},
	Set:function(key,value){if(this.SessionId=="")return;Application.Lock();Application(this.SessionId+"_"+key)=value;Application.UnLock();this.Refresh();}
};
function Session_(key,value){
	if(key==undefined || key=="")return Mosession.SessionId;
	if(value==undefined)return Mosession.Get(key);
	Mosession.Set(key,value);
	return Mosession.SessionId;
}
Mosession.Init();
</script>