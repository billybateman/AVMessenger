class com.bjc.resizers.VResizer extends com.bjc.core.BJCComponent
{
    var __skin, __set__bottomMargin, __get__bottomMargin, __set__margin, __get__margin, __set__skin, __get__skin, __set__topMargin, __get__topMargin;
    function VResizer(Void)
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
        _loc1.createEmptyMovieClip("__top", 0);
        _loc1.createEmptyMovieClip("__mid", 1);
        _loc1.createEmptyMovieClip("__bottom", 2);
        _loc1.__top.createEmptyMovieClip("mask", 1);
        _loc1.__mid.createEmptyMovieClip("mask", 1);
        _loc1.__bottom.createEmptyMovieClip("mask", 1);
    } // End of the function
    function draw(Void)
    {
        var _loc1 = this;
        if (_loc1.__skin != undefined && _loc1.__skin != "")
        {
            _loc1.__top.attachMovie(_loc1.__skin, "skin", 0);
            _loc1.__mid.attachMovie(_loc1.__skin, "skin", 0);
            _loc1.__bottom.attachMovie(_loc1.__skin, "skin", 0);
            _loc1.__top.skin.setMask(_loc1.__top.mask);
            _loc1.__mid.skin.setMask(_loc1.__mid.mask);
            _loc1.__bottom.skin.setMask(_loc1.__bottom.mask);
            _loc1.size();
        } // end if
    } // End of the function
    function size(Void)
    {
        var _loc1 = this;
        _loc1.__height = Math.max(_loc1.__height, _loc1.__topMargin + _loc1.__bottomMargin);
        if (_loc1.__skin != undefined && _loc1.__skin != "")
        {
            _loc1.__top.skin._width = _loc1.__width;
            _loc1.__mid.skin._yscale = 100;
            var midheightOrig = _loc1.__mid.skin._height - _loc1.__topMargin - _loc1.__bottomMargin;
            var _loc2 = _loc1.__height - _loc1.__topMargin - _loc1.__bottomMargin;
            var _loc3 = _loc2 / midheightOrig;
            _loc1.__mid.skin._yscale = _loc3 * 100;
            _loc1.__mid.skin._y = -_loc1.__topMargin * _loc3;
            _loc1.__mid._y = _loc1.__topMargin;
            _loc1.__mid.skin._width = _loc1.__width;
            _loc1.__bottom._y = _loc1.__height - _loc1.__bottomMargin;
            _loc1.__bottom.skin._y = _loc1.__bottomMargin - _loc1.__bottom.skin._height;
            _loc1.__bottom.skin._width = _loc1.__width;
            _loc1.__top.mask.clear();
            _loc1.__top.mask.beginFill(16777215);
            _loc1.__top.mask.lineTo(0, _loc1.__topMargin);
            _loc1.__top.mask.lineTo(_loc1.__width, _loc1.__topMargin);
            _loc1.__top.mask.lineTo(_loc1.__width, 0);
            _loc1.__top.mask.lineTo(0, 0);
            _loc1.__top.mask.endFill();
            _loc1.__mid.mask.clear();
            _loc1.__mid.mask.beginFill(16777215);
            _loc1.__mid.mask.lineTo(0, _loc2);
            _loc1.__mid.mask.lineTo(_loc1.__width, _loc2);
            _loc1.__mid.mask.lineTo(_loc1.__width, 0);
            _loc1.__mid.mask.lineTo(0, 0);
            _loc1.__mid.mask.endFill();
            _loc1.__bottom.mask.clear();
            _loc1.__bottom.mask.beginFill(16777215);
            _loc1.__bottom.mask.lineTo(0, _loc1.__bottomMargin);
            _loc1.__bottom.mask.lineTo(_loc1.__width, _loc1.__bottomMargin);
            _loc1.__bottom.mask.lineTo(_loc1.__width, 0);
            _loc1.__bottom.mask.lineTo(0, 0);
            _loc1.__bottom.mask.endFill();
        } // end if
    } // End of the function
    static function create(target, id, depth, initObj)
    {
        return (target.attachMovie("VResizer", id, depth, initObj));
    } // End of the function
    function set bottomMargin(rm)
    {
        var _loc1 = this;
        _loc1.__bottomMargin = rm;
        _loc1.invalidate();
        //return (_loc1.bottomMargin());
    } // End of the function
    function get bottomMargin()
    {
        return (this.__bottomMargin);
    } // End of the function
    function set margin(m)
    {
        var _loc1 = this;
        _loc1.__topMargin = m;
        _loc1.__bottomMargin = m;
        _loc1.invalidate();
        //return (_loc1.margin());
    } // End of the function
    function get margin()
    {
        var _loc1 = this;
        if (_loc1.__topMargin == _loc1.__bottomMargin)
        {
            return (_loc1.__bottomMargin);
            
        }
        else
        {
            return;
        } // end else if
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
    function set topMargin(lm)
    {
        var _loc1 = this;
        _loc1.__topMargin = lm;
        _loc1.invalidate();
        //return (_loc1.topMargin());
    } // End of the function
    function get topMargin()
    {
        return (this.__topMargin);
    } // End of the function
    var clipParameters = {topMargin: 1, bottomMargin: 1, skin: 1};
    var __topMargin = 30;
    var __bottomMargin = 30;
} // End of Class
