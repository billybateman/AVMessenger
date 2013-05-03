class com.bjc.core.BJCComponent extends MovieClip
{
    var _x, _y, __focusTime, __get__focusTime, __height, __width, __set__disabledAlpha, __get__disabledAlpha, __set__enabled, __get__enabled, __set__focusTime, __set__height, __get__height, __set__keyEnabled, __get__keyEnabled, __set__style, __set__width, __get__width;
    function BJCComponent(Void)
    {
        super();
        this.init();
    } // End of the function
    function init(Void)
    {
        var _loc1 = this;
        _root._focusrect = false;
        _loc1.focusEnabled = true;
        _loc1.__width = _loc1._width;
        _loc1.__height = _loc1._height;
        _loc1._xscale = 100;
        _loc1._yscale = 100;
        _loc1.__boundingbox._width = 0;
        _loc1.__boundingbox._height = 0;
        _loc1.__boundingbox._visible = false;
        _loc1.initFromClipParameters();
        _loc1.createChildren();
    } // End of the function
    function createChildren(Void)
    {
    } // End of the function
    function draw(Void)
    {
    } // End of the function
    function size(Void)
    {
    } // End of the function
    function move(x, y)
    {
        this._x = x;
        this._y = y;
    } // End of the function
    function doInvalidation(Void)
    {
        var _loc3 = this;
        var _loc2 = _loc3.__doLaterQueue.slice(0);
        _loc3.__doLaterQueue = new Array();
        while (_loc2.length > 0)
        {
            var _loc1 = Function(_loc2.shift());
            _loc1.func.apply(_loc1.obj);
        } // end while
        _loc3.draw();
        delete _loc3.__invalidateClip.onEnterFrame;
    } // End of the function
    function doLater(obj, func)
    {
        var _loc2 = this;
        if (_loc2.__doLaterQueue == undefined)
        {
            _loc2.__doLaterQueue = new Array();
        } // end if
        var numFuncs = _loc2.__doLaterQueue.length;
        var _loc3 = false;
        for (var _loc1 = 0; _loc1 < numFuncs; ++_loc1)
        {
            if (_loc2.__doLaterQueue[_loc1].func == func && _loc2.__doLaterQueue[_loc1].obj == obj)
            {
                _loc3 = true;
            } // end if
        } // end of for
        if (!_loc3)
        {
            _loc2.__doLaterQueue.push({obj: obj, func: func});
        } // end if
        _loc2.invalidate();
    } // End of the function
    function initFromClipParameters(Void)
    {
        var _loc1 = this;
        var found = false;
        for (var _loc3 in _loc1.clipParameters)
        {
            if (_loc1.hasOwnProperty(_loc3))
            {
                found = true;
                _loc1["def_" + _loc3] = _loc1[_loc3];
                delete _loc1[_loc3];
            } // end if
        } // end of for...in
        if (found)
        {
            for (var _loc3 in _loc1.clipParameters)
            {
                var _loc2 = _loc1["def_" + _loc3];
                if (_loc2 != undefined)
                {
                    _loc1[_loc3] = _loc2;
                } // end if
            } // end of for...in
        } // end if
    } // End of the function
    function hideFocus(Void)
    {
        var _loc1 = this;
        _loc1.__focusTimer = 0;
        clearInterval(_loc1.__focusInterval);
        _loc1.__focus._visible = false;
    } // End of the function
    function showFocus(Void)
    {
        var _loc1 = this;
        if (_global.bitFocusTime != undefined)
        {
            _loc1.__focusLimit = _global.bitFocusTime;
        } // end if
        if (_loc1.__focusTime != undefined)
        {
            _loc1.__focusLimit = _loc1.__focusTime;
        } // end if
        _loc1.__focusTimer = 0;
        if (_loc1.__focusLimit >= 100 && _loc1.tabIndex != undefined)
        {
            clearInterval(_loc1.__focusInterval);
            _loc1.__focus._visible = true;
            _loc1.__focusInterval = setInterval(_loc1, "checkFocus", 100);
        } // end if
    } // End of the function
    function checkFocus(Void)
    {
        var _loc1 = this;
        _loc1.__focusTimer = _loc1.__focusTimer + 100;
        if (_loc1.__focusTimer > _loc1.__focusLimit)
        {
            _loc1.hideFocus();
        } // end if
    } // End of the function
    function invalidate(Void)
    {
        var _loc1 = this;
        if (_loc1.__invalidateClip == undefined)
        {
            _loc1.createEmptyMovieClip("__invalidateClip", -1);
        } // end if
        _loc1.__invalidateClip.onEnterFrame = mx.utils.Delegate.create(_loc1, _loc1.doInvalidation);
    } // End of the function
    static function mergeClipParameters(subParams, superParams)
    {
        var _loc1 = superParams;
        var _loc2 = subParams;
        for (var _loc3 in _loc1)
        {
            _loc2[_loc3] = _loc1[_loc3];
        } // end of for...in
        return (true);
    } // End of the function
    function remove(Void)
    {
        var _loc1 = this;
        if (_loc1.getDepth() > 1048575)
        {
            _loc1.swapDepths(1048575);
        } // end if
        if (_loc1.getDepth() < 0)
        {
            _loc1.swapDepths(0);
        } // end if
        _loc1.removeMovieClip();
    } // End of the function
    function setSize(w, h)
    {
        var _loc1 = this;
        if (w != undefined)
        {
            _loc1.__width = w;
        } // end if
        if (h != undefined)
        {
            _loc1.__height = h;
        } // end if
        _loc1._xscale = 100;
        _loc1._yscale = 100;
        _loc1.size();
    } // End of the function
    function set disabledAlpha(a)
    {
        var _loc1 = this;
        _loc1.__alphaDisabled = a;
        _loc1.invalidate();
        //return (_loc1.disabledAlpha());
    } // End of the function
    function get disabledAlpha()
    {
        return (this.__alphaDisabled);
    } // End of the function
    function set enabled(b)
    {
        var _loc1 = this;
        _loc1.__enabled = b;
        _loc1.invalidate();
        //return (_loc1.enabled());
    } // End of the function
    function get enabled()
    {
        return (this.__enabled);
    } // End of the function
    function set focusTime(t)
    {
        this.__focusTime = t;
        //return (this.focusTime());
        null;
    } // End of the function
    function get focusTime()
    {
        return (this.__focusTime);
    } // End of the function
    function set height(h)
    {
        var _loc1 = this;
        _loc1.setSize(_loc1.__width, h);
        //return (_loc1.height());
    } // End of the function
    function get height()
    {
        return (this.__height);
    } // End of the function
    function set keyEnabled(b)
    {
        var _loc1 = this;
        _loc1.__keyEnabled = b;
        _loc1.invalidate();
        //return (_loc1.keyEnabled());
    } // End of the function
    function get keyEnabled()
    {
        return (this.__keyEnabled);
    } // End of the function
    function set style(s)
    {
        var _loc1 = this;
        var _loc2 = s;
        for (var _loc3 in _loc2)
        {
            if (_loc1[_loc3] != undefined && _loc1[_loc3] != null)
            {
                _loc1[_loc3] = _loc2[_loc3];
            } // end if
        } // end of for...in
        //return (_loc1.style());
    } // End of the function
    function set width(w)
    {
        var _loc1 = this;
        _loc1.setSize(w, _loc1.__height);
        //return (_loc1.width());
    } // End of the function
    function get width()
    {
        return (this.__width);
    } // End of the function
    var version = "1.3.0";
    var __alphaDisabled = 50;
    var __enabled = true;
    var __focusLimit = 2000;
    var __keyEnabled = true;
} // End of Class
