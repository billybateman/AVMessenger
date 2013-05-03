class com.bjc.controls.PushButton extends com.bjc.core.LabelWrapper
{
    var __set__align, __get__align, __set__label, __get__label, __set__margin, __get__margin, __set__selected, __get__selected, __set__toggle, __get__toggle;
    function PushButton(Void)
    {
        super();
    } // End of the function
    function init(Void)
    {
        var _loc1 = this;
        super.init();
        mx.events.EventDispatcher.initialize(_loc1);
        _loc1.__up.__set__skin("buttonUpSkin");
        _loc1.__up.__set__margin(_loc1.__margin);
        _loc1.__over.__set__skin("buttonOverSkin");
        _loc1.__over.__set__margin(_loc1.__margin);
        _loc1.__over._visible = false;
        _loc1.__down.__set__skin("buttonDownSkin");
        _loc1.__down.__set__margin(_loc1.__margin);
        _loc1.__down._visible = false;
        _loc1.__label.__set__align(_loc1.__align);
        _loc1.__label.__set__fontColor(6710886);
        _loc1.__shadow.__set__skin("buttonShadow");
        _loc1.__shadow.__set__margin(_loc1.__margin);
        _loc1.draw();
    } // End of the function
    function createChildren(Void)
    {
        var _loc1 = this;
        _loc1.attachMovie("Resizer", "__shadow", 0);
        _loc1.attachMovie("Resizer", "__up", 1);
        _loc1.attachMovie("Resizer", "__over", 2);
        _loc1.attachMovie("Resizer", "__down", 3);
        _loc1.attachMovie("Label", "__label", 4);
        _loc1.attachMovie("Resizer", "__focus", 5);
        _loc1.__focus.skin = "focusSkin";
        _loc1.__focus.margin = 5;
        _loc1.__focus._visible = false;
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
        _loc1.__label.__set__enabled(_loc1.__enabled);
        if (!_loc1.__toggle)
        {
            _loc1.__selected = false;
        } // end if
        if (_loc1.__selected)
        {
            _loc1.__up._visible = false;
            _loc1.__over._visible = false;
            _loc1.__down._visible = true;
        }
        else
        {
            _loc1.__up._visible = true;
            _loc1.__over._visible = false;
            _loc1.__down._visible = false;
        } // end else if
        _loc1.__label.__set__text(_loc1.__labelText);
        _loc1.__label.__set__align(_loc1.__align);
        _loc1.__label.__set__disabledColor(_loc1.__disabledColor);
        _loc1.__label.__set__embedFont(_loc1.__embedFont);
        _loc1.__label.__set__fontColor(_loc1.__fontColor);
        _loc1.__label.__set__fontFace(_loc1.__fontFace);
        _loc1.__label.__set__fontSize(_loc1.__fontSize);
        _loc1.__label.__set__html(_loc1.__html);
        _loc1.size();
    } // End of the function
    function size(Void)
    {
        var _loc1 = this;
        _loc1.__focus.setSize(_loc1.__width, _loc1.__height);
        _loc1.__up.setSize(_loc1.__width, _loc1.__height);
        _loc1.__over.setSize(_loc1.__width, _loc1.__height);
        _loc1.__down.setSize(_loc1.__width, _loc1.__height);
        _loc1.__label.move(3, 0);
        _loc1.__label.setSize(_loc1.__width - 6, _loc1.__height);
        _loc1.__shadow.setSize(_loc1.__width, _loc1.__height);
        _loc1.__shadow._y = 4;
    } // End of the function
    static function create(target, id, depth, initObj)
    {
        return (target.attachMovie("PushButton", id, depth, initObj));
    } // End of the function
    function onKeyPressed(Void)
    {
        var _loc1 = this;
        if (Selection.getFocus() eq "" + _loc1 && _loc1.__enabled && _loc1.__keyEnabled)
        {
            if (Key.getCode() == 13 || Key.getCode() == 32)
            {
                _loc1.onPress();
            } // end if
        } // end if
    } // End of the function
    function onKeyReleased(Void)
    {
        var _loc1 = this;
        if (Selection.getFocus() eq "" + _loc1 && _loc1.__enabled && _loc1.__keyEnabled)
        {
            if (Key.getCode() == 13 || Key.getCode() == 32)
            {
                _loc1.onRelease();
            } // end if
        } // end if
    } // End of the function
    function onKillFocus(newFocus)
    {
        var _loc1 = this;
        Key.removeListener(_loc1.__keyListener);
        _loc1.__keyListener = null;
        _loc1.hideFocus();
        _loc1.dispatchEvent({type: "killFocus", target: _loc1, newfocus: newFocus});
    } // End of the function
    function onSetFocus(oldFocus)
    {
        var _loc1 = this;
        if (_loc1.__keyListener == null || _loc1.__keyListener == undefined)
        {
            _loc1.__keyListener = new Object();
            _loc1.__keyListener.onKeyDown = mx.utils.Delegate.create(_loc1, _loc1.onKeyPressed);
            _loc1.__keyListener.onKeyUp = mx.utils.Delegate.create(_loc1, _loc1.onKeyReleased);
            Key.addListener(_loc1.__keyListener);
        } // end if
        _loc1.dispatchEvent({type: "focus", target: _loc1, oldfocus: oldFocus});
        if (Key.isDown(9))
        {
            _loc1.showFocus();
            _loc1.dispatchEvent({type: "tabFocus", target: _loc1, oldfocus: oldFocus});
        } // end if
    } // End of the function
    function onPress(Void)
    {
        var _loc1 = this;
        if (_loc1.__enabled)
        {
            _loc1.__up._visible = false;
            _loc1.__over._visible = false;
            _loc1.__down._visible = true;
        } // end if
    } // End of the function
    function onRelease(Void)
    {
        var _loc1 = this;
        if (_loc1.__enabled)
        {
            if (_loc1.__toggle)
            {
                _loc1.__selected = !_loc1.__selected;
            } // end if
            if (!_loc1.__selected)
            {
                if (_loc1._xmouse > 0 && _loc1._xmouse < _loc1.__width && _loc1._ymouse > 0 && _loc1._ymouse < _loc1.__height)
                {
                    _loc1.__up._visible = false;
                    _loc1.__over._visible = true;
                    _loc1.__down._visible = false;
                }
                else
                {
                    _loc1.__up._visible = true;
                    _loc1.__over._visible = false;
                    _loc1.__down._visible = false;
                } // end if
            } // end else if
            _loc1.dispatchEvent({type: "click", target: _loc1});
            if (Selection.getFocus() ne "" + _loc1)
            {
                Selection.setFocus(_loc1);
            } // end if
        } // end if
    } // End of the function
    function onReleaseOutside(Void)
    {
        var _loc1 = this;
        if (_loc1.__enabled)
        {
            if (!_loc1.__selected)
            {
                _loc1.__up._visible = true;
                _loc1.__over._visible = false;
                _loc1.__down._visible = false;
            } // end if
            _loc1.dispatchEvent({type: "releaseOutside", target: _loc1});
        } // end if
    } // End of the function
    function onRollOut(Void)
    {
        var _loc1 = this;
        if (_loc1.__enabled)
        {
            if (!_loc1.__selected)
            {
                _loc1.__up._visible = true;
                _loc1.__over._visible = false;
                _loc1.__down._visible = false;
            } // end if
            _loc1.dispatchEvent({type: "rollOut", target: _loc1});
        } // end if
    } // End of the function
    function onRollOver(Void)
    {
        var _loc1 = this;
        if (_loc1.__enabled)
        {
            if (!_loc1.__selected)
            {
                _loc1.__up._visible = false;
                _loc1.__over._visible = true;
                _loc1.__down._visible = false;
            } // end if
            _loc1.dispatchEvent({type: "rollOver", target: _loc1});
        } // end if
    } // End of the function
    function set align(a)
    {
        var _loc1 = this;
        _loc1.__align = a;
        _loc1.invalidate();
        //return (_loc1.align());
    } // End of the function
    function get align()
    {
        return (this.__align);
    } // End of the function
    function set margin(m)
    {
        var _loc1 = this;
        _loc1.__margin = m;
        _loc1.__up.__set__margin(_loc1.__margin);
        _loc1.__over.__set__margin(_loc1.__margin);
        _loc1.__down.__set__margin(_loc1.__margin);
        _loc1.invalidate();
        //return (_loc1.margin());
    } // End of the function
    function get margin()
    {
        return (this.__margin);
    } // End of the function
    function set selected(b)
    {
        var _loc1 = this;
        _loc1.__selected = b;
        _loc1.invalidate();
        //return (_loc1.selected());
    } // End of the function
    function get selected()
    {
        return (this.__selected);
    } // End of the function
    function set label(txt)
    {
        var _loc1 = this;
        _loc1.__labelText = txt;
        _loc1.invalidate();
        //return (_loc1.label());
    } // End of the function
    function get label()
    {
        return (this.__labelText);
    } // End of the function
    function set toggle(b)
    {
        var _loc1 = this;
        _loc1.__toggle = b;
        if (!_loc1.__toggle)
        {
            _loc1.__selected = false;
        } // end if
        _loc1.invalidate();
        //return (_loc1.toggle());
    } // End of the function
    function get toggle()
    {
        return (this.__toggle);
    } // End of the function
    var clipParameters = {align: 1, selected: 1, label: 1, toggle: 1};
    static var mergedClipParameters = com.bjc.core.BJCComponent.mergeClipParameters(com.bjc.controls.PushButton.prototype.clipParameters, com.bjc.core.LabelWrapper.prototype.clipParameters);
    var __align = "center";
    var __labelText = "";
    var __margin = 8;
    var __selected = false;
    var __toggle = false;
} // End of Class
