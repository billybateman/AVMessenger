class com.bjc.controls.TextArea extends com.bjc.core.LabelWrapper
{
    var __scrollBar, __tf, attachMovie, __background, createTextField, __fontColor, __fontSize, __fontFace, __format, __align, __enabled, _alpha, __disabledColor, __embedFont, __html, __disableStyles, __height, __width, onEnterFrame, _xmouse, _ymouse, dispatchEvent, invalidate, __get__condenseWhite, __get__editable, __get__maxChars, __get__password, __get__restrict, __get__scroll, __get__scrollBarWidth, __get__selectable, __get__text, __get__tabIndex, __set__condenseWhite, __set__editable, __set__maxChars, __get__maxscroll, __set__password, __set__restrict, __set__scroll, __set__scrollBarWidth, __set__selectable, __set__tabIndex, __set__text, __get__textField, __get__textHeight;
    function TextArea(Void)
    {
        super();
    } // End of the function
    function init(Void)
    {
        super.init();
        mx.events.EventDispatcher.initialize(this);
        Mouse.addListener(this);
        __scrollBar._visible = false;
        __scrollBar.__set__minimum(1);
        __scrollBar.addEventListener("change", mx.utils.Delegate.create(this, onScrollBar));
        __tf.type = "input";
        __tf.multiline = true;
        __tf.wordWrap = true;
        __tf.onChanged = mx.utils.Delegate.create(this, onTFChanged);
        __tf.onScroller = mx.utils.Delegate.create(this, update);
        __tf.onSetFocus = mx.utils.Delegate.create(this, onTFFocus);
        __tf.onKillFocus = mx.utils.Delegate.create(this, onTFKillFocus);
        this.draw();
    } // End of the function
    function createChildren(Void)
    {
        this.attachMovie("Resizer", "__background", 0);
        __background.__set__margin(5);
        __background.__set__skin("textAreaSkin");
        this.createTextField("__tf", 1, 2, 2, 96, 40);
        this.attachMovie("VertScrollBar", "__scrollBar", 2);
    } // End of the function
    function draw(Void)
    {
        __format = new TextFormat(__fontFace, __fontSize, __fontColor);
        __format.align = __align;
        __scrollBar.__set__enabled(__enabled);
        if (!__enabled)
        {
            _alpha = 50;
            __format.color = __disabledColor;
            __tf.type = "dynamic";
            __tf.selectable = false;
        }
        else
        {
            _alpha = 100;
            __tf.type = "input";
            __tf.selectable = true;
        } // end else if
        if (!_global.isLivePreview)
        {
            __tf.embedFonts = __embedFont;
        } // end if
        if (__editable)
        {
            __tf.type = "input";
        }
        else
        {
            __tf.type = "dynamic";
        } // end else if
        if (__selectable && __enabled)
        {
            __tf.selectable = true;
        }
        else
        {
            __tf.selectable = false;
        } // end else if
        __tf.restrict = __restrict;
        __tf.maxChars = __maxChars;
        __tf.password = __password;
        if (__html)
        {
            __tf.html = true;
            __tf.htmlText = __text;
        }
        else
        {
            __tf.html = false;
            __tf.text = __text;
        } // end else if
        __tf.condenseWhite = __condenseWhite;
        if (!__disableStyles)
        {
            __tf.setTextFormat(__format);
            __tf.setNewTextFormat(__format);
        } // end if
        this.size();
    } // End of the function
    function size(Void)
    {
        __height = Math.max(__height, __scrollBarWidth);
        __background.setSize(__width, __height);
        this.checkScrollBar();
        __tf._height = __height - 4;
        __scrollBar.move(__width - __scrollBarWidth - 1, 1);
        __scrollBar.setSize(__scrollBarWidth, __height - 2);
        __update = true;
        __updateCount = 0;
        onEnterFrame = doUpdate;
    } // End of the function
    function doUpdate()
    {
        this.update();
        if (__updateCount++ > 3)
        {
            delete this.onEnterFrame;
        } // end if
    } // End of the function
    static function create(target, id, depth, initObj)
    {
        return ((com.bjc.controls.TextArea)(target.attachMovie("TextArea", id, depth, initObj)));
    } // End of the function
    function checkScrollBar(Void)
    {
        if (__tf.maxscroll > 1)
        {
            __tf._width = __width - __scrollBarWidth - 2;
            __scrollBar._visible = true;
        }
        else
        {
            __tf._width = __width - 4;
            __scrollBar._visible = false;
        } // end else if
    } // End of the function
    function onMouseWheel(delta)
    {
        if (__selectable && _xmouse > 0 && _xmouse < __width && _ymouse > 0 && _ymouse < __height)
        {
            __tf.scroll = __tf.scroll - delta / 4;
            this.dispatchEvent({type: "scroll"});
        } // end if
        this.update();
    } // End of the function
    function onTFChanged(Void)
    {
        if (__html)
        {
            __text = __tf.htmlText;
        }
        else
        {
            __text = __tf.text;
        } // end else if
        this.checkScrollBar();
        this.update();
        this.dispatchEvent({type: "change"});
    } // End of the function
    function onTFFocus(oldFocus)
    {
        this.dispatchEvent({type: "focus"});
    } // End of the function
    function onTFKillFocus(newFocus)
    {
        this.dispatchEvent({type: "killFocus"});
    } // End of the function
    function onScrollBar(evtObj)
    {
        __update = false;
        __tf.scroll = __scrollBar.value;
        this.dispatchEvent({type: "scroll"});
    } // End of the function
    function update(Void)
    {
        if (__update)
        {
            var _loc2 = __tf.bottomScroll - __tf.scroll + 1;
            var _loc3 = __tf.maxscroll + _loc2;
            __scrollBar.__set__maximum(__tf.maxscroll);
            __scrollBar.__set__thumbScale(_loc2 / _loc3);
            __scrollBar.__set__value(__tf.scroll);
        } // end if
        __update = true;
    } // End of the function
    function set condenseWhite(b)
    {
        __condenseWhite = b;
        this.invalidate();
        //return (this.condenseWhite());
        null;
    } // End of the function
    function get condenseWhite()
    {
        return (__condenseWhite);
    } // End of the function
    function set editable(b)
    {
        __editable = b;
        this.invalidate();
        //return (this.editable());
        null;
    } // End of the function
    function get editable()
    {
        return (__editable);
    } // End of the function
    function set maxChars(max)
    {
        __maxChars = max;
        if (__maxChars == 0)
        {
            __maxChars = null;
        } // end if
        this.invalidate();
        //return (this.maxChars());
        null;
    } // End of the function
    function get maxChars()
    {
        return (__maxChars);
    } // End of the function
    function get maxscroll()
    {
        this.draw();
        return (__tf.maxscroll);
    } // End of the function
    function set password(b)
    {
        __password = b;
        this.invalidate();
        //return (this.password());
        null;
    } // End of the function
    function get password()
    {
        return (__password);
    } // End of the function
    function set restrict(txt)
    {
        __restrict = txt;
        if (__restrict == "")
        {
            __restrict = "^";
        } // end if
        this.invalidate();
        //return (this.restrict());
        null;
    } // End of the function
    function get restrict()
    {
        return (__restrict);
    } // End of the function
    function set scroll(s)
    {
        __tf.scroll = s;
        this.invalidate();
        //return (this.scroll());
        null;
    } // End of the function
    function get scroll()
    {
        return (__tf.scroll);
    } // End of the function
    function set scrollBarWidth(w)
    {
        __scrollBarWidth = w;
        this.invalidate();
        //return (this.scrollBarWidth());
        null;
    } // End of the function
    function get scrollBarWidth()
    {
        return (__scrollBarWidth);
    } // End of the function
    function set selectable(b)
    {
        __selectable = b;
        this.invalidate();
        //return (this.selectable());
        null;
    } // End of the function
    function get selectable()
    {
        return (__selectable);
    } // End of the function
    function set text(txt)
    {
        __text = txt;
        this.invalidate();
        //return (this.text());
        null;
    } // End of the function
    function get text()
    {
        return (__text);
    } // End of the function
    function get textHeight()
    {
        return (__tf.textHeight);
    } // End of the function
    function get textField()
    {
        return (__tf);
    } // End of the function
    function set tabIndex(index)
    {
        __tf.tabIndex = index;
        //return (this.tabIndex());
        null;
    } // End of the function
    function get tabIndex()
    {
        return (__tf.tabIndex);
    } // End of the function
    var clipParams = {editable: 1, maxChars: 1, password: 1, restrict: 1, scrollBarWidth: 1, selectable: 1, text: 1};
    static var mergedClipParams = com.bjc.core.BJCComponent.mergeClipParams(com.bjc.controls.TextArea.prototype.clipParams, com.bjc.core.LabelWrapper.prototype.clipParams);
    var __condenseWhite = false;
    var __editable = true;
    var __maxChars = null;
    var __password = false;
    var __restrict = "^";
    var __scrollBarWidth = 16;
    var __selectable = true;
    var __text = "";
    var __update = true;
    var __updateCount = 0;
} // End of Class
