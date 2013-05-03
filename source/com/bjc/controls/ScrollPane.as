class com.bjc.controls.ScrollPane extends com.bjc.core.BJCComponent
{
    var __content, __contentPath, __progress, __hScrollBar, __vScrollBar, __get__content, __set__contentPath, __get__contentPath, __set__dragContent, __get__dragContent, __set__hScrollPosition, __get__hScrollPosition, __get__maxHScrollPosition, __get__maxVScrollPosition, __get__progress, __set__scrollBarPolicy, __get__scrollBarPolicy, __set__scrollBarWidth, __get__scrollBarWidth, __set__vScrollPosition, __get__vScrollPosition, __set__zoom, __get__zoom;
    function ScrollPane(Void)
    {
        super();
    } // End of the function
    function init(Void)
    {
        var _loc1 = this;
        super.init();
        mx.events.EventDispatcher.initialize(_loc1);
        _loc1.__mask._x = 2;
        _loc1.__mask._y = 2;
        _loc1.__hScrollBar.addEventListener("change", mx.utils.Delegate.create(_loc1, _loc1.onHScroll));
        _loc1.__hScrollBar.addEventListener("focus", mx.utils.Delegate.create(_loc1, _loc1.onScrollFocus));
        _loc1.__hScrollBar.__set__lineScroll(10);
        _loc1.__hScrollBar.__set__minimum(-2);
        _loc1.__hScrollBar.__set__disabledAlpha(100);
        _loc1.__vScrollBar.addEventListener("change", mx.utils.Delegate.create(_loc1, _loc1.onVScroll));
        _loc1.__vScrollBar.addEventListener("focus", mx.utils.Delegate.create(_loc1, _loc1.onScrollFocus));
        _loc1.__vScrollBar.__set__lineScroll(10);
        _loc1.__vScrollBar.__set__minimum(-2);
        _loc1.__vScrollBar.__set__disabledAlpha(100);
        _loc1.__background.onPress = mx.utils.Delegate.create(_loc1, _loc1.onDrag);
        _loc1.__background.onRelease = _loc1.__background.onReleaseOutside = mx.utils.Delegate.create(_loc1, _loc1.onDrop);
        _loc1.__background.useHandCursor = _loc1.__dragContent;
        if (_loc1.__contentPath != undefined)
        {
            _loc1.loadContent();
        } // end if
        _loc1.draw();
    } // End of the function
    function createChildren(Void)
    {
        var _loc1 = this;
        _loc1.attachMovie("Resizer", "__background", 0);
        _loc1.__background.__set__skin("scrollPaneSkin");
        _loc1.__background.__set__margin(5);
        _loc1.createEmptyMovieClip("__content", 1);
        _loc1.attachMovie("HorizScrollBar", "__hScrollBar", 2);
        _loc1.attachMovie("VertScrollBar", "__vScrollBar", 3);
        _loc1.attachMovie("scrollPaneCornerSkin", "__corner", 4);
        _loc1.createEmptyMovieClip("__mask", 5);
        _loc1.attachMovie("Resizer", "__focus", 6);
        _loc1.__focus.skin = "focusSkin";
        _loc1.__focus.margin = 5;
        _loc1.__focus._visible = false;
        _loc1.makeMask();
    } // End of the function
    function draw(Void)
    {
        var _loc1 = this;
        _loc1.__vScrollBar.__set__enabled(_loc1.__enabled);
        _loc1.__hScrollBar.__set__enabled(_loc1.__enabled);
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
        _loc1.__mask._width = _loc1.__width - 4;
        _loc1.__mask._height = _loc1.__height - 4;
        _loc1.__focus.setSize(_loc1.__width, _loc1.__height);
        _loc1.__background.setSize(_loc1.__width, _loc1.__height);
        _loc1.sizeScrolls();
    } // End of the function
    static function create(target, id, depth, initObj)
    {
        return (target.attachMovie("ScrollPane", id, depth, initObj));
    } // End of the function
    function alignLeft(Void)
    {
        var _loc1 = this;
        _loc1.__hScrollBar.__set__value(_loc1.__hScrollBar.minimum);
        _loc1.__content._x = -_loc1.__hScrollBar.__get__value();
    } // End of the function
    function alignTop(Void)
    {
        var _loc1 = this;
        _loc1.__vScrollBar.__set__value(_loc1.__vScrollBar.minimum);
        _loc1.__content._y = -_loc1.__vScrollBar.__get__value();
    } // End of the function
    function refresh(Void)
    {
        var _loc1 = this;
        _loc1.sizeScrolls();
        if (_loc1.getContentWidth() < _loc1.getPaneWidth() || _loc1.__content._x < Number(-_loc1.__hScrollBar.__get__maximum() + 2))
        {
            _loc1.__content._x = 2;
        } // end if
        if (_loc1.getContentHeight() < _loc1.getPaneHeight() || _loc1.__content._y < Number(-_loc1.__vScrollBar.__get__maximum() + 2))
        {
            _loc1.__content._y = 2;
        } // end if
        _loc1.sizeScrolls();
        _loc1.update();
    } // End of the function
    function zoomFull(Void)
    {
        var _loc1 = this;
        _loc1.__set__zoom(100);
        var _loc3 = _loc1.__width / _loc1.getContentWidth();
        var _loc2 = _loc1.__height / _loc1.getContentHeight();
        if (_loc2 < _loc3)
        {
            _loc1.zoomHeight();
            return;
        } // end if
        _loc1.zoomWidth();
    } // End of the function
    function zoomHeight(Void)
    {
        var _loc1 = this;
        _loc1.__set__zoom(100);
        _loc1.__set__zoom((_loc1.__height - 5) / _loc1.getContentHeight() * 100);
        if (_loc1.needsHScroll())
        {
            _loc1.__set__zoom(100);
            _loc1.__set__zoom((_loc1.__height - _loc1.__scrollBarWidth - 4) / _loc1.getContentHeight() * 100);
        } // end if
    } // End of the function
    function zoomWidth(Void)
    {
        var _loc1 = this;
        _loc1.__set__zoom(100);
        _loc1.__set__zoom((_loc1.__width - 5) / _loc1.getContentWidth() * 100);
        if (_loc1.needsVScroll())
        {
            _loc1.__set__zoom(100);
            _loc1.__set__zoom((_loc1.__width - _loc1.__scrollBarWidth - 4) / _loc1.getContentWidth() * 100);
        } // end if
    } // End of the function
    function getContentHeight(Void)
    {
        return (this.__content.getBounds(this.__content).yMax);
    } // End of the function
    function getContentWidth(Void)
    {
        return (this.__content.getBounds(this.__content).xMax);
    } // End of the function
    function getLeftLimit()
    {
        return (Math.min(0, this.getPaneWidth() - this.getContentWidth()) + 2);
    } // End of the function
    function getPaneCenterX(Void)
    {
        return (this.getPaneWidth() / 2);
    } // End of the function
    function getPaneCenterY(Void)
    {
        return (this.getPaneHeight() / 2);
    } // End of the function
    function getPaneHeight(Void)
    {
        var _loc1 = this;
        if (_loc1.__hScrollBar._visible || _loc1.__scrollBarPolicy == "yes")
        {
            return (_loc1.__height - _loc1.__scrollBarWidth - 4);
            
        }
        else
        {
            return (_loc1.__height - 4);
        } // end else if
    } // End of the function
    function getPaneWidth(Void)
    {
        var _loc1 = this;
        if (_loc1.__vScrollBar._visible || _loc1.__scrollBarPolicy == "yes")
        {
            return (_loc1.__width - _loc1.__scrollBarWidth - 4);
            
        }
        else
        {
            return (_loc1.__width - 4);
        } // end else if
    } // End of the function
    function getTopLimit()
    {
        return (Math.min(0, this.getPaneHeight() - this.getContentHeight()) + 2);
    } // End of the function
    function loadContent(Void)
    {
        var _loc1 = this;
        if (_loc1.__content != undefined && _loc1.__contentPath != "" && _loc1.__contentPath != undefined)
        {
            _loc1.__content.content.removeMovieClip();
            _loc1.__content.attachMovie(_loc1.__contentPath, "content", 0);
            if (_loc1.__content.content != undefined)
            {
                _loc1.__content._x = 2;
                _loc1.__content._y = 2;
                _loc1.__content.content._xscale = _loc1.__zoom;
                _loc1.__content.content._yscale = _loc1.__zoom;
                _loc1.sizeScrolls();
                _loc1.update();
                _loc1.__progress = 100;
                _loc1.dispatchEvent({type: "load", target: _loc1});
                return;
            } // end if
            _loc1.__loadedCount = 0;
            _loc1.__progressCount = 0;
            _loc1.__content.createEmptyMovieClip("content", 0);
            _loc1.__content._visible = false;
            _loc1.__content.content.loadMovie(_loc1.__contentPath);
            _loc1.__progress = 0;
            _loc1.onEnterFrame = _loc1.preload;
        } // end if
    } // End of the function
    function makeMask(Void)
    {
        var _loc1 = this;
        _loc1.__mask.beginFill(0);
        _loc1.__mask.lineTo(100, 0);
        _loc1.__mask.lineTo(100, 100);
        _loc1.__mask.lineTo(0, 100);
        _loc1.__mask.lineTo(0, 0);
        _loc1.__mask.endFill();
        _loc1.__content.setMask(_loc1.__mask);
    } // End of the function
    function needsCorner(Void)
    {
        var _loc1 = this;
        if (_loc1.__scrollBarPolicy == "yes")
        {
            return (true);
            
        }
        else if (_loc1.__scrollBarPolicy == "no")
        {
            return (false);
            
        }
        else
        {
            return (_loc1.__hScrollBar._visible && _loc1.__vScrollBar._visible);
        } // end else if
    } // End of the function
    function needsHScroll(Void)
    {
        var _loc1 = this;
        if (_loc1.__scrollBarPolicy == "yes")
        {
            return (true);
            
        }
        else if (_loc1.__scrollBarPolicy == "no")
        {
            return (false);
            
        }
        else
        {
            return (_loc1.getContentWidth() > _loc1.__width - 4);
        } // end else if
    } // End of the function
    function needsVScroll(Void)
    {
        var _loc1 = this;
        if (_loc1.__scrollBarPolicy == "yes")
        {
            return (true);
            
        }
        else if (_loc1.__scrollBarPolicy == "no")
        {
            return (false);
            
        }
        else
        {
            return (_loc1.getContentHeight() > _loc1.__height - 4);
        } // end else if
    } // End of the function
    function onDrag(Void)
    {
        var _loc1 = this;
        if (_loc1.__dragContent && _loc1.__enabled)
        {
            _loc1.__content.startDrag(false, Math.round(_loc1.getLeftLimit()), Math.round(_loc1.getTopLimit()), 2, 2);
            _loc1.__loadedCount = 0;
            _loc1.onEnterFrame = _loc1.update;
        } // end if
    } // End of the function
    function onDrop(Void)
    {
        var _loc1 = this;
        _loc1.__content.stopDrag();
        delete _loc1.onEnterFrame;
        if (Selection.getFocus() ne "" + _loc1)
        {
            Selection.setFocus(_loc1);
        } // end if
    } // End of the function
    function onHScroll(evtObj)
    {
        var _loc1 = this;
        if (_loc1.getContentWidth() > _loc1.getPaneWidth())
        {
            _loc1.__content._x = Math.round(-_loc1.__hScrollBar.__get__value());
            _loc1.dispatchEvent({type: "scroll", target: _loc1, x: _loc1.__hScrollBar.__get__value() + 2, y: _loc1.__vScrollBar.__get__value() + 2});
        } // end if
    } // End of the function
    function onKeyPressed(Void)
    {
        var _loc1 = this;
        if (Selection.getFocus() eq "" + _loc1 && _loc1.__enabled && _loc1.__keyEnabled)
        {
            if (Key.getCode() == 40 && _loc1.getContentHeight() > _loc1.getPaneHeight())
            {
                _loc1.__set__vScrollPosition(++_loc1.__get__vScrollPosition());
                return;
            } // end if
            if (Key.getCode() == 38 && _loc1.getContentHeight() > _loc1.getPaneHeight())
            {
                _loc1.__set__vScrollPosition(--_loc1.__get__vScrollPosition());
                return;
            } // end if
            if (Key.getCode() == 39 && _loc1.getContentWidth() > _loc1.getPaneWidth())
            {
                _loc1.__set__hScrollPosition(++_loc1.__get__hScrollPosition());
                return;
            } // end if
            if (Key.getCode() == 37 && _loc1.getContentWidth() > _loc1.getPaneWidth())
            {
                _loc1.__set__hScrollPosition(--_loc1.__get__hScrollPosition());
            } // end if
        } // end if
    } // End of the function
    function onKillFocus(newFocus)
    {
        var _loc1 = this;
        Mouse.removeListener(_loc1);
        Key.removeListener(_loc1.__keyListener);
        _loc1.__keyListener = null;
        _loc1.hideFocus();
        _loc1.dispatchEvent({type: "killFocus", target: _loc1, newfocus: newFocus});
    } // End of the function
    function onMouseWheel(delta)
    {
        var _loc1 = this;
        if (_loc1.__enabled && _loc1._xmouse > 0 && _loc1._xmouse < _loc1.__width && _loc1._ymouse > 0 && _loc1._ymouse < _loc1.__height)
        {
            _loc1.__vScrollBar.value = _loc1.__vScrollBar.value - delta * 4;
            _loc1.onVScroll();
        } // end if
    } // End of the function
    function onScrollFocus(evtObj)
    {
        if (Selection.getFocus() ne "" + this)
        {
            Selection.setFocus(this);
        } // end if
    } // End of the function
    function onSetFocus(oldFocus)
    {
        var _loc1 = this;
        Mouse.addListener(_loc1);
        if (_loc1.__keyListener == null || _loc1.__keyListener == undefined)
        {
            _loc1.__keyListener = new Object();
            _loc1.__keyListener.onKeyDown = mx.utils.Delegate.create(_loc1, _loc1.onKeyPressed);
            Key.addListener(_loc1.__keyListener);
        } // end if
        _loc1.dispatchEvent({type: "focus", target: _loc1, oldfocus: oldFocus});
        if (Key.isDown(9))
        {
            _loc1.showFocus();
            _loc1.dispatchEvent({type: "tabFocus", target: _loc1, oldfocus: oldFocus});
        } // end if
    } // End of the function
    function onVScroll(evtObj)
    {
        var _loc1 = this;
        if (_loc1.getContentHeight() > _loc1.getPaneHeight())
        {
            _loc1.__content._y = Math.round(-_loc1.__vScrollBar.__get__value());
            _loc1.dispatchEvent({type: "scroll", target: _loc1, x: _loc1.__hScrollBar.__get__value() + 2, y: _loc1.__vScrollBar.__get__value() + 2});
        } // end if
    } // End of the function
    function preload(Void)
    {
        var _loc1 = this;
        if (_loc1.__loadedCount > 5)
        {
            _loc1.__content.content._xscale = _loc1.__zoom;
            _loc1.__content.content._yscale = _loc1.__zoom;
            _loc1.__content._visible = true;
            _loc1.__content._x = 2;
            _loc1.__content._y = 2;
            _loc1.sizeScrolls();
            _loc1.update();
            _loc1.dispatchEvent({type: "load", target: _loc1});
            delete _loc1.onEnterFrame;
        } // end if
        var _loc2 = _loc1.__content.content.getBytesLoaded();
        var _loc3 = _loc1.__content.content.getBytesTotal();
        _loc1.__progress = _loc2 / _loc3 * 100;
        ++_loc1.__progressCount;
        if (_loc1.__progressCount > 200 && _loc1.__progress == 0)
        {
            delete _loc1.onEnterFrame;
            _loc1.__set__contentPath("");
            _loc1.__content.content.removeMovieClip();
            _loc1.__content._visible = true;
            _loc1.refresh();
        } // end if
        if (_loc2 > 4 && _loc2 == _loc3)
        {
            ++_loc1.__loadedCount;
        } // end if
        _loc1.dispatchEvent({type: "progress", target: _loc1});
    } // End of the function
    function update(Void)
    {
        var _loc1 = this;
        _loc1.__hScrollBar.__set__value(-_loc1.__content._x);
        _loc1.__vScrollBar.__set__value(-_loc1.__content._y);
        _loc1.dispatchEvent({type: "scroll", target: _loc1, x: _loc1.__hScrollBar.__get__value() + 2, y: _loc1.__vScrollBar.__get__value() + 2});
    } // End of the function
    function sizeCorner(Void)
    {
        var _loc1 = this;
        if (_loc1.needsCorner())
        {
            _loc1.__corner._visible = true;
            _loc1.__corner._x = _loc1.__vScrollBar._x;
            _loc1.__corner._y = _loc1.__hScrollBar._y;
            _loc1.__corner._width = _loc1.__corner._height = _loc1.__scrollBarWidth;
            return;
        } // end if
        _loc1.__corner._visible = false;
    } // End of the function
    function sizeHScroll(Void)
    {
        var _loc1 = this;
        if (_loc1.needsHScroll() || _loc1.needsVScroll() && _loc1.getContentWidth() > _loc1.__width - _loc1.__scrollBarWidth - 2)
        {
            _loc1.__hScrollBar._visible = true;
            _loc1.__hScrollBar.move(1, _loc1.__height - _loc1.__scrollBarWidth - 1);
            _loc1.__hScrollBar.setSize(_loc1.getPaneWidth() + 2, _loc1.__scrollBarWidth);
            _loc1.__hScrollBar.__set__maximum(_loc1.getContentWidth() - _loc1.getPaneWidth() - 2);
            _loc1.__hScrollBar.__set__thumbScale(_loc1.__hScrollBar.__get__width() / (_loc1.__hScrollBar.__get__maximum() + _loc1.__hScrollBar.__get__width()));
            return;
        } // end if
        _loc1.__hScrollBar._visible = false;
    } // End of the function
    function sizeScrolls(Void)
    {
        var _loc1 = this;
        if (_loc1.__content.content != undefined)
        {
            _loc1.sizeHScroll();
            _loc1.sizeVScroll();
            _loc1.sizeCorner();
            return;
        } // end if
        _loc1.__hScrollBar._visible = false;
        _loc1.__vScrollBar._visible = false;
        _loc1.__corner._visible = false;
    } // End of the function
    function sizeVScroll(Void)
    {
        var _loc1 = this;
        if (_loc1.needsVScroll() || _loc1.needsHScroll() && _loc1.getContentHeight() > _loc1.__height - _loc1.__scrollBarWidth - 2)
        {
            _loc1.__vScrollBar._visible = true;
            _loc1.__vScrollBar.move(_loc1.__width - _loc1.__scrollBarWidth - 1, 1);
            _loc1.__vScrollBar.setSize(_loc1.__scrollBarWidth, _loc1.getPaneHeight() + 2);
            _loc1.__vScrollBar.__set__maximum(_loc1.getContentHeight() - _loc1.getPaneHeight() - 2);
            _loc1.__vScrollBar.__set__thumbScale(_loc1.__vScrollBar.__get__height() / (_loc1.__vScrollBar.__get__maximum() + _loc1.__vScrollBar.__get__height()));
            return;
        } // end if
        _loc1.__vScrollBar._visible = false;
    } // End of the function
    function get content()
    {
        return (this.__content.content);
    } // End of the function
    function set contentPath(path)
    {
        var _loc1 = this;
        _loc1.__contentPath = path;
        _loc1.loadContent();
        //return (_loc1.contentPath());
    } // End of the function
    function get contentPath()
    {
        return (this.__contentPath);
    } // End of the function
    function set dragContent(b)
    {
        var _loc1 = this;
        _loc1.__dragContent = b;
        _loc1.__background.useHandCursor = _loc1.__dragContent;
        //return (_loc1.dragContent());
    } // End of the function
    function get dragContent()
    {
        return (this.__dragContent);
    } // End of the function
    function get progress()
    {
        return (this.__progress);
    } // End of the function
    function set scrollBarPolicy(p)
    {
        var _loc1 = this;
        _loc1.__scrollBarPolicy = p;
        _loc1.refresh();
        //return (_loc1.scrollBarPolicy());
    } // End of the function
    function get scrollBarPolicy()
    {
        return (this.__scrollBarPolicy);
    } // End of the function
    function set scrollBarWidth(w)
    {
        var _loc1 = this;
        _loc1.__scrollBarWidth = w;
        if (_loc1.__vScrollBar != undefined && _loc1.__hScrollBar != undefined)
        {
            _loc1.__scrollBarWidth = Math.min(_loc1.__width * 0.250000, _loc1.__scrollBarWidth);
            _loc1.__scrollBarWidth = Math.min(_loc1.__height * 0.250000, _loc1.__scrollBarWidth);
        } // end if
        _loc1.invalidate();
        //return (_loc1.scrollBarWidth());
    } // End of the function
    function get scrollBarWidth()
    {
        return (this.__scrollBarWidth);
    } // End of the function
    function set hScrollPosition(pos)
    {
        var _loc1 = this;
        _loc1.__hScrollBar.__set__value(pos - 2);
        _loc1.__content._x = -_loc1.__hScrollBar.__get__value();
        //return (_loc1.hScrollPosition());
    } // End of the function
    function get hScrollPosition()
    {
        //return (this.__hScrollBar.value() + 2);
    } // End of the function
    function get maxHScrollPosition()
    {
        //return (this.__hScrollBar.maximum() + 2);
    } // End of the function
    function set vScrollPosition(pos)
    {
        var _loc1 = this;
        _loc1.__vScrollBar.__set__value(pos - 2);
        _loc1.__content._y = -_loc1.__vScrollBar.__get__value();
        //return (_loc1.vScrollPosition());
    } // End of the function
    function get vScrollPosition()
    {
        //return (this.__vScrollBar.value() + 2);
    } // End of the function
    function get maxVScrollPosition()
    {
        //return (this.__vScrollBar.maximum() + 2);
    } // End of the function
    function set zoom(z)
    {
        var _loc1 = this;
        var cx = (_loc1.getPaneCenterX() - _loc1.__content._x) / _loc1.__zoom;
        var cy = (_loc1.getPaneCenterY() - _loc1.__content._y) / _loc1.__zoom;
        _loc1.__zoom = z;
        _loc1.__content.content._xscale = _loc1.__zoom;
        _loc1.__content.content._yscale = _loc1.__zoom;
        var _loc3 = _loc1.getPaneCenterX() - cx * _loc1.__zoom;
        var _loc2 = _loc1.getPaneCenterY() - cy * _loc1.__zoom;
        _loc3 = Math.max(_loc3, _loc1.getLeftLimit());
        _loc2 = Math.max(_loc2, _loc1.getTopLimit());
        _loc1.__content._x = Math.min(_loc3, 2);
        _loc1.__content._y = Math.min(_loc2, 2);
        _loc1.sizeScrolls();
        _loc1.update();
        //return (_loc1.zoom());
    } // End of the function
    function get zoom()
    {
        return (this.__zoom);
    } // End of the function
    var clipParameters = {contentPath: 1, dragContent: 1, scrollBarWidth: 1, zoom: 1};
    var __dragContent = true;
    var __loadedCount = 0;
    var __scrollBarWidth = 16;
    var __scrollBarPolicy = "auto";
    var __zoom = 100;
} // End of Class
