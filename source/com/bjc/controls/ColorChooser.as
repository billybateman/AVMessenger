class com.bjc.controls.ColorChooser extends com.bjc.core.BJCComponent
{
    var __button, __buttonCol, attachMovie, __window, __oldDepth, swapDepths, dispatchEvent, invalidate, val, col, _xmouse, _ymouse, __display, __sampleCol, getDepth, _parent, __sample, __get__position, __get__value, __set__position, __set__value;
    function ColorChooser(Void)
    {
        super();
    } // End of the function
    function init(Void)
    {
        super.init();
        mx.events.EventDispatcher.initialize(this);
        __buttonCol = new Color(__button.block);
        __button.onRelease = mx.utils.Delegate.create(this, openWindow);
        this.draw();
    } // End of the function
    function createChildren(Void)
    {
        this.attachMovie("colorChooserButton", "__button", 0);
    } // End of the function
    function draw(Void)
    {
        __buttonCol.setRGB(__value);
        this.size();
    } // End of the function
    function size(Void)
    {
    } // End of the function
    static function create(target, id, depth, initObj)
    {
        return ((com.bjc.controls.ColorChooser)(target.attachMovie("ColorChooser", id, depth, initObj)));
    } // End of the function
    function closeWindow()
    {
        __window.removeMovieClip();
        this.swapDepths(__oldDepth);
        this.dispatchEvent({type: "change"});
        this.invalidate();
    } // End of the function
    function makeColorSwatches(Void)
    {
        var _loc8 = 20;
        var _loc7 = 15;
        for (var _loc6 = 0; _loc6 < 6; ++_loc6)
        {
            for (var _loc4 = 0; _loc4 < 6; ++_loc4)
            {
                for (var _loc3 = 0; _loc3 < 6; ++_loc3)
                {
                    var _loc2 = __window.attachMovie("colorSwatch", "swatch" + __depth, __depth++);
                    _loc2.col = _loc6 * 3342336 + _loc3 * 13056 + _loc4 * 51;
                    _loc2.val = this.rgbToHex(_loc2.col);
                    var _loc5 = new Color(_loc2.block);
                    _loc5.setRGB(_loc2.col);
                    _loc2._x = _loc7 + _loc4 * 10;
                    _loc2._y = _loc8 + _loc3 * 10;
                    _loc2.useHandCursor = false;
                    var comp = this;
                    _loc2.onRollOver = function ()
                    {
                        comp.__display.text = val;
                        comp.__sampleCol.setRGB(col);
                    };
                    _loc2.onRelease = function ()
                    {
                        comp.__value = col;
                        comp.closeWindow();
                    };
                } // end of for
            } // end of for
            _loc7 = _loc7 + 60;
            if (_loc7 > 149)
            {
                _loc7 = 15;
                _loc8 = _loc8 + 60;
            } // end if
        } // end of for
    } // End of the function
    function makeGraySwatches(Void)
    {
        var _loc6 = 20;
        for (var _loc3 = 0; _loc3 < 6; ++_loc3)
        {
            var _loc2 = __window.attachMovie("colorSwatch", "swatch" + __depth, __depth++);
            var _loc4 = _loc3 * 51;
            _loc2.col = _loc4 << 16 | _loc4 << 8 | _loc4;
            _loc2.val = this.rgbToHex(_loc2.col);
            _loc2._x = 2;
            _loc2._y = _loc6 + _loc3 * 10;
            _loc2.useHandCursor = false;
            var _loc5 = new Color(_loc2.block);
            _loc5.setRGB(_loc2.col);
            var comp = this;
            _loc2.onRollOver = function ()
            {
                comp.__display.text = val;
                comp.__sampleCol.setRGB(col);
            };
            _loc2.onRelease = function ()
            {
                comp.__value = col;
                comp.closeWindow();
            };
        } // end of for
    } // End of the function
    function makePrimarySwatches(Void)
    {
        var _loc8 = 80;
        var _loc4 = 255;
        var _loc6 = 0;
        var _loc5 = 0;
        for (var _loc3 = 0; _loc3 < 6; ++_loc3)
        {
            var _loc2 = __window.attachMovie("colorSwatch", "swatch" + __depth, __depth++);
            _loc2.col = _loc4 << 16 | _loc6 << 8 | _loc5;
            _loc2.val = this.rgbToHex(_loc2.col);
            _loc2._x = 2;
            _loc2._y = _loc8 + 10 * _loc3;
            _loc2.useHandCursor = false;
            var _loc7 = new Color(_loc2.block);
            _loc7.setRGB(_loc2.col);
            var comp = this;
            _loc2.onRollOver = function ()
            {
                comp.__display.text = val;
                comp.__sampleCol.setRGB(col);
            };
            _loc2.onRelease = function ()
            {
                comp.__value = col;
                comp.closeWindow();
            };
            _loc4 = _loc4 + 255;
            if (_loc4 > 255)
            {
                _loc4 = 0;
                _loc6 = _loc6 + 255;
                if (_loc6 > 255)
                {
                    _loc6 = 0;
                    _loc5 = _loc5 + 255;
                    if (_loc5 > 255)
                    {
                        _loc5 = 0;
                    } // end if
                } // end if
            } // end if
        } // end of for
    } // End of the function
    function onClick(Void)
    {
        if (__position.indexOf("Right") != -1)
        {
            if (_xmouse < 0 || _xmouse > __window._width)
            {
                this.closeWindow();
            } // end if
        }
        else if (_xmouse < -__window._width || _xmouse > __button._width)
        {
            this.closeWindow();
        } // end else if
        if (__position.indexOf("bottom") != -1)
        {
            if (_ymouse < 0 || _ymouse > __window._height)
            {
                this.closeWindow();
            } // end if
        }
        else if (_ymouse < -__window._height || _ymouse > __button._height)
        {
            this.closeWindow();
        } // end else if
    } // End of the function
    function onDisplayChange()
    {
        if (__display.text.charAt(0) != "#")
        {
            __display.maxChars = 6;
            if (__display.text.length == 6)
            {
                __display.col = parseInt(__display.text, 16);
                __sampleCol.setRGB(__display.col);
            } // end if
        }
        else
        {
            __display.maxChars = 7;
            if (__display.text.length == 7)
            {
                __display.col = parseInt(__display.text.substring(1), 16);
                __sampleCol.setRGB(__display.col);
            } // end if
        } // end else if
    } // End of the function
    function onDisplayFocus()
    {
        Key.addListener(__display);
        __display.onKeyDown = mx.utils.Delegate.create(this, onEnterPressed);
    } // End of the function
    function onDisplayKillFocus()
    {
        Key.removeListener(__display);
        delete __display.onKeyDown;
    } // End of the function
    function onEnterPressed()
    {
        if (Key.getCode() == 13)
        {
            if (__display.text.charAt(0) == "#" && __display.text.length == 7)
            {
                this.onDisplayChange();
                __value = __display.col;
                this.closeWindow();
            }
            else if (__display.length == 6)
            {
                this.onDisplayChange();
                __value = __display.col;
                this.closeWindow();
            } // end if
        } // end else if
    } // End of the function
    function onEscape()
    {
        if (Key.getCode() == 27)
        {
            Key.removeListener(this);
            this.closeWindow();
        } // end if
    } // End of the function
    function openWindow()
    {
        __oldDepth = this.getDepth();
        this.swapDepths(_parent.getNextHighestDepth());
        this.attachMovie("colorChooserWindow", "__window", 1);
        __window.attachMovie("colorChooserSkin", "skin", 0);
        __window.skin.swapDepths(-16384);
        if (__position.indexOf("bottom") != -1)
        {
            __window._y = 0;
        }
        else
        {
            __window._y = __button._width - __window._height;
        } // end else if
        if (__position.indexOf("Right") != -1)
        {
            __window._x = 0;
        }
        else
        {
            __window._x = __button._height - __window._width;
        } // end else if
        Key.addListener(__window);
        __window.onKeyDown = mx.utils.Delegate.create(this, onEscape);
        __window.onMouseDown = mx.utils.Delegate.create(this, onClick);
        __display = __window.display;
        __display.restrict = "#0123456789abcdefABCDEF";
        __display.text = this.rgbToHex(__value);
        __display.col = __value;
        __display.onChanged = mx.utils.Delegate.create(this, onDisplayChange);
        __display.onSetFocus = mx.utils.Delegate.create(this, onDisplayFocus);
        __display.onKillFocus = mx.utils.Delegate.create(this, onDisplayKillFocus);
        __sample = __window.sample;
        __sampleCol = new Color(__sample);
        __sampleCol.setRGB(__value);
        __sample.onPress = mx.utils.Delegate.create(this, closeWindow);
        this.makeColorSwatches();
        this.makeGraySwatches();
        this.makePrimarySwatches();
        Selection.setFocus(this);
    } // End of the function
    function rgbToHex(rgb)
    {
        var _loc2 = rgb.toString(16).toUpperCase();
        var _loc3 = 6 - _loc2.length;
        for (var _loc1 = 0; _loc1 < _loc3; ++_loc1)
        {
            _loc2 = "0" + _loc2;
        } // end of for
        _loc2 = "#" + _loc2;
        return (_loc2);
    } // End of the function
    function set position(pos)
    {
        __position = pos;
        //return (this.position());
        null;
    } // End of the function
    function get position()
    {
        return (__position);
    } // End of the function
    function set value(v)
    {
        __value = v;
        this.dispatchEvent({type: "change"});
        this.invalidate();
        //return (this.value());
        null;
    } // End of the function
    function get value()
    {
        return (__value);
    } // End of the function
    var clipParams = {value: 1};
    var __depth = 0;
    var __position = "bottomRight";
    var __value = 16711680;
} // End of Class
