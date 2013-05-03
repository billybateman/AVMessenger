class fm.core.FMview extends mx.core.View
{
    var _name, loadList, dispatchEvent, loadedList, doLater, __get__fmCopyright, __get__fmVersion;
    function FMview()
    {
        super();
    } // End of the function
    function get fmCopyright()
    {
        return (this.getFMcopyright());
    } // End of the function
    function get fmVersion()
    {
        return (this.getFMVersion());
    } // End of the function
    function getFMcopyright()
    {
        return (fm.core.FMview.FMcopyright);
    } // End of the function
    function getFMVersion()
    {
        return (fm.core.FMview.FMversion);
    } // End of the function
    function tracer(msg, traceLevel, varName)
    {
        if (tracerLevel + 1 > 0)
        {
            if (typeof(traceLevel) == "string")
            {
                varName = traceLevel;
                traceLevel = 0;
            } // end if
            if (traceLevel < tracerLevel + 1)
            {
                varName = varName == undefined ? ("") : ("." + varName);
                var _loc2 = _name + "." + varName;
                switch (typeof(msg))
                {
                    case "object":
                    {
                        this.objTrace(msg, _loc2);
                        break;
                    } 
                    case "null":
                    {
                        trace (_loc2 + " value is null");
                        break;
                    } 
                    default:
                    {
                        trace (_loc2 + ": " + msg);
                        break;
                    } 
                } // End of switch
                trace (" ");
            } // end if
        } // end if
    } // End of the function
    function objTrace(obj, parentObj, run)
    {
        parentObj = parentObj == undefined ? ("") : (parentObj);
        run = run == undefined ? (500) : (run--);
        for (var _loc6 in obj)
        {
            var _loc2 = parentObj + "." + _loc6;
            if (typeof(obj[_loc6]) == "object")
            {
                trace (_loc2);
                if (run > 0)
                {
                    this.objTrace(obj[_loc6], "  " + _loc2, run);
                } // end if
                continue;
            } // end if
            trace (_loc2 + "=" + obj[_loc6]);
        } // end of for...in
    } // End of the function
    function randRange(min, max)
    {
        var _loc1 = Math.round(Math.random() * (max - min)) + min;
        return (_loc1);
    } // End of the function
    function copyObject(n)
    {
        var _loc2 = new Object();
        for (var _loc3 in n)
        {
            if (_loc3 !== "__ID__")
            {
                _loc2[_loc3] = n[_loc3];
            } // end if
        } // end of for...in
        return (_loc2);
    } // End of the function
    function copy(refObj)
    {
        var _loc2 = new Function(refObj.__proto__.constructor)();
        this.copyProperties(_loc2, refObj);
        return (_loc2);
    } // End of the function
    function copyProperties(dstObj, srcObj)
    {
        var _loc7;
        for (var _loc8 in srcObj)
        {
            _loc7 = typeof(srcObj[_loc8]);
            if (_loc7 != "function")
            {
                if (_loc7 == "object")
                {
                    if (srcObj[_loc8] instanceof Array)
                    {
                        var _loc6 = new Array();
                        var _loc4 = srcObj[_loc8];
                        for (var _loc3 = 0; _loc3 < _loc4.length; ++_loc3)
                        {
                            _loc6[_loc3] = _loc4[_loc3];
                        } // end of for
                        dstObj[_loc8] = _loc6;
                    }
                    else if (srcObj[_loc8] instanceof String)
                    {
                        dstObj[_loc8] = new String(srcObj[_loc8]);
                    }
                    else if (srcObj[_loc8] instanceof Number)
                    {
                        dstObj[_loc8] = new Number(srcObj[_loc8]);
                    }
                    else if (srcObj[_loc8] instanceof Boolean)
                    {
                        dstObj[_loc8] = new Boolean(srcObj[_loc8]);
                    }
                    else
                    {
                        dstObj[_loc8] = this.copy(srcObj[_loc8]);
                    } // end else if
                    continue;
                } // end if
                dstObj[_loc8] = srcObj[_loc8];
            } // end if
        } // end of for...in
    } // End of the function
    function checkLoadProgress()
    {
        for (var _loc7 in loadList)
        {
            var _loc2 = loadList[_loc7];
            _loc2.loaded = _loc2.obj.getBytesLoaded();
            _loc2.total = _loc2.obj.getBytesTotal();
            if (_loc2.total > 0)
            {
                _loc2.obj._visible = false;
                this.dispatchEvent({type: "progress", target: _loc2.obj, current: _loc2.loaded, total: _loc2.total});
                if (_loc2.loaded == _loc2.total)
                {
                    if (loadedList == undefined)
                    {
                        loadedList = new Object();
                    } // end if
                    loadedList[_loc7] = _loc2;
                    delete loadList[_loc7];
                    this.doLater(this, "contentLoaded");
                }
                else
                {
                    this.doLater(this, "checkLoadProgress");
                } // end else if
                continue;
            } // end if
            if (_loc2.total == -1)
            {
                if (_loc2.failedOnce != undefined)
                {
                    ++_loc2.failedOnce;
                }
                else
                {
                    _loc2.failedOnce = 0;
                } // end if
            } // end else if
            this.doLater(this, "checkLoadProgress");
        } // end of for...in
    } // End of the function
    static var symbolName = "FMview";
    static var symbolOwner = fm.core.FMview;
    static var FMversion = "rc.1.0.0";
    static var FMcopyright = "Copyright (C) 2004 - 2005 Scott Richter / BanTV / FLYnMonkey. All Rights Reserved.  The following Code is subject to all restrictions on such code as contained in the End User License Agreement accompanying this product.  A license must be uptained for comerical use.";
    var tracerLevel = 0;
    var className = "FMview";
} // End of Class
