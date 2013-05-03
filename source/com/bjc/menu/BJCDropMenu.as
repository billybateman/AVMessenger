class com.bjc.menu.BJCDropMenu extends mx.core.UIComponent
{
    var __width, w, __height, h, _xscale, _yscale, createEmptyMovieClip, itemTF, alignment, fontColor, fnt, itemStack, itemHeight, compIcon, menuHolder, source, _parent, sourceStr, compItems, invalidate, __get__Source, callBackFunction, __get__CallBackFunction, menuType, __get__Mode, itemPadding, __get__ItemPadding, effectType, __get__EType, effectSpeed, __get__Speed, effectStrength, __get__Strength, elasticity, __get__Elasticity, __get__Font, __get__Align, __get__FontColor, roFontColor, __get__ROFontColor, iColor, __get__IColor, brdColor, __get__BrdColor, bgColor, __get__BGColor, mainWidth, itemCount, _item, bgCol, __item, bg, linkString, tf, topItem, zPos, __set__Align, __set__BGColor, __set__BrdColor, __set__CallBackFunction, __set__EType, __set__Elasticity, __set__Font, __set__FontColor, __set__IColor, __set__ItemPadding, __set__Mode, __set__ROFontColor, __set__Source, __set__Speed, __set__Strength;
    function BJCDropMenu()
    {
        super();
        w = __width;
        h = __height;
        _xscale = 100;
        _yscale = 100;
        this.createEmptyMovieClip("menuHolder", 0);
        itemTF = new TextFormat();
        itemTF.size = 12;
        itemTF.align = alignment;
        itemTF.color = fontColor;
        itemTF.font = fnt;
        itemStack = new Array();
        itemHeight = 22;
        compIcon._visible = false;
        menuHolder._visible = true;
        source = new com.bjc.menu.XML2();
        source._parent = this;
        source.ignoreWhite = true;
        source.onLoad = function (success)
        {
            if (success)
            {
                _parent.createMenu();
            } // end if
        };
        if (sourceStr != "")
        {
            source.load(sourceStr);
        } // end if
    } // End of the function
    function init()
    {
        super.init();
    } // End of the function
    function size(Void)
    {
        this.doLayout();
        super.size();
    } // End of the function
    function draw(Void)
    {
        this.size();
    } // End of the function
    function redraw(Void)
    {
        this.doLayout();
    } // End of the function
    function resize(Void)
    {
        this.doLayout();
    } // End of the function
    function doLayout()
    {
        w = __width;
        h = __height;
        compIcon._x = int(w / 2 - compIcon._width / 2);
        compIcon._y = int(h / 2 - compIcon._height / 2);
        compItems._visible = false;
    } // End of the function
    function set Source(src)
    {
        sourceStr = src;
        compIcon._visible = true;
        menuHolder._visible = false;
        this.invalidate();
        //return (this.Source());
        null;
    } // End of the function
    function set CallBackFunction(cbf)
    {
        callBackFunction = cbf;
        this.invalidate();
        //return (this.CallBackFunction());
        null;
    } // End of the function
    function set Mode(mode)
    {
        menuType = mode;
        this.invalidate();
        //return (this.Mode());
        null;
    } // End of the function
    function set ItemPadding(ipc)
    {
        itemPadding = ipc;
        if (itemPadding < 0)
        {
            itemPadding = 0;
        } // end if
        this.invalidate();
        //return (this.ItemPadding());
        null;
    } // End of the function
    function set EType(et)
    {
        effectType = et;
        this.invalidate();
        //return (this.EType());
        null;
    } // End of the function
    function set Speed(es)
    {
        effectSpeed = 100 - es;
        if (effectSpeed < 1)
        {
            effectSpeed = 1;
        }
        else if (effectSpeed > 100)
        {
            effectSpeed = 100;
        } // end else if
        this.invalidate();
        //return (this.Speed());
        null;
    } // End of the function
    function set Strength(es)
    {
        effectStrength = es;
        if (effectStrength < 0.100000)
        {
            effectStrength = 0.100000;
        }
        else if (effectStrength > 100)
        {
            effectStrength = 100;
        } // end else if
        this.invalidate();
        //return (this.Strength());
        null;
    } // End of the function
    function set Elasticity(el)
    {
        elasticity = el;
        if (elasticity < 0.100000)
        {
            elasticity = 0.100000;
        }
        else if (elasticity > 100)
        {
            elasticity = 100;
        } // end else if
        this.invalidate();
        //return (this.Elasticity());
        null;
    } // End of the function
    function set Font(fnt)
    {
        this.fnt = fnt;
        this.invalidate();
        //return (this.Font());
        null;
    } // End of the function
    function set Align(alng)
    {
        alignment = alng;
        this.invalidate();
        //return (this.Align());
        null;
    } // End of the function
    function set FontColor(color)
    {
        fontColor = color;
        this.invalidate();
        //return (this.FontColor());
        null;
    } // End of the function
    function set ROFontColor(color)
    {
        roFontColor = color;
        this.invalidate();
        //return (this.ROFontColor());
        null;
    } // End of the function
    function set IColor(color)
    {
        iColor = color;
        this.invalidate();
        //return (this.IColor());
        null;
    } // End of the function
    function set BrdColor(color)
    {
        brdColor = color;
        this.invalidate();
        //return (this.BrdColor());
        null;
    } // End of the function
    function set BGColor(color)
    {
        bgColor = color;
        this.invalidate();
        //return (this.BGColor());
        null;
    } // End of the function
    function doButtonAction(type, var1, var2)
    {
        if (type == "frame")
        {
            _parent.gotoAndStop(var1);
        }
        else if (type == "url")
        {
            _parent.getURL(var1, var2);
        } // end else if
    } // End of the function
    function setCallback(cb)
    {
        callBackFunction = cb;
    } // End of the function
    function setSource(src)
    {
        source = src;
        this.createMenu();
    } // End of the function
    function createMenu()
    {
        this.source = this.source.firstChild;
        this.createEmptyMovieClip("menuHolder", 0);
        this.menuHolder.createEmptyMovieClip("bg", -10);
        this.mainWidth = 0;
        this.itemCount = 0;
        var i = 0;
        while (i < this.source.childNodes.length)
        {
            ++this.itemCount;
            this.menuHolder.createEmptyMovieClip("item" + i, i);
            this._item = eval("this.menuHolder.item" + i);
            this.itemStack.push(this._item);
            this._item.itemObj = new Object();
            this._item.itemObj.index = new Array();
            this._item.itemObj.index.push(i);
            this._item.itemObj.title = this.source.childNodes[i].attributes.title;
            this._item.itemObj.enabled = this.source.childNodes[i].attributes.enabled;
            this._item.itemObj.link = this.source.childNodes[i].attributes.link;
            this._item.itemObj.target = this.source.childNodes[i].attributes.target;
            this._item.itemObj.icon = this.source.childNodes[i].attributes.icon;
            this._item.attachMovie("BJCDropButton", "btn", 1);
            this._item.btn.createTextField("tf", 100, 0, 1, 100, 18);
            this._item.btn.tf.text = this._item.itemObj.title;
            this._item.btn.tf.embedFonts = true;
            this._item.btn.tf.autoSize = this.alignment;
            this._item.btn.tf.selectable = false;
            this._item.btn.tf.setTextFormat(this.itemTF);
            if (this._item.itemObj.icon != "")
            {
                this._item.btn.ico.attachMovie(this._item.itemObj.icon, "icon", 0);
                this._item.btn.ico._width = 16;
                this._item.btn.ico._height = 16;
                this._item.w = this._item.btn.tf._width + 22;
            }
            else
            {
                this._item.w = this._item.btn.tf._width + 6;
            } // end else if
            this._item.btn.bg.attachMovie("BJC_b_left", "left", 0);
            this._item.btn.bg.attachMovie("BJC_b_bg", "bg", 1);
            this._item.btn.bg.attachMovie("BJC_b_right", "right", 2);
            if (this._item.itemObj.enabled == "true")
            {
                this._item.btn.bg.left.disabler._visible = false;
                this._item.btn.bg.bg.disabler._visible = false;
                this._item.btn.bg.right.disabler._visible = false;
            }
            else
            {
                this._item.btn.tf._alpha = 50;
                this._item.btn.bg._alpha = 0;
                this._item.btn.ico._alpha = 50;
                this._item.btn.useHandCursor = false;
            } // end else if
            this._item.btn.bg.left.face._visible = false;
            this._item.btn.bg.bg.face._visible = false;
            this._item.btn.bg.right.face._visible = false;
            this._item.btn.bg.left.bg._visible = false;
            this._item.btn.bg.bg.bg._visible = false;
            this._item.btn.bg.right.bg._visible = false;
            this._item.btn.bg._visible = false;
            this.bgCol = new Color(this._item.btn.bg.left.face);
            this.bgCol.setRGB(this.iColor);
            this.bgCol = new Color(this._item.btn.bg.bg.face);
            this.bgCol.setRGB(this.iColor);
            this.bgCol = new Color(this._item.btn.bg.right.face);
            this.bgCol.setRGB(this.iColor);
            this.bgCol = new Color(this._item.btn.bg.left.brd);
            this.bgCol.setRGB(this.iColor);
            this.bgCol = new Color(this._item.btn.bg.bg.brd);
            this.bgCol.setRGB(this.iColor);
            this.bgCol = new Color(this._item.btn.bg.right.brd);
            this.bgCol.setRGB(this.iColor);
            this.bgCol = new Color(this._item.btn.bg.left.bg);
            this.bgCol.setRGB(this.bgColor);
            this.bgCol = new Color(this._item.btn.bg.bg.bg);
            this.bgCol.setRGB(this.bgColor);
            this.bgCol = new Color(this._item.btn.bg.right.bg);
            this.bgCol.setRGB(this.bgColor);
            if (this.menuType == "Vertical right" || this.menuType == "Vertical left")
            {
                if (this._item.btn.tf.textWidth > this.mainWidth)
                {
                    this.mainWidth = this._item.btn.tf.textWidth;
                } // end if
                this._item.w = this.w;
                this._item._y = (this.itemHeight + this.itemPadding) * i + this.itemPadding;
                this.menuHolder.bg.attachMovie("BJC_bg_b", "t", 0);
                this.menuHolder.bg.attachMovie("BJC_bg_b", "l", 1);
                this.menuHolder.bg.attachMovie("BJC_bg_b", "r", 2);
                this.menuHolder.bg.attachMovie("BJC_bg_b", "b", 3);
                this.menuHolder.bg.attachMovie("BJC_bg_tl", "tl", 4);
                this.menuHolder.bg.attachMovie("BJC_bg_tr", "tr", 5);
                this.menuHolder.bg.attachMovie("BJC_bg_bl", "bl", 6);
                this.menuHolder.bg.attachMovie("BJC_bg_br", "br", 7);
                this.menuHolder.bg.attachMovie("BJCDropBox", "bg", 8);
                this.menuHolder.bg.attachMovie("BJCDropGrad1", "grad", 9);
                this._item.attachMovie("BJC_bg_b", "eb", 10);
                this._item.eb._visible = false;
            }
            else
            {
                this._item._x = this.mainWidth + this.itemPadding;
                this.mainWidth = this.mainWidth + (this._item.w + this.itemPadding);
                this.menuHolder.bg.attachMovie("BJC_b_left", "left", 0);
                this.menuHolder.bg.attachMovie("BJC_b_bg", "bg", 1);
                this.menuHolder.bg.attachMovie("BJC_b_right", "right", 2);
                this.menuHolder.bg.left.disabler._visible = false;
                this.menuHolder.bg.bg.disabler._visible = false;
                this.menuHolder.bg.right.disabler._visible = false;
                this.menuHolder.bg.left.face._visible = false;
                this.menuHolder.bg.bg.face._visible = false;
                this.menuHolder.bg.right.face._visible = false;
            } // end else if
            this._item.attachMovie("BJCDropBox", "itemMask", -10);
            this._item.attachMovie("BJCDropBox", "subMask", 0);
            this._item.createEmptyMovieClip("sub", -1);
            this._item.sub.createEmptyMovieClip("bg", -100);
            this._item.sub.bg.attachMovie("BJC_bg_b", "t", 0);
            this._item.sub.bg.attachMovie("BJC_bg_b", "l", 1);
            this._item.sub.bg.attachMovie("BJC_bg_b", "r", 2);
            this._item.sub.bg.attachMovie("BJC_bg_b", "b", 3);
            this._item.sub.bg.attachMovie("BJC_bg_tl", "tl", 4);
            this._item.sub.bg.attachMovie("BJC_bg_tr", "tr", 5);
            this._item.sub.bg.attachMovie("BJC_bg_bl", "bl", 6);
            this._item.sub.bg.attachMovie("BJC_bg_br", "br", 7);
            this._item.sub.bg.attachMovie("BJCDropBox", "bg", 8);
            this._item.sub.bg.attachMovie("BJCDropGrad1", "grad", 9);
            this._item.sub._visible = false;
            this._item.subWidth = 0;
            this._item.subHeight = 0;
            this._item.subCount = 0;
            var j = 0;
            while (j < this.source.childNodes[i].childNodes.length)
            {
                ++this._item.subCount;
                this._item.sub.createEmptyMovieClip("item" + j, -j);
                this.__item = eval(this._item.sub + ".item" + j);
                this.__item.itemObj = new Object();
                this.__item.itemObj.index = new Array();
                this.__item.itemObj.index.push(i);
                this.__item.itemObj.index.push(j);
                this.__item.itemObj.title = this.source.childNodes[i].childNodes[j].attributes.title;
                this.__item.itemObj.enabled = this.source.childNodes[i].childNodes[j].attributes.enabled;
                this.__item.itemObj.link = this.source.childNodes[i].childNodes[j].attributes.link;
                this.__item.itemObj.target = this.source.childNodes[i].childNodes[j].attributes.target;
                this.__item.itemObj.icon = this.source.childNodes[i].childNodes[j].attributes.icon;
                this.__item.attachMovie("BJCDropButton", "btn", 1);
                this.__item.btn.createTextField("tf", 100, 0, 1, 100, 18);
                this.__item.btn.tf.text = this.__item.itemObj.title;
                this.__item.btn.tf.embedFonts = true;
                this.__item.btn.tf.autoSize = this.alignment;
                this.__item.btn.tf.selectable = false;
                this.__item.btn.tf.setTextFormat(this.itemTF);
                if (this.__item.itemObj.icon != "")
                {
                    this.__item.btn.ico.attachMovie(this.__item.itemObj.icon, "icon", 0);
                    this.__item.btn.ico._width = 16;
                    this.__item.btn.ico._height = 16;
                } // end if
                this.__item.btn.bg.attachMovie("BJC_b_left", "left", 0);
                this.__item.btn.bg.attachMovie("BJC_b_bg", "bg", 1);
                this.__item.btn.bg.attachMovie("BJC_b_right", "right", 2);
                if (this.__item.itemObj.enabled == "true")
                {
                    this.__item.btn.bg.left.disabler._visible = false;
                    this.__item.btn.bg.bg.disabler._visible = false;
                    this.__item.btn.bg.right.disabler._visible = false;
                }
                else
                {
                    this.__item.btn.tf._alpha = 50;
                    this.__item.btn.bg._alpha = 0;
                    this.__item.btn.ico._alpha = 50;
                    this.__item.btn.useHandCursor = false;
                } // end else if
                this.__item.btn.bg.left.face._visible = false;
                this.__item.btn.bg.bg.face._visible = false;
                this.__item.btn.bg.right.face._visible = false;
                this.__item.btn.bg._visible = false;
                this.bgCol = new Color(this.__item.btn.bg.left.face);
                this.bgCol.setRGB(this.iColor);
                this.bgCol = new Color(this.__item.btn.bg.bg.face);
                this.bgCol.setRGB(this.iColor);
                this.bgCol = new Color(this.__item.btn.bg.right.face);
                this.bgCol.setRGB(this.iColor);
                this.bgCol = new Color(this.__item.btn.bg.left.brd);
                this.bgCol.setRGB(this.iColor);
                this.bgCol = new Color(this.__item.btn.bg.bg.brd);
                this.bgCol.setRGB(this.iColor);
                this.bgCol = new Color(this.__item.btn.bg.right.brd);
                this.bgCol.setRGB(this.iColor);
                this.bgCol = new Color(this.__item.btn.bg.left.bg);
                this.bgCol.setRGB(this.bgColor);
                this.bgCol = new Color(this.__item.btn.bg.bg.bg);
                this.bgCol.setRGB(this.bgColor);
                this.bgCol = new Color(this.__item.btn.bg.right.bg);
                this.bgCol.setRGB(this.bgColor);
                if (this.__item.btn.tf.textWidth > this._item.subWidth + 22)
                {
                    this._item.subWidth = this.__item.btn.tf.textWidth + 22;
                } // end if
                if (this.__item.itemObj.icon != "" && this._item.subWidth < this.__item.btn.tf.textWidth + 30)
                {
                    this._item.subWidth = this.__item.btn.tf.textWidth + 30;
                } // end if
                if (this.menuType != "Vertical right" && this.menuType != "Vertical left")
                {
                    if (this._item.subWidth < this._item.w)
                    {
                        this._item.subWidth = this._item.w;
                    } // end if
                } // end if
                this.__item.btn._y = (this.itemHeight + this.itemPadding) * j;
                this._item.subHeight = this._item.subHeight + (this.itemHeight + this.itemPadding);
                this.__item.btn.onPress = function ()
                {
                    if (_parent.itemObj.enabled == "true")
                    {
                        bg._visible = true;
                        bg.left.face._visible = true;
                        bg.bg.face._visible = true;
                        bg.right.face._visible = true;
                    } // end if
                };
                this.__item.btn.onRelease = function ()
                {
                    this.bg._visible = true;
                    this.bg.left.face._visible = false;
                    this.bg.bg.face._visible = false;
                    this.bg.right.face._visible = false;
                    if (this._parent.itemObj.enabled == "true")
                    {
                        var i = 0;
                        while (i < this._parent._parent._parent._parent._parent.itemCount)
                        {
                            if (this._parent._parent._parent._parent["item" + i].open == true)
                            {
                                this._parent._parent._parent._parent._parent.closeItem(this._parent._parent._parent._parent["item" + i]);
                            } // end if
                            ++i;
                        } // end while
                        this.linkString = this._parent.itemObj.link.split("$");
                        if (this.linkString.length > 1)
                        {
                            this._parent._parent._parent._parent._parent.doButtonAction("frame", this.linkString[1]);
                        } // end if
                        this.linkString = this._parent.itemObj.link.split("http://");
                        if (this.linkString.length > 1)
                        {
                            this._parent._parent._parent._parent._parent.doButtonAction("url", this._parent.itemObj.link, this._parent.itemObj.target);
                        } // end if
                        eval(this._parent._parent._parent._parent._parent.callBackFunction).call(this._parent._parent._parent._parent._parent._parent, this._parent.itemObj.index[0], this._parent.itemObj.index[1]);
                    } // end if
                };
                this.__item.btn.onRollOver = function ()
                {
                    if (_parent.itemObj.enabled == "true")
                    {
                        tf.textColor = _parent._parent._parent._parent._parent.roFontColor;
                        bg._visible = true;
                        bg.left.face._visible = false;
                        bg.bg.face._visible = false;
                        bg.right.face._visible = false;
                    } // end if
                };
                this.__item.btn.onRollOut = function ()
                {
                    tf.textColor = _parent._parent._parent._parent._parent.fontColor;
                    bg._visible = false;
                    if (_parent._parent._parent.moving != true)
                    {
                        if (_parent._parent._parent._parent._parent.menuType == "Vertical right" || _parent._parent._parent._parent._parent.menuType == "Vertical left")
                        {
                            if (!_parent._parent.hitTest(_root._xmouse, _root._ymouse) || _parent._parent._parent._ymouse >= _parent._parent._parent.subHeight - _parent._parent._parent._parent._parent.itemHeight / 4 || _parent._parent._parent._ymouse <= _parent._parent._parent._parent._parent.itemHeight / 4)
                            {
                                _parent._parent._parent._parent._parent.closeItem(_parent._parent._parent._parent["item" + _parent.itemObj.index[0]]);
                            } // end if
                        }
                        else if (_parent._parent._parent._parent._parent.menuType == "Horizontal down")
                        {
                            if (!_parent._parent.hitTest(_root._xmouse, _root._ymouse) || _parent._parent._parent._ymouse >= _parent._parent._parent._parent._parent.itemHeight / 2 + _parent._parent._parent.subHeight)
                            {
                                _parent._parent._parent._parent._parent.closeItem(_parent._parent._parent._parent["item" + _parent.itemObj.index[0]]);
                            } // end if
                        }
                        else if (_parent._parent._parent._parent._parent.menuType == "Horizontal up")
                        {
                            if (!_parent._parent.hitTest(_root._xmouse, _root._ymouse) || _parent._parent._parent._ymouse <= -_parent._parent._parent.subHeight + _parent._parent._parent._parent._parent.itemHeight / 2)
                            {
                                _parent._parent._parent._parent._parent.closeItem(_parent._parent._parent._parent["item" + _parent.itemObj.index[0]]);
                            } // end if
                        } // end else if
                    } // end else if
                };
                this.__item.btn.onDragOut = this.__item.btn.onRollOut;
                ++j;
            } // end while
            this._item.btn.onPress = function ()
            {
                if (_parent.itemObj.enabled == "true")
                {
                    bg._visible = true;
                    bg.left.face._visible = true;
                    bg.bg.face._visible = true;
                    bg.right.face._visible = true;
                    bg.left.bg._visible = true;
                    bg.bg.bg._visible = true;
                    bg.right.bg._visible = true;
                } // end if
            };
            this._item.btn.onRelease = function ()
            {
                if (this._parent.itemObj.enabled == "true")
                {
                    this.bg._visible = true;
                    this.bg.left.face._visible = false;
                    this.bg.bg.face._visible = false;
                    this.bg.right.face._visible = false;
                    this.bg.left.bg._visible = true;
                    this.bg.bg.bg._visible = true;
                    this.bg.right.bg._visible = true;
                    var i = 0;
                    while (i < this._parent._parent._parent.itemCount)
                    {
                        if (this._parent._parent["item" + i].open == true && this._parent._parent["item" + i] != this._parent)
                        {
                            this._parent._parent._parent.closeItem(this._parent._parent["item" + i]);
                        } // end if
                        ++i;
                    } // end while
                    this.linkString = this._parent.itemObj.link.split("$");
                    if (this.linkString.length > 1)
                    {
                        this._parent._parent._parent.doButtonAction("frame", this.linkString[1]);
                    } // end if
                    this.linkString = this._parent.itemObj.link.split("http://");
                    if (this.linkString.length > 1)
                    {
                        this._parent._parent._parent.doButtonAction("url", this._parent.itemObj.link, this._parent.itemObj.target);
                    } // end if
                    eval(this._parent._parent._parent.callBackFunction).call(this._parent._parent._parent._parent, this._parent.itemObj.index[0]);
                } // end if
            };
            this._item.btn.onRollOver = function ()
            {
                if (_parent.itemObj.enabled == "true")
                {
                    tf.textColor = _parent._parent._parent.roFontColor;
                    bg._visible = true;
                    bg.left.face._visible = false;
                    bg.bg.face._visible = false;
                    bg.right.face._visible = false;
                    bg.left.bg._visible = true;
                    bg.bg.bg._visible = true;
                    bg.right.bg._visible = true;
                    if (_parent.open != true)
                    {
                        _parent._parent._parent.openItem(_parent._parent["item" + _parent.itemObj.index[0]]);
                    } // end if
                } // end if
                for (var _loc2 = 0; _loc2 < _parent._parent._parent.itemCount; ++_loc2)
                {
                    if (_parent._parent["item" + _loc2].open == true && _parent._parent["item" + _loc2] != _parent)
                    {
                        _parent._parent._parent.closeItem(_parent._parent["item" + _loc2]);
                    } // end if
                } // end of for
            };
            this._item.btn.onRollOut = function ()
            {
                tf.textColor = _parent._parent._parent.fontColor;
                bg._visible = false;
                bg.left.face._visible = false;
                bg.bg.face._visible = false;
                bg.right.face._visible = false;
                bg.left.bg._visible = false;
                bg.bg.bg._visible = false;
                bg.right.bg._visible = false;
                if (_parent._parent._parent.menuType == "Vertical right" || _parent._parent._parent.menuType == "Vertical left")
                {
                    if (!_parent.hitTest(_root._xmouse, _root._ymouse) || _parent._parent._parent._ymouse >= _parent._parent._parent.h)
                    {
                        _parent._parent._parent.closeItem(_parent._parent["item" + _parent.itemObj.index[0]]);
                    }
                    else if (_parent._ymouse >= _parent._parent._parent.itemHeight - 4 && _parent._parent._parent.itemCount == _parent.itemObj.index[0] + 1)
                    {
                        _parent._parent._parent.closeItem(_parent._parent["item" + _parent.itemObj.index[0]]);
                    } // end else if
                }
                else if (!_parent.hitTest(_root._xmouse, _root._ymouse) || _parent._parent._xmouse >= _parent._parent._parent.mainWidth - _parent._parent._parent.itemHeight / 2 || _parent._parent._xmouse >= _parent._parent._parent.w)
                {
                    _parent._parent._parent.closeItem(_parent._parent["item" + _parent.itemObj.index[0]]);
                } // end else if
                if (_parent._parent._parent.menuType == "Horizontal down")
                {
                    if (!_parent.hitTest(_root._xmouse, _root._ymouse) && !_parent.sub.hitTest(_root._xmouse, _root._ymouse) || _parent._parent._ymouse <= 0)
                    {
                        _parent._parent._parent.closeItem(_parent._parent["item" + _parent.itemObj.index[0]]);
                    } // end if
                }
                else if (_parent._parent._parent.menuType == "Horizontal up")
                {
                    if (!_parent.hitTest(_root._xmouse, _root._ymouse) && !_parent.sub.hitTest(_root._xmouse, _root._ymouse) || _parent._parent._ymouse >= _parent._parent._parent.itemHeight)
                    {
                        _parent._parent._parent.closeItem(_parent._parent["item" + _parent.itemObj.index[0]]);
                    } // end if
                } // end else if
            };
            this._item.btn.onDragOut = this._item.btn.onRollOut;
            ++i;
        } // end while
        if (this.menuType == "Vertical right" || this.menuType == "Vertical left")
        {
            this.menuHolder.bg.t._x = 4;
            this.menuHolder.bg.t._width = this.w - 8;
            this.menuHolder.bg.tr._x = this.w - 5;
            this.menuHolder.bg.l._height = this.h - 8;
            this.menuHolder.bg.l._y = 4;
            this.menuHolder.bg.r._height = this.h - 8;
            this.menuHolder.bg.r._x = this.w - 1;
            this.menuHolder.bg.r._y = 4;
            this.menuHolder.bg.bl._y = this.h - 10;
            this.menuHolder.bg.b._x = 4;
            this.menuHolder.bg.b._y = this.h - 1;
            this.menuHolder.bg.b._width = this.w - 8;
            this.menuHolder.bg.br._y = this.h - 10;
            this.menuHolder.bg.br._x = this.w - 5;
            this.menuHolder.bg.bg._x = 1;
            this.menuHolder.bg.bg._y = 1;
            this.menuHolder.bg.bg._width = this.w - 2;
            this.menuHolder.bg.bg._height = this.h - 2;
            this.menuHolder.bg.grad._x = 2;
            this.menuHolder.bg.grad._y = 3;
            this.menuHolder.bg.grad._width = this.w - 4;
            this.menuHolder.bg.grad._height = this.h - 5;
            this.bgCol = new Color(this.menuHolder.bg.t);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this.menuHolder.bg.l);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this.menuHolder.bg.r);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this.menuHolder.bg.b);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this.menuHolder.bg.tl);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this.menuHolder.bg.tr);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this.menuHolder.bg.bl);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this.menuHolder.bg.br);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this.menuHolder.bg.bg);
            this.bgCol.setRGB(this.bgColor);
        }
        else
        {
            this.menuHolder.bg.bg._x = 4;
            this.menuHolder.bg.bg._width = this.w - 8;
            this.menuHolder.bg.right._x = this.w - 5;
            this.bgCol = new Color(this.menuHolder.bg.left.brd);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this.menuHolder.bg.left.bg);
            this.bgCol.setRGB(this.bgColor);
            this.bgCol = new Color(this.menuHolder.bg.bg.brd);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this.menuHolder.bg.bg.bg);
            this.bgCol.setRGB(this.bgColor);
            this.bgCol = new Color(this.menuHolder.bg.right.brd);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this.menuHolder.bg.right.bg);
            this.bgCol.setRGB(this.bgColor);
        } // end else if
        var i = 0;
        while (i < this.itemCount)
        {
            this._item = eval("this.menuHolder.item" + i);
            this._item.sub.bg._y = -this.itemPadding;
            this._item.sub.bg.t._x = 4;
            this._item.sub.bg.t._width = this._item.subWidth - 8;
            this._item.sub.bg.tr._x = this._item.subWidth - 5;
            this._item.sub.bg.l._height = this._item.subHeight + this.itemPadding - 8;
            this._item.sub.bg.l._y = 4;
            this._item.sub.bg.r._height = this._item.subHeight + this.itemPadding - 8;
            this._item.sub.bg.r._x = this._item.subWidth - 1;
            this._item.sub.bg.r._y = 4;
            this._item.sub.bg.bl._y = this._item.subHeight + this.itemPadding - 10;
            this._item.sub.bg.b._x = 4;
            this._item.sub.bg.b._y = this._item.subHeight + this.itemPadding - 1;
            this._item.sub.bg.b._width = this._item.subWidth - 8;
            this._item.sub.bg.br._y = this._item.subHeight + this.itemPadding - 10;
            this._item.sub.bg.br._x = this._item.subWidth - 5;
            this._item.sub.bg.bg._x = 1;
            this._item.sub.bg.bg._y = 1;
            this._item.sub.bg.bg._width = this._item.subWidth - 2;
            this._item.sub.bg.bg._height = this._item.subHeight + this.itemPadding - 2;
            this._item.sub.bg.grad._x = 2;
            this._item.sub.bg.grad._y = 3;
            this._item.sub.bg.grad._width = this._item.subWidth - 4;
            this._item.sub.bg.grad._height = this._item.subHeight + this.itemPadding - 5;
            this.bgCol = new Color(this._item.sub.bg.t);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this._item.sub.bg.l);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this._item.sub.bg.r);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this._item.sub.bg.b);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this._item.sub.bg.tl);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this._item.sub.bg.tr);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this._item.sub.bg.bl);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this._item.sub.bg.br);
            this.bgCol.setRGB(this.brdColor);
            this.bgCol = new Color(this._item.sub.bg.bg);
            this.bgCol.setRGB(this.bgColor);
            if (this.menuType == "Vertical right" || this.menuType == "Vertical right")
            {
                if (this._item.itemObj.icon == "")
                {
                    if (this._item.btn.tf._width > this.w - 7)
                    {
                        this._item.btn.tf.autoSize = "none";
                        this._item.btn.tf._width = this.w - 7;
                    } // end if
                }
                else if (this._item.btn.tf._width > this.w - 24)
                {
                    this._item.btn.tf.autoSize = "none";
                    this._item.btn.tf._width = this.w - 24;
                } // end if
            } // end else if
            this._item.btn.trns._width = this._item.w + this.itemPadding * 2;
            this._item.btn.trns._height = this.itemHeight + this.itemPadding * 2;
            this._item.btn.trns._x = -this.itemPadding;
            this._item.btn.trns._y = -this.itemPadding;
            this._item.btn.bg.bg._x = 4;
            this._item.btn.bg.bg._width = this._item.w - 8;
            this._item.btn.bg.right._x = this._item.w - 5;
            this._item.itemMask._width = this.w;
            this._item.itemMask._height = this.h;
            this._item.itemMask._x = -this._item._x;
            this._item.itemMask._y = -this._item._y;
            this._item.btn.setMask(this._item.itemMask);
            this._item.subMask._width = this._item.subWidth;
            this._item.subMask._height = this._item.subHeight + 100;
            this._item.sub.setMask(this._item.subMask);
            if (this.menuType == "Vertical right")
            {
                this._item.sub._x = this.w - 1;
                this._item.subMask._x = this.w - 1;
                this._item.subMask._y = -this.itemPadding;
                this._item.eb._x = this.w;
                this._item.eb._width = this._item.subWidth - 1;
                this._item.eb._y = -this.itemPadding;
                if (this.effectType == "easing" || this.effectType == "elastic" || this.effectType == "bounce")
                {
                    this._item.sub._y = -this._item.subHeight - this.itemPadding;
                }
                else if (this.effectType == "fade")
                {
                    this._item.sub._alpha = 0;
                } // end else if
            }
            else if (this.menuType == "Vertical left")
            {
                this._item.sub._x = -this._item.subWidth + 1;
                this._item.subMask._x = -this._item.subWidth + 1;
                this._item.subMask._y = -this.itemPadding;
                this._item.eb._x = -this._item.subWidth + 1;
                this._item.eb._width = this._item.subWidth - 1;
                this._item.eb._y = -this.itemPadding;
                if (this.effectType == "easing" || this.effectType == "elastic" || this.effectType == "bounce")
                {
                    this._item.sub._y = -this._item.subHeight - this.itemPadding;
                }
                else if (this.effectType == "fade")
                {
                    this._item.sub._alpha = 0;
                } // end else if
            }
            else if (this.menuType == "Horizontal down")
            {
                this._item.btn.tf.autoSize = "none";
                this._item.btn.tf._height = this.itemHeight - 4;
                this._item.subMask._y = this.itemHeight - 1;
                if (this.effectType == "easing" || this.effectType == "elastic" || this.effectType == "bounce")
                {
                    this._item.sub._y = this.itemHeight - this._item.subHeight - 1;
                }
                else if (this.effectType == "fade")
                {
                    this._item.sub._y = this.itemHeight + this.itemPadding - 1;
                    this._item.sub._alpha = 0;
                } // end else if
            }
            else if (this.menuType == "Horizontal up")
            {
                this._item.btn.tf.autoSize = "none";
                this._item.btn.tf._height = this.itemHeight - 4;
                this._item.subMask._y = -this._item.subHeight - 99;
                if (this.effectType == "easing" || this.effectType == "elastic" || this.effectType == "bounce")
                {
                    this._item.sub._y = this._item.subHeight + this.itemPadding + 1;
                }
                else if (this.effectType == "fade")
                {
                    this._item.sub._y = -this._item.subHeight + 1;
                    this._item.sub._alpha = 0;
                } // end else if
            } // end else if
            if (this.alignment == "center")
            {
                if (this._item.itemObj.icon == "")
                {
                    this._item.btn.tf._x = (this._item.w - this._item.btn.tf._width) / 2;
                }
                else
                {
                    this._item.btn.tf._x = (this._item.w - this._item.btn.tf._width - 20) / 2 + 18;
                } // end else if
            }
            else if (this.alignment == "right")
            {
                this._item.btn.tf._x = this._item.w - this._item.btn.tf._width - 3;
            }
            else if (this._item.itemObj.icon == "")
            {
                this._item.btn.tf._x = 3;
            }
            else
            {
                this._item.btn.tf._x = 20;
            } // end else if
            var j = 0;
            while (j < this._item.subCount)
            {
                this.__item = eval("this._item.sub.item" + j);
                if (this.alignment == "center")
                {
                    if (this.__item.itemObj.icon == "")
                    {
                        this.__item.btn.tf._x = (this._item.subWidth - this.__item.btn.tf._width) / 2;
                    }
                    else
                    {
                        this.__item.btn.tf._x = (this._item.subWidth - this.__item.btn.tf._width - 20) / 2 + 18;
                    } // end else if
                }
                else if (this.alignment == "right")
                {
                    this.__item.btn.tf._x = this._item.subWidth - this.__item.btn.tf._width - 3;
                }
                else if (this.__item.itemObj.icon == "")
                {
                    this.__item.btn.tf._x = 3;
                }
                else
                {
                    this.__item.btn.tf._x = 20;
                } // end else if
                this.__item.btn.bg.bg._x = 5;
                this.__item.btn.bg.bg._width = this._item.subWidth - 10;
                this.__item.btn.bg.right._x = this._item.subWidth - 5;
                this.__item.btn.trns._width = this._item.subWidth;
                this.__item.btn.trns._height = this.itemHeight + this.itemPadding;
                this.__item.btn.tf.autoSize = "none";
                this.__item.btn.tf._height = this.itemHeight - 4;
                ++j;
            } // end while
            if (this.effectType != "none" && this.effectType != "fade")
            {
                this._item.sub._visible = true;
            } // end if
            ++i;
        } // end while
    } // End of the function
    function clearMenu()
    {
        this.createEmptyMovieClip("menuHolder", 0);
    } // End of the function
    function swapItems(item)
    {
        topItem = menuHolder[item];
        for (var _loc2 = 0; _loc2 < itemStack.length; ++_loc2)
        {
            if (itemStack[_loc2] == topItem)
            {
                zPos = _loc2;
            } // end if
        } // end of for
        for (var _loc2 = zPos; _loc2 < itemStack.length - 1; ++_loc2)
        {
            var _loc4 = itemStack[_loc2];
            var _loc3 = itemStack[_loc2 + 1];
            itemStack[_loc2].swapDepths(itemStack[_loc2 + 1]);
            itemStack[_loc2] = _loc3;
            itemStack[_loc2 + 1] = _loc4;
        } // end of for
    } // End of the function
    function openItem(item)
    {
        this.swapItems(item._name);
        item.open = true;
        item.moving = true;
        item.sub._visible = true;
        item.sub.enabled = true;
        item.tcounter = 0;
        if (effectType == "easing" || effectType == "elastic" || effectType == "bounce")
        {
            if (menuType == "Vertical right" || menuType == "Vertical left")
            {
                item.startPosition = item.sub._y;
                item.targetPosition = -item.sub._y;
                item.eb._visible = true;
            }
            else if (menuType == "Horizontal down")
            {
                item.startPosition = item.sub._y;
                item.targetPosition = itemHeight + itemPadding - item.sub._y - 1;
            }
            else if (menuType == "Horizontal up")
            {
                item.startPosition = item.sub._y;
                item.targetPosition = -item.subHeight - item.sub._y + 1;
            } // end else if
        }
        else if (effectType == "fade")
        {
            item.startPosition = item.sub._alpha;
            item.targetPosition = 100 - item.sub._alpha;
        } // end else if
        clearInterval(item.itemIVal);
        item.itemIVal = setInterval(this, "doEffect", 30, item);
    } // End of the function
    function closeItem(item)
    {
        item.open = false;
        item.moving = true;
        item.sub.enabled = false;
        item.tcounter = 0;
        for (var _loc3 = 0; _loc3 < item.subCount; ++_loc3)
        {
            item.sub["btn" + _loc3].enabled = false;
        } // end of for
        if (effectType == "easing" || effectType == "elastic" || effectType == "bounce")
        {
            if (menuType == "Vertical right" || menuType == "Vertical left")
            {
                item.startPosition = item.sub._y;
                item.targetPosition = -item.subHeight - item.sub._y - itemPadding;
                item.eb._visible = true;
            }
            else if (menuType == "Horizontal down")
            {
                item.startPosition = item.sub._y;
                item.targetPosition = -item.subHeight + itemHeight - item.sub._y - 1;
            }
            else if (menuType == "Horizontal up")
            {
                item.startPosition = item.sub._y;
                item.targetPosition = -item.sub._y + itemPadding + 1;
            } // end else if
        }
        else if (effectType == "fade")
        {
            item.startPosition = item.sub._alpha;
            item.targetPosition = -item.sub._alpha;
        }
        else if (effectType == "none")
        {
            item.sub._visible = false;
        } // end else if
        clearInterval(item.itemIVal);
        item.itemIVal = setInterval(this, "doEffect", 30, item);
    } // End of the function
    function doEffect(item)
    {
        ++item.tcounter;
        if (effectType == "elastic" && item.eb && item.sub._y > 0)
        {
            item.eb._visible = false;
        }
        else if (effectType == "elastic" && item.eb && item.sub._y < itemPadding - item.subHeight)
        {
            item.eb._visible = false;
        }
        else if (effectType == "elastic" && item.eb)
        {
            item.eb._visible = true;
        } // end else if
        if (item.tcounter >= effectSpeed)
        {
            item.eb._visible = false;
            item.moving = false;
            clearInterval(item.itemIVal);
            if (item.sub._alpha < 5)
            {
                item.sub._visible = false;
                item.sub._alpha = 0;
            }
            else
            {
                item.sub._y = Math.round(item.sub._y);
            } // end if
        } // end else if
        switch (effectType)
        {
            case "easing":
            {
                item.sub._y = this.easeInOut(item.tcounter, item.startPosition, item.targetPosition, effectSpeed);
                break;
            } 
            case "elastic":
            {
                item.sub._y = this.elasticOut(item.tcounter, item.startPosition, item.targetPosition, effectSpeed, effectStrength, elasticity);
                break;
            } 
            case "bounce":
            {
                item.sub._y = this.bounceOut(item.tcounter, item.startPosition, item.targetPosition, effectSpeed);
                break;
            } 
            case "fade":
            {
                item.sub._alpha = this.easeInOut(item.tcounter, item.startPosition, item.targetPosition, effectSpeed);
                break;
            } 
        } // End of switch
    } // End of the function
    function easeInOut(t, b, c, d)
    {
        t = t / (d / 2);
        if (t < 1)
        {
            return (c / 2 * t * t + b);
        } // end if
        return (-c / 2 * (--t * (t - 2) - 1) + b);
    } // End of the function
    function elasticOut(t, b, c, d, a, p)
    {
        if (t == 0)
        {
            return (b);
        } // end if
        t = t / d;
        if (t == 1)
        {
            return (b + c);
        } // end if
        if (!p)
        {
            p = d * 0.300000;
        } // end if
        if (!a || a < Math.abs(c))
        {
            a = c;
            var _loc7 = p / 4;
        }
        else
        {
            _loc7 = p / 6.283185 * Math.asin(c / a);
        } // end else if
        return (a * Math.pow(2, -10 * t) * Math.sin((t * d - _loc7) * 6.283185 / p) + c + b);
    } // End of the function
    function bounceOut(t, b, c, d)
    {
        t = t / d;
        if (t < 0.363636)
        {
            return (c * (7.562500 * t * t) + b);
        }
        else if (t < 0.727273)
        {
            t = t - 0.545455;
            return (c * (7.562500 * (t) * t + 0.750000) + b);
        }
        else if (t < 0.909091)
        {
            t = t - 0.818182;
            return (c * (7.562500 * (t) * t + 0.937500) + b);
        }
        else
        {
            t = t - 0.954545;
            return (c * (7.562500 * (t) * t + 0.984375) + b);
        } // end else if
    } // End of the function
    var className = "BJCDropMenu";
    static var symbolOwner = com.bjc.menu.BJCDropMenu;
    static var symbolName = "BJCDropMenu";
    var version = "1.0.0.0";
} // End of Class
