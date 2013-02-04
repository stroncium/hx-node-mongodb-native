var $estr = function() { return js.Boot.__string_rec(this,''); };
var async = async || {}
async.Build = function() { }
var Test = function() { }
Test.__interfaces__ = [async.Build];
Test.goAsync = function(cb) {
	node.Fs.readdir(".",function(__e,list) {
		if(__e == null) {
			console.log(list);
			node.Fs.readFile("text","utf8",function(__e1,text) {
				if(__e1 == null) {
					console.log(text);
					cb(null);
				} else cb(__e1);
			});
		} else cb(__e);
	});
}
Test.main = function() {
	Test.goAsync(Test.afterAsync);
}
Test.afterAsync = function(error) {
	if(error == null) console.log("success"); else console.log("error: " + error);
}
var node = node || {}
if(!node.Fs) node.Fs = {}
node.Fs.FileOpenFlags = { __constructs__ : ["Read","R","ReadWrite","RPlus","ReadSync","RS","ReadWriteSync","RSPlus","Write","W","WriteExclusive","WX","WriteRead","WPlus","WriteReadExclusive","WXPlus","Append","A","AppendExclusive","AX","ReadAppend","APlus","ReadAppendExclusive","AXPlus","Custom"] }
node.Fs.FileOpenFlags.Read = ["Read",0];
node.Fs.FileOpenFlags.Read.toString = $estr;
node.Fs.FileOpenFlags.Read.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.R = ["R",1];
node.Fs.FileOpenFlags.R.toString = $estr;
node.Fs.FileOpenFlags.R.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.ReadWrite = ["ReadWrite",2];
node.Fs.FileOpenFlags.ReadWrite.toString = $estr;
node.Fs.FileOpenFlags.ReadWrite.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.RPlus = ["RPlus",3];
node.Fs.FileOpenFlags.RPlus.toString = $estr;
node.Fs.FileOpenFlags.RPlus.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.ReadSync = ["ReadSync",4];
node.Fs.FileOpenFlags.ReadSync.toString = $estr;
node.Fs.FileOpenFlags.ReadSync.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.RS = ["RS",5];
node.Fs.FileOpenFlags.RS.toString = $estr;
node.Fs.FileOpenFlags.RS.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.ReadWriteSync = ["ReadWriteSync",6];
node.Fs.FileOpenFlags.ReadWriteSync.toString = $estr;
node.Fs.FileOpenFlags.ReadWriteSync.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.RSPlus = ["RSPlus",7];
node.Fs.FileOpenFlags.RSPlus.toString = $estr;
node.Fs.FileOpenFlags.RSPlus.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.Write = ["Write",8];
node.Fs.FileOpenFlags.Write.toString = $estr;
node.Fs.FileOpenFlags.Write.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.W = ["W",9];
node.Fs.FileOpenFlags.W.toString = $estr;
node.Fs.FileOpenFlags.W.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.WriteExclusive = ["WriteExclusive",10];
node.Fs.FileOpenFlags.WriteExclusive.toString = $estr;
node.Fs.FileOpenFlags.WriteExclusive.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.WX = ["WX",11];
node.Fs.FileOpenFlags.WX.toString = $estr;
node.Fs.FileOpenFlags.WX.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.WriteRead = ["WriteRead",12];
node.Fs.FileOpenFlags.WriteRead.toString = $estr;
node.Fs.FileOpenFlags.WriteRead.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.WPlus = ["WPlus",13];
node.Fs.FileOpenFlags.WPlus.toString = $estr;
node.Fs.FileOpenFlags.WPlus.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.WriteReadExclusive = ["WriteReadExclusive",14];
node.Fs.FileOpenFlags.WriteReadExclusive.toString = $estr;
node.Fs.FileOpenFlags.WriteReadExclusive.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.WXPlus = ["WXPlus",15];
node.Fs.FileOpenFlags.WXPlus.toString = $estr;
node.Fs.FileOpenFlags.WXPlus.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.Append = ["Append",16];
node.Fs.FileOpenFlags.Append.toString = $estr;
node.Fs.FileOpenFlags.Append.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.A = ["A",17];
node.Fs.FileOpenFlags.A.toString = $estr;
node.Fs.FileOpenFlags.A.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.AppendExclusive = ["AppendExclusive",18];
node.Fs.FileOpenFlags.AppendExclusive.toString = $estr;
node.Fs.FileOpenFlags.AppendExclusive.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.AX = ["AX",19];
node.Fs.FileOpenFlags.AX.toString = $estr;
node.Fs.FileOpenFlags.AX.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.ReadAppend = ["ReadAppend",20];
node.Fs.FileOpenFlags.ReadAppend.toString = $estr;
node.Fs.FileOpenFlags.ReadAppend.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.APlus = ["APlus",21];
node.Fs.FileOpenFlags.APlus.toString = $estr;
node.Fs.FileOpenFlags.APlus.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.ReadAppendExclusive = ["ReadAppendExclusive",22];
node.Fs.FileOpenFlags.ReadAppendExclusive.toString = $estr;
node.Fs.FileOpenFlags.ReadAppendExclusive.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.AXPlus = ["AXPlus",23];
node.Fs.FileOpenFlags.AXPlus.toString = $estr;
node.Fs.FileOpenFlags.AXPlus.__enum__ = node.Fs.FileOpenFlags;
node.Fs.FileOpenFlags.Custom = function(s) { var $x = ["Custom",24,s]; $x.__enum__ = node.Fs.FileOpenFlags; $x.toString = $estr; return $x; }
if(!node.stream) node.stream = {}
node.stream.Readable = function() { }
node.HaxeInit = function() { }
node.WritableStream = function() { }
if(!node.mongodb) node.mongodb = {}
node.mongodb.HaxeInit = function() { }
node.Fs = require('fs');
node.Fs.FileOpenFlags = {Read: 'r', R: 'r',ReadWrite: 'r+', RPlus: 'r+',ReadSync: 'rs', RS: 'rs',ReadWriteSync: 'rs+', RSPlus: 'rs+',Write: 'w', W: 'w',WriteExclusive: 'wx', WX: 'wx',WriteRead: 'w+', WPlus: 'w+',WriteReadExclusive: 'wx+', WXPlus: 'wx+',Append: 'a', A: 'a',AppendExclusive: 'ax', AX: 'ax',ReadAppend: 'a+', APlus: 'a+',ReadAppendExclusive: 'ax+', AXPlus: 'ax+', Custom: function(s){return s;}}
node.Fs.SymlinkType = {Dir:'dir', File:'file', Junction:'junction', Custom: function(s){return s;} }
var node = node || {}
node.mongodb = require('mongodb');
Test.main();
