class com.bjc.controls.VertScrollBar extends com.bjc.controls.ScrollBar
{
    var __thumb, __width, __height, _ymouse, __get__thumbPos, __get__thumbSize, __get____backSkin, __get____btnADownSkin, __get____btnAUpSkin, __get____btnBDownSkin, __get____btnBUpSkin, __get____limitA, __get____limitB, __get____resizerType, __get____thumbSkin, __get__mousePos, __set__thumbPos, __set__thumbSize;
    function VertScrollBar(Void)
    {
        super();
    } // End of the function
    function createChildren(Void)
    {
        var _loc1 = this;
        _loc1.attachMovie("VResizer", "__back", 0);
        _loc1.__back.skin = _loc1.__backSkin;
        _loc1.__back.margin = 10;
        super.createChildren();
    } // End of the function
    function size(Void)
    {
        var _loc1 = this;
        super.size();
        _loc1.__btnAUp._height = _loc1.__width;
        _loc1.__btnAUp._width = _loc1.__width;
        _loc1.__btnADown._height = _loc1.__width;
        _loc1.__btnADown._width = _loc1.__width;
        _loc1.__btnBUp._height = _loc1.__width;
        _loc1.__btnBUp._width = _loc1.__width;
        _loc1.__btnBDown._height = _loc1.__width;
        _loc1.__btnBDown._width = _loc1.__width;
        _loc1.__btnBUp._y = _loc1.__limitB;
        _loc1.__btnBDown._y = _loc1.__limitB;
        _loc1.__thumb.width = _loc1.__width;
    } // End of the function
    static function create(target, id, depth, initObj)
    {
        return (target.attachMovie("VertScrollBar", id, depth, initObj));
    } // End of the function
    function onStartDrag(Void)
    {
        var _loc1 = this;
        if (_loc1.__enabled)
        {
            _loc1.__thumb.startDrag(false, 0, _loc1.__get____limitA(), 0, Math.round(_loc1.__get____limitB() - _loc1.__thumb.height));
            _loc1.onMouseMove = _loc1.update;
        } // end if
    } // End of the function
    function setThumbMargins()
    {
        this.__thumb.margin = this.__width / 2;
    } // End of the function
    function get __backSkin()
    {
        return ("vScrollBarBackSkin");
    } // End of the function
    function get __btnADownSkin()
    {
        return ("vScrollBarUpBtnDownSkin");
    } // End of the function
    function get __btnAUpSkin()
    {
        return ("vScrollBarUpBtnUpSkin");
    } // End of the function
    function get __btnBDownSkin()
    {
        return ("vScrollBarDownBtnDownSkin");
    } // End of the function
    function get __btnBUpSkin()
    {
        return ("vScrollBarDownBtnUpSkin");
    } // End of the function
    function get __limitA()
    {
        return (this.__width);
    } // End of the function
    function get __limitB()
    {
        return (this.__height - this.__width);
    } // End of the function
    function get mousePos()
    {
        return (this._ymouse);
    } // End of the function
    function get __resizerType()
    {
        return ("VResizer");
    } // End of the function
    function set thumbPos(pos)
    {
        this.__thumb._y = pos;
        //return (this.thumbPos());
        null;
    } // End of the function
    function get thumbPos()
    {
        return (this.__thumb._y);
    } // End of the function
    function set thumbSize(m)
    {
        this.__thumb.height = m;
        //return (this.thumbSize());
        null;
    } // End of the function
    function get thumbSize()
    {
        return (this.__thumb.height);
    } // End of the function
    function get __thumbSkin()
    {
        return ("vScrollBarThumbSkin");
    } // End of the function
} // End of Class
