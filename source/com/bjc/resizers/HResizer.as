class com.bjc.resizers.HResizer extends com.bjc.core.BJCComponent
{
    var __skin, __set__leftMargin, __get__leftMargin, __set__margin, __get__margin, __set__rightMargin, __get__rightMargin, __set__skin, __get__skin;
    function HResizer(Void)
    {
        super();
    } // End of the function
    function init(Void)
    {
        super.init();
        this.draw();
    } // End of the function
    function createChildren(Void)
    {
        var _loc1 = this;
        _loc1.createEmptyMovieClip("__left", 0);
        _loc1.createEmptyMovieClip("__mid", 1);
        _loc1.createEmptyMovieClip("__right", 2);
        _loc1.__left.createEmptyMovieClip("mask", 1);
        _loc1.__mid.createEmptyMovieClip("mask", 1);
        _loc1.__right.createEmptyMovieClip("mask", 1);
    } // End of the function
    function draw(Void)
    {
        var _loc1 = this;
        if (_loc1.__skin != undefined && _loc1.__skin != "")
        {
            _loc1.__left.attachMovie(_loc1.__skin, "skin", 0);
            _loc1.__mid.attachMovie(_loc1.__skin, "skin", 0);
            _loc1.__right.attachMovie(_loc1.__skin, "skin", 0);
            _loc1.__left.skin.setMask(_loc1.__left.mask);
            _loc1.__mid.skin.setMask(_loc1.__mid.mask);
            _loc1.__right.skin.setMask(_loc1.__right.mask);
            _loc1.size();
        } // end if
    } // End of the function
    function size(Void)
    {
        var _loc1 = this;
        _loc1.__width = Math.max(_loc1.__width, _loc1.__leftMargin + _loc1.__rightMargin);
        if (_loc1.__skin != undefined && _loc1.__skin != "")
        {
            _loc1.__left.skin._height = _loc1.__height;
            _loc1.__mid.skin._xscale = 100;
            var midWidthOrig = _loc1.__mid.skin._width - _loc1.__leftMargin - _loc1.__rightMargin;
            var _loc2 = _loc1.__width - _loc1.__leftMargin - _loc1.__rightMargin;
            var _loc3 = _loc2 / midWidthOrig;
            _loc1.__mid.skin._xscale = _loc3 * 100;
            _loc1.__mid.skin._x = -_loc1.__leftMargin * _loc3;
            _loc1.__mid._x = _loc1.__leftMargin;
            _loc1.__mid.skin._height = _loc1.__height;
            _loc1.__right._x = _loc1.__width - _loc1.__rightMargin;
            _loc1.__right.skin._x = _loc1.__rightMargin - _loc1.__right.skin._width;
            _loc1.__right.skin._height = _loc1.__height;
            _loc1.__left.mask.clear();
            _loc1.__left.mask.beginFill(16777215);
            _loc1.__left.mask.lineTo(_loc1.__leftMargin, 0);
            _loc1.__left.mask.lineTo(_loc1.__leftMargin, _loc1.__height);
            _loc1.__left.mask.lineTo(0, _loc1.__height);
            _loc1.__left.mask.lineTo(0, 0);
            _loc1.__left.mask.endFill();
            _loc1.__mid.mask.clear();
            _loc1.__mid.mask.beginFill(16777215);
            _loc1.__mid.mask.lineTo(_loc2, 0);
            _loc1.__mid.mask.lineTo(_loc2, _loc1.__height);
            _loc1.__mid.mask.lineTo(0, _loc1.__height);
            _loc1.__mid.mask.lineTo(0, 0);
            _loc1.__mid.mask.endFill();
            _loc1.__right.mask.clear();
            _loc1.__right.mask.beginFill(16777215);
            _loc1.__right.mask.lineTo(_loc1.__rightMargin, 0);
            _loc1.__right.mask.lineTo(_loc1.__rightMargin, _loc1.__height);
            _loc1.__right.mask.lineTo(0, _loc1.__height);
            _loc1.__right.mask.lineTo(0, 0);
            _loc1.__right.mask.endFill();
        } // end if
    } // End of the function
    static function create(target, id, depth, initObj)
    {
        return (target.attachMovie("HResizer", id, depth, initObj));
    } // End of the function
    function set leftMargin(lm)
    {
        var _loc1 = this;
        _loc1.__leftMargin = lm;
        _loc1.invalidate();
        //return (_loc1.leftMargin());
    } // End of the function
    function get leftMargin()
    {
        return (this.__leftMargin);
    } // End of the function
    function set margin(m)
    {
        var _loc1 = this;
        _loc1.__leftMargin = m;
        _loc1.__rightMargin = m;
        _loc1.invalidate();
        //return (_loc1.margin());
    } // End of the function
    function get margin()
    {
        var _loc1 = this;
        if (_loc1.__leftMargin == _loc1.__rightMargin)
        {
            return (_loc1.__rightMargin);
            
        }
        else
        {
            return;
        } // end else if
    } // End of the function
    function set rightMargin(rm)
    {
        var _loc1 = this;
        _loc1.__rightMargin = rm;
        _loc1.invalidate();
        //return (_loc1.rightMargin());
    } // End of the function
    function get rightMargin()
    {
        return (this.__rightMargin);
    } // End of the function
    function set skin(symbol)
    {
        var _loc1 = this;
        _loc1.__skin = symbol;
        _loc1.draw();
        //return (_loc1.skin());
    } // End of the function
    function get skin()
    {
        return (this.__skin);
    } // End of the function
    var clipParameters = {leftMargin: 1, rightMargin: 1, skin: 1};
    var __leftMargin = 30;
    var __rightMargin = 30;
} // End of Class
