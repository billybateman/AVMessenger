class com.bjc.resizers.Resizer extends com.bjc.core.BJCComponent
{
    var __set__bottomMargin, __get__bottomMargin, __set__leftMargin, __get__leftMargin, __set__margin, __get__margin, __set__rightMargin, __get__rightMargin, __set__skin, __get__skin, __set__topMargin, __get__topMargin;
    function Resizer(Void)
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
        _loc1.createEmptyMovieClip("__topLeft", 0);
        _loc1.createEmptyMovieClip("__topMid", 1);
        _loc1.createEmptyMovieClip("__topRight", 2);
        _loc1.createEmptyMovieClip("__midLeft", 3);
        _loc1.createEmptyMovieClip("__midMid", 4);
        _loc1.createEmptyMovieClip("__midRight", 5);
        _loc1.createEmptyMovieClip("__bottomLeft", 6);
        _loc1.createEmptyMovieClip("__bottomMid", 7);
        _loc1.createEmptyMovieClip("__bottomRight", 8);
        _loc1.__topLeft.createEmptyMovieClip("mask", 1);
        _loc1.__topMid.createEmptyMovieClip("mask", 1);
        _loc1.__topRight.createEmptyMovieClip("mask", 1);
        _loc1.__midLeft.createEmptyMovieClip("mask", 1);
        _loc1.__midMid.createEmptyMovieClip("mask", 1);
        _loc1.__midRight.createEmptyMovieClip("mask", 1);
        _loc1.__bottomLeft.createEmptyMovieClip("mask", 1);
        _loc1.__bottomMid.createEmptyMovieClip("mask", 1);
        _loc1.__bottomRight.createEmptyMovieClip("mask", 1);
    } // End of the function
    function draw(Void)
    {
        var _loc1 = this;
        _loc1.__topLeft.attachMovie(_loc1.__skin, "skin", 0);
        _loc1.__topMid.attachMovie(_loc1.__skin, "skin", 0);
        _loc1.__topRight.attachMovie(_loc1.__skin, "skin", 0);
        _loc1.__midLeft.attachMovie(_loc1.__skin, "skin", 0);
        _loc1.__midMid.attachMovie(_loc1.__skin, "skin", 0);
        _loc1.__midRight.attachMovie(_loc1.__skin, "skin", 0);
        _loc1.__bottomLeft.attachMovie(_loc1.__skin, "skin", 0);
        _loc1.__bottomMid.attachMovie(_loc1.__skin, "skin", 0);
        _loc1.__bottomRight.attachMovie(_loc1.__skin, "skin", 0);
        _loc1.__topLeft.skin.setMask(_loc1.__topLeft.mask);
        _loc1.__topMid.skin.setMask(_loc1.__topMid.mask);
        _loc1.__topRight.skin.setMask(_loc1.__topRight.mask);
        _loc1.__midLeft.skin.setMask(_loc1.__midLeft.mask);
        _loc1.__midMid.skin.setMask(_loc1.__midMid.mask);
        _loc1.__midRight.skin.setMask(_loc1.__midRight.mask);
        _loc1.__bottomLeft.skin.setMask(_loc1.__bottomLeft.mask);
        _loc1.__bottomMid.skin.setMask(_loc1.__bottomMid.mask);
        _loc1.__bottomRight.skin.setMask(_loc1.__bottomRight.mask);
        _loc1.size();
    } // End of the function
    function size(Void)
    {
        var _loc1 = this;
        _loc1.__width = Math.max(_loc1.__width, _loc1.__leftMargin + _loc1.__rightMargin);
        _loc1.__height = Math.max(_loc1.__height, _loc1.__topMargin + _loc1.__bottomMargin);
        _loc1.__midMid.skin._xscale = 100;
        _loc1.__midMid.skin._yscale = 100;
        var midWidthOrig = _loc1.__midMid.skin._width - _loc1.__leftMargin - _loc1.__rightMargin;
        var _loc2 = _loc1.__width - _loc1.__leftMargin - _loc1.__rightMargin;
        var xscale = _loc2 / midWidthOrig;
        var midheightOrig = _loc1.__midMid.skin._height - _loc1.__topMargin - _loc1.__bottomMargin;
        var _loc3 = _loc1.__height - _loc1.__topMargin - _loc1.__bottomMargin;
        var yscale = _loc3 / midheightOrig;
        _loc1.__topMid.skin._xscale = xscale * 100;
        _loc1.__topMid.skin._x = -_loc1.__leftMargin * xscale;
        _loc1.__topMid._x = _loc1.__leftMargin;
        _loc1.__topRight._x = _loc1.__width - _loc1.__rightMargin;
        _loc1.__topRight.skin._x = _loc1.__rightMargin - _loc1.__topRight.skin._width;
        _loc1.__midLeft.skin._yscale = yscale * 100;
        _loc1.__midLeft.skin._y = -_loc1.__topMargin * yscale;
        _loc1.__midLeft._y = _loc1.__topMargin;
        _loc1.__midMid.skin._xscale = xscale * 100;
        _loc1.__midMid.skin._x = -_loc1.__leftMargin * xscale;
        _loc1.__midMid._x = _loc1.__leftMargin;
        _loc1.__midMid.skin._yscale = yscale * 100;
        _loc1.__midMid.skin._y = -_loc1.__topMargin * yscale;
        _loc1.__midMid._y = _loc1.__topMargin;
        _loc1.__midRight._x = _loc1.__width - _loc1.__rightMargin;
        _loc1.__midRight.skin._x = _loc1.__rightMargin - _loc1.__midRight.skin._width;
        _loc1.__midRight.skin._yscale = yscale * 100;
        _loc1.__midRight.skin._y = -_loc1.__topMargin * yscale;
        _loc1.__midRight._y = _loc1.__topMargin;
        _loc1.__bottomLeft._y = _loc1.__height - _loc1.__bottomMargin;
        _loc1.__bottomLeft.skin._y = _loc1.__bottomMargin - _loc1.__bottomLeft.skin._height;
        _loc1.__bottomMid.skin._xscale = xscale * 100;
        _loc1.__bottomMid.skin._x = -_loc1.__leftMargin * xscale;
        _loc1.__bottomMid._x = _loc1.__leftMargin;
        _loc1.__bottomMid._y = _loc1.__height - _loc1.__bottomMargin;
        _loc1.__bottomMid.skin._y = _loc1.__bottomMargin - _loc1.__bottomMid.skin._height;
        _loc1.__bottomRight._x = _loc1.__width - _loc1.__rightMargin;
        _loc1.__bottomRight.skin._x = _loc1.__rightMargin - _loc1.__bottomRight.skin._width;
        _loc1.__bottomRight._y = _loc1.__height - _loc1.__bottomMargin;
        _loc1.__bottomRight.skin._y = _loc1.__bottomMargin - _loc1.__bottomRight.skin._height;
        _loc1.__topLeft.mask.clear();
        _loc1.__topLeft.mask.beginFill(16777215);
        _loc1.__topLeft.mask.lineTo(_loc1.__leftMargin, 0);
        _loc1.__topLeft.mask.lineTo(_loc1.__leftMargin, _loc1.__topMargin);
        _loc1.__topLeft.mask.lineTo(0, _loc1.__topMargin);
        _loc1.__topLeft.mask.lineTo(0, 0);
        _loc1.__topLeft.mask.endFill();
        _loc1.__topMid.mask.clear();
        _loc1.__topMid.mask.beginFill(16777215);
        _loc1.__topMid.mask.lineTo(_loc2, 0);
        _loc1.__topMid.mask.lineTo(_loc2, _loc1.__topMargin);
        _loc1.__topMid.mask.lineTo(0, _loc1.__topMargin);
        _loc1.__topMid.mask.lineTo(0, 0);
        _loc1.__topMid.mask.endFill();
        _loc1.__topRight.mask.clear();
        _loc1.__topRight.mask.beginFill(16777215);
        _loc1.__topRight.mask.lineTo(_loc1.__rightMargin, 0);
        _loc1.__topRight.mask.lineTo(_loc1.__rightMargin, _loc1.__topMargin);
        _loc1.__topRight.mask.lineTo(0, _loc1.__topMargin);
        _loc1.__topRight.mask.lineTo(0, 0);
        _loc1.__topRight.mask.endFill();
        _loc1.__midLeft.mask.clear();
        _loc1.__midLeft.mask.beginFill(16777215);
        _loc1.__midLeft.mask.lineTo(_loc1.__leftMargin, 0);
        _loc1.__midLeft.mask.lineTo(_loc1.__leftMargin, _loc3);
        _loc1.__midLeft.mask.lineTo(0, _loc3);
        _loc1.__midLeft.mask.lineTo(0, 0);
        _loc1.__midLeft.mask.endFill();
        _loc1.__midMid.mask.clear();
        _loc1.__midMid.mask.beginFill(16777215);
        _loc1.__midMid.mask.lineTo(_loc2, 0);
        _loc1.__midMid.mask.lineTo(_loc2, _loc3);
        _loc1.__midMid.mask.lineTo(0, _loc3);
        _loc1.__midMid.mask.lineTo(0, 0);
        _loc1.__midMid.mask.endFill();
        _loc1.__midRight.mask.clear();
        _loc1.__midRight.mask.beginFill(16777215);
        _loc1.__midRight.mask.lineTo(_loc1.__rightMargin, 0);
        _loc1.__midRight.mask.lineTo(_loc1.__rightMargin, _loc3);
        _loc1.__midRight.mask.lineTo(0, _loc3);
        _loc1.__midRight.mask.lineTo(0, 0);
        _loc1.__midRight.mask.endFill();
        _loc1.__bottomLeft.mask.clear();
        _loc1.__bottomLeft.mask.beginFill(16777215);
        _loc1.__bottomLeft.mask.lineTo(_loc1.__leftMargin, 0);
        _loc1.__bottomLeft.mask.lineTo(_loc1.__leftMargin, _loc1.__bottomMargin);
        _loc1.__bottomLeft.mask.lineTo(0, _loc1.__bottomMargin);
        _loc1.__bottomLeft.mask.lineTo(0, 0);
        _loc1.__bottomLeft.mask.endFill();
        _loc1.__bottomMid.mask.clear();
        _loc1.__bottomMid.mask.beginFill(16777215);
        _loc1.__bottomMid.mask.lineTo(_loc2, 0);
        _loc1.__bottomMid.mask.lineTo(_loc2, _loc1.__bottomMargin);
        _loc1.__bottomMid.mask.lineTo(0, _loc1.__bottomMargin);
        _loc1.__bottomMid.mask.lineTo(0, 0);
        _loc1.__bottomMid.mask.endFill();
        _loc1.__bottomRight.mask.clear();
        _loc1.__bottomRight.mask.beginFill(16777215);
        _loc1.__bottomRight.mask.lineTo(_loc1.__rightMargin, 0);
        _loc1.__bottomRight.mask.lineTo(_loc1.__rightMargin, _loc1.__bottomMargin);
        _loc1.__bottomRight.mask.lineTo(0, _loc1.__bottomMargin);
        _loc1.__bottomRight.mask.lineTo(0, 0);
        _loc1.__bottomRight.mask.endFill();
    } // End of the function
    static function create(target, id, depth, initObj)
    {
        return (target.attachMovie("Resizer", id, depth, initObj));
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
        var _loc2 = m;
        _loc1.__topMargin = _loc2;
        _loc1.__bottomMargin = _loc2;
        _loc1.__leftMargin = _loc2;
        _loc1.__rightMargin = _loc2;
        _loc1.invalidate();
        //return (_loc1.margin());
    } // End of the function
    function get margin()
    {
        var _loc1 = this;
        if (_loc1.__topMargin == _loc1.__bottomMargin && _loc1.__topMargin == _loc1.__leftMargin && _loc1.__topMargin == _loc1.__rightMargin)
        {
            return (_loc1.__topMargin);
            
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
    var clipParameters = {topMargin: 1, bottomMargin: 1, leftMargin: 1, rightMargin: 1, skin: 1};
    var __bottomMargin = 30;
    var __leftMargin = 30;
    var __rightMargin = 30;
    var __topMargin = 30;
    var __skin = "defaultSkin";
} // End of Class
