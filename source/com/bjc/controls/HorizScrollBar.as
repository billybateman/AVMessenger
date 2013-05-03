class com.bjc.controls.HorizScrollBar extends com.bjc.controls.ScrollBar
{
    var __thumb, __height, __width, _xmouse, __get__thumbPos, __get__thumbSize, __get____backSkin, __get____btnADownSkin, __get____btnAUpSkin, __get____btnBDownSkin, __get____btnBUpSkin, __get____limitA, __get____limitB, __get____resizerType, __get____thumbSkin, __get__mousePos, __set__thumbPos, __set__thumbSize;
    function HorizScrollBar(Void)
    {
        super();
    } // End of the function
    function createChildren(Void)
    {
        var _loc1 = this;
        _loc1.attachMovie("HResizer", "__back", 0);
        _loc1.__back.skin = _loc1.__backSkin;
        _loc1.__back.margin = 10;
        super.createChildren();
    } // End of the function
    function size(Void)
    {
        var _loc1 = this;
        super.size();
        _loc1.__btnAUp._height = _loc1.__height;
        _loc1.__btnAUp._width = _loc1.__height;
        _loc1.__btnADown._height = _loc1.__height;
        _loc1.__btnADown._width = _loc1.__height;
        _loc1.__btnBUp._height = _loc1.__height;
        _loc1.__btnBUp._width = _loc1.__height;
        _loc1.__btnBDown._height = _loc1.__height;
        _loc1.__btnBDown._width = _loc1.__height;
        _loc1.__btnBUp._x = _loc1.__limitB;
        _loc1.__btnBDown._x = _loc1.__limitB;
        _loc1.__thumb.height = _loc1.__height;
    } // End of the function
    static function create(target, id, depth, initObj)
    {
        return (target.attachMovie("HorizScrollBar", id, depth, initObj));
    } // End of the function
    function onStartDrag(Void)
    {
        var _loc1 = this;
        if (_loc1.__enabled)
        {
            _loc1.__thumb.startDrag(false, _loc1.__get____limitA(), 0, Math.round(_loc1.__get____limitB() - _loc1.__thumb.width), 0);
            _loc1.onMouseMove = _loc1.update;
        } // end if
    } // End of the function
    function setThumbMargins()
    {
        this.__thumb.margin = this.__height / 2;
    } // End of the function
    function get __backSkin()
    {
        return ("hScrollBarBackSkin");
    } // End of the function
    function get __btnADownSkin()
    {
        return ("hScrollBarLeftBtnDownSkin");
    } // End of the function
    function get __btnAUpSkin()
    {
        return ("hScrollBarLeftBtnUpSkin");
    } // End of the function
    function get __btnBDownSkin()
    {
        return ("hScrollBarRightBtnDownSkin");
    } // End of the function
    function get __btnBUpSkin()
    {
        return ("hScrollBarRightBtnUpSkin");
    } // End of the function
    function get __limitA()
    {
        return (this.__height);
    } // End of the function
    function get __limitB()
    {
        return (this.__width - this.__height);
    } // End of the function
    function get mousePos()
    {
        return (this._xmouse);
    } // End of the function
    function get __resizerType()
    {
        return ("HResizer");
    } // End of the function
    function set thumbPos(pos)
    {
        this.__thumb._x = pos;
        //return (this.thumbPos());
        null;
    } // End of the function
    function get thumbPos()
    {
        return (this.__thumb._x);
    } // End of the function
    function set thumbSize(m)
    {
        this.__thumb.width = m;
        //return (this.thumbSize());
        null;
    } // End of the function
    function get thumbSize()
    {
        return (this.__thumb.width);
    } // End of the function
    function get __thumbSkin()
    {
        return ("hScrollBarThumbSkin");
    } // End of the function
} // End of Class
