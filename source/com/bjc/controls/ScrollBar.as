class com.bjc.controls.ScrollBar extends com.bjc.core.BJCComponent
{
    var __get__lineScroll, __pageSize, __get__pageSize, __thumbScale, __set__lineScroll, __set__maximum, __get__maximum, __set__minimum, __get__minimum, __set__pageSize, __set__thumbScale, __get__thumbScale, __set__value, __get__value;
    function ScrollBar(Void)
    {
        super();
    } // End of the function
    function init(Void)
    {
        var _loc1 = this;
        super.init();
        mx.events.EventDispatcher.initialize(_loc1);
        _loc1.__back.onRelease = mx.utils.Delegate.create(_loc1, _loc1.onBackPress);
        _loc1.__back.useHandCursor = false;
        _loc1.__btnAUp.onPress = mx.utils.Delegate.create(_loc1, _loc1.onScrollA);
        _loc1.__btnAUp.onRelease = _loc1.__btnAUp.onReleaseOutside = mx.utils.Delegate.create(_loc1, _loc1.stopScroll);
        _loc1.__btnAUp.onRollOver = _loc1.__btnADown.onRollOver = mx.utils.Delegate.create(_loc1, _loc1.rolledOver);
        _loc1.__btnAUp.onRollOut = _loc1.__btnADown.onRollOut = mx.utils.Delegate.create(_loc1, _loc1.rolledOut);
        _loc1.__btnAUp.useHandCursor = false;
        _loc1.__btnADown._visible = false;
        _loc1.__btnBUp.onPress = mx.utils.Delegate.create(_loc1, _loc1.onScrollB);
        _loc1.__btnBUp.onRelease = _loc1.__btnBUp.onReleaseOutside = mx.utils.Delegate.create(_loc1, _loc1.stopScroll);
        _loc1.__btnBUp.onRollOver = _loc1.__btnBDown.onRollOver = mx.utils.Delegate.create(_loc1, _loc1.rolledOver);
        _loc1.__btnBUp.onRollOut = _loc1.__btnBDown.onRollOut = mx.utils.Delegate.create(_loc1, _loc1.rolledOut);
        _loc1.__btnBUp.useHandCursor = false;
        _loc1.__btnBDown._visible = false;
        _loc1.__thumb.skin = _loc1.__thumbSkin;
        _loc1.__thumb.onPress = mx.utils.Delegate.create(_loc1, _loc1.onStartDrag);
        _loc1.__thumb.onRelease = _loc1.__thumb.onReleaseOutside = mx.utils.Delegate.create(_loc1, _loc1.onEndDrag);
        _loc1.__thumb.onRollOver = _loc1.__back.onRollOver = mx.utils.Delegate.create(_loc1, _loc1.rolledOver);
        _loc1.__thumb.onRollOut = _loc1.__back.onRollOut = mx.utils.Delegate.create(_loc1, _loc1.rolledOut);
        _loc1.__thumb.useHandCursor = false;
        _loc1.setThumbMargins();
        _loc1.__thumb._visible = false;
        _loc1.draw();
    } // End of the function
    function createChildren(Void)
    {
        var _loc1 = this;
        _loc1.attachMovie(_loc1.__btnAUpSkin, "__btnAUp", 2);
        _loc1.attachMovie(_loc1.__btnADownSkin, "__btnADown", 3);
        _loc1.attachMovie(_loc1.__btnBUpSkin, "__btnBUp", 4);
        _loc1.attachMovie(_loc1.__btnBDownSkin, "__btnBDown", 5);
        _loc1.attachMovie(_loc1.__resizerType, "__thumb", 1);
    } // End of the function
    function draw(Void)
    {
        var _loc1 = this;
        if (_loc1.__enabled)
        {
            _loc1._alpha = 100;
        }
        else
        {
            _loc1._alpha = _loc1.__alphaDisabled;
        } // end else if
        _loc1.size();
    } // End of the function
    function size(Void)
    {
        var _loc1 = this;
        _loc1.__back.setSize(_loc1.__width, _loc1.__height);
        _loc1.setThumbPos();
    } // End of the function
    function correctValues(Void)
    {
        var _loc1 = this;
        if (_loc1.isInverted())
        {
            _loc1.__value = Math.min(_loc1.__value, _loc1.__minimum);
            _loc1.__value = Math.max(_loc1.__value, _loc1.__maximum);
            return;
        } // end if
        _loc1.__value = Math.max(_loc1.__value, _loc1.__minimum);
        _loc1.__value = Math.min(_loc1.__value, _loc1.__maximum);
    } // End of the function
    function doScroll(amt)
    {
        var _loc1 = this;
        if (_loc1.isInverted())
        {
            amt = amt * -1;
        } // end if
        _loc1.__value = _loc1.__value - amt;
        _loc1.correctValues();
        _loc1.setThumbPos();
        _loc1.dispatchEvent({type: "change", target: _loc1});
    } // End of the function
    function getRatio(Void)
    {
        var _loc1 = this;
        var _loc3 = Math.round(_loc1.__limitB - _loc1.__limitA - _loc1.thumbSize);
        var _loc2 = _loc1.__maximum - _loc1.__minimum;
        return (_loc2 / _loc3);
    } // End of the function
    function isInverted(Void)
    {
        return (this.__minimum > this.__maximum);
    } // End of the function
    function onBackPress(Void)
    {
        var _loc1 = this;
        if (_loc1.__enabled)
        {
            if (_loc1.__pageSize == undefined)
            {
                if (_loc1.mousePos > _loc1.thumbPos)
                {
                    _loc1.thumbPos = _loc1.thumbPos + _loc1.thumbSize;
                    _loc1.thumbPos = Math.min(_loc1.thumbPos, _loc1.__limitB - _loc1.thumbSize);
                }
                else
                {
                    _loc1.thumbPos = _loc1.thumbPos - _loc1.thumbSize;
                    _loc1.thumbPos = Math.max(_loc1.thumbPos, _loc1.__limitA);
                } // end else if
                _loc1.update();
            }
            else
            {
                if (_loc1.mousePos > _loc1.thumbPos)
                {
                    _loc1.value = _loc1.value + _loc1.__pageSize;
                }
                else
                {
                    _loc1.value = _loc1.value - _loc1.__pageSize;
                } // end else if
                _loc1.dispatchEvent({type: "change", target: _loc1});
            } // end else if
            _loc1.dispatchEvent({type: "focus", target: _loc1});
        } // end if
    } // End of the function
    function rolledOver(Void)
    {
        var _loc1 = this;
        if (!_loc1.__isOver)
        {
            _loc1.__isOver = true;
            _loc1.dispatchEvent({type: "rollOver", target: _loc1});
        } // end if
    } // End of the function
    function rolledOut(Void)
    {
        var _loc1 = this;
        if (_loc1.__isOver && (_loc1._xmouse < 2 || _loc1._xmouse > _loc1.__width - 2 || _loc1._ymouse < 2 || _loc1._ymouse > _loc1.__height - 2))
        {
            _loc1.__isOver = false;
            _loc1.dispatchEvent({type: "rollOut", target: _loc1});
        } // end if
    } // End of the function
    function onEndDrag(Void)
    {
        var _loc1 = this;
        _loc1.__thumb.stopDrag();
        delete _loc1.onMouseMove;
        if (_loc1.__isOver && (_loc1._xmouse < 0 || _loc1._xmouse > _loc1.__width || _loc1._ymouse < 0 || _loc1._ymouse > _loc1.__height))
        {
            _loc1.__isOver = false;
            _loc1.dispatchEvent({type: "releaseOutside", target: _loc1});
        } // end if
        _loc1.dispatchEvent({type: "focus", target: _loc1});
    } // End of the function
    function onScrollA(evtObj)
    {
        var _loc1 = this;
        if (_loc1.__enabled)
        {
            _loc1.__btnADown._visible = true;
            _loc1.__scrollInterval = setInterval(_loc1, "doScroll", 50, _loc1.__lineScroll);
        } // end if
    } // End of the function
    function onScrollB(evtObj)
    {
        var _loc1 = this;
        if (_loc1.__enabled)
        {
            _loc1.__btnBDown._visible = true;
            _loc1.__scrollInterval = setInterval(_loc1, "doScroll", 50, -_loc1.__lineScroll);
        } // end if
    } // End of the function
    function onStartDrag(Void)
    {
    } // End of the function
    function stopScroll(Void)
    {
        var _loc1 = this;
        _loc1.__btnADown._visible = false;
        _loc1.__btnBDown._visible = false;
        clearInterval(_loc1.__scrollInterval);
        if (_loc1.__isOver && (_loc1._xmouse < 0 || _loc1._xmouse > _loc1.__width || _loc1._ymouse < 0 || _loc1._ymouse > _loc1.__height))
        {
            _loc1.__isOver = false;
            _loc1.dispatchEvent({type: "releaseOutside", target: _loc1});
        } // end if
        _loc1.dispatchEvent({type: "focus", target: _loc1});
    } // End of the function
    function setThumbPos(Void)
    {
        var _loc1 = this;
        _loc1.thumbPos = Math.round((_loc1.__value - _loc1.__minimum) / _loc1.getRatio()) + _loc1.__limitA;
    } // End of the function
    function update(Void)
    {
        var _loc1 = this;
        var _loc2 = _loc1.__value;
        _loc1.__value = (_loc1.thumbPos - _loc1.__limitA) * _loc1.getRatio() + _loc1.__minimum;
        if (_loc2 != _loc1.__value)
        {
            _loc1.dispatchEvent({type: "change", target: _loc1});
        } // end if
        updateAfterEvent();
    } // End of the function
    function set lineScroll(val)
    {
        this.__lineScroll = val;
        //return (this.lineScroll());
        null;
    } // End of the function
    function get lineScroll()
    {
        return (this.__lineScroll);
    } // End of the function
    function set maximum(max)
    {
        var _loc1 = this;
        _loc1.__maximum = max;
        _loc1.correctValues();
        _loc1.invalidate();
        //return (_loc1.maximum());
    } // End of the function
    function get maximum()
    {
        return (this.__maximum);
    } // End of the function
    function set minimum(min)
    {
        var _loc1 = this;
        _loc1.__minimum = min;
        _loc1.correctValues();
        _loc1.invalidate();
        //return (_loc1.minimum());
    } // End of the function
    function get minimum()
    {
        return (this.__minimum);
    } // End of the function
    function set pageSize(ps)
    {
        this.__pageSize = ps;
        //return (this.pageSize());
        null;
    } // End of the function
    function get pageSize()
    {
        return (this.__pageSize);
    } // End of the function
    function set thumbScale(ts)
    {
        var _loc1 = this;
        _loc1.__thumbScale = ts;
        if (_loc1.__thumbScale >= 1)
        {
            _loc1.__thumbScale = 1;
            _loc1.__thumb._visible = false;
        }
        else
        {
            _loc1.__thumb._visible = true;
            _loc1.thumbSize = Math.ceil((_loc1.__limitB - _loc1.__limitA) * _loc1.__thumbScale);
        } // end else if
        _loc1.setThumbPos();
        //return (_loc1.thumbScale());
    } // End of the function
    function get thumbScale()
    {
        return (this.__thumbScale);
    } // End of the function
    function set value(val)
    {
        var _loc1 = this;
        _loc1.__value = val;
        _loc1.correctValues();
        _loc1.setThumbPos();
        //return (_loc1.value());
    } // End of the function
    function get value()
    {
        return (this.__value);
    } // End of the function
    var clipParameters = {lineScroll: 1, maximum: 1, minimum: 1, value: 1};
    var __isOver = false;
    var __limitA = 16;
    var __lineScroll = 1;
    var __maximum = 100;
    var __minimum = 0;
    var __value = 0;
} // End of Class
