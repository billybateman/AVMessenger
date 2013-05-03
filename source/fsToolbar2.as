class fsToolbar2 extends mx.core.UIComponent
{
    var __highlightcolor, invalidate, __get__highlightcolor, __bordercolor, __get__bordercolor, __tooltipcolor, __get__tooltipcolor, __submenubg, __get__submenu_bgcolor, __showbg, __get__show_background_border, __tooltip_delay, __get__tooltip_delay, __toolbar_items, attachMovie, __bg_border, __bg_links, __bg_mitte, __bg_rechts, createEmptyMovieClip, __tooltip, boundingBox_mc, __width, __tooltip_interval, _alpha, _parent, enableStatus, data_attr, enabled, _x, _xmouse, _xscale, __set__bordercolor, __set__highlightcolor, __set__show_background_border, __set__submenu_bgcolor, __set__tooltip_delay, __set__tooltipcolor;
    function fsToolbar2()
    {
        super();
    } // End of the function
    function set highlightcolor(smc)
    {
        __highlightcolor = smc;
        this.invalidate();
        //return (this.highlightcolor());
        null;
    } // End of the function
    function get highlightcolor()
    {
        return (__highlightcolor);
    } // End of the function
    function set bordercolor(smc)
    {
        __bordercolor = smc;
        this.invalidate();
        //return (this.bordercolor());
        null;
    } // End of the function
    function get bordercolor()
    {
        return (__bordercolor);
    } // End of the function
    function set tooltipcolor(smc)
    {
        __tooltipcolor = smc;
        this.invalidate();
        //return (this.tooltipcolor());
        null;
    } // End of the function
    function get tooltipcolor()
    {
        return (__tooltipcolor);
    } // End of the function
    function set submenu_bgcolor(smc)
    {
        __submenubg = smc;
        this.invalidate();
        //return (this.submenu_bgcolor());
        null;
    } // End of the function
    function get submenu_bgcolor()
    {
        return (__submenubg);
    } // End of the function
    function set show_background_border(sbg)
    {
        __showbg = sbg;
        this.invalidate();
        //return (this.show_background_border());
        null;
    } // End of the function
    function get show_background_border()
    {
        return (__showbg);
    } // End of the function
    function set tooltip_delay(ttd)
    {
        __tooltip_delay = ttd;
        this.invalidate();
        //return (this.tooltip_delay());
        null;
    } // End of the function
    function get tooltip_delay()
    {
        return (__tooltip_delay);
    } // End of the function
    function init()
    {
        super.init();
        __toolbar_items = new Array();
        if (__showbg)
        {
            __bg_border = this.attachMovie("MenuBoundingBox", "__bg_border", 1, {_height: 27.700000});
            var _loc6 = new Color(__bg_border.border);
            _loc6.setRGB(__bordercolor);
            __fbar_x = 2;
            __fbar_y = 2;
        } // end if
        __bg_links = this.attachMovie("menuBarBackLeft", "__bg_links", 2, {_x: __fbar_x, _y: __fbar_y});
        __bg_mitte = this.attachMovie("menuBarBackMiddle", "__bg_mitte", 3, {_x: __fbar_x + 3, _y: __fbar_y});
        __bg_rechts = this.attachMovie("menuBarBackRight", "__bg_rechts", 4, {_x: __fbar_x, _y: __fbar_y});
        __tooltip = this.createEmptyMovieClip("__tooltip", 997);
        var _loc5 = __tooltip.attachMovie("MenuBoundingBox", "box", 998, {_x: 0, _y: 0, _height: 15.700000, _width: 18});
        _loc6 = new Color(_loc5.inside);
        _loc6.setRGB(__tooltipcolor);
        var _loc7 = __tooltip.attachMovie("Label", "labelField", 999, {text: "", _width: 20, autoSize: "left", _y: -1, _x: 1});
        _loc7.setStyle("fontSize", 10);
        _loc5._alpha = 90;
        __tooltip._visible = false;
        var ttbi = this;
        __kl.onKeyDown = function ()
        {
            if (Key.getCode() == 13)
            {
                var _loc2 = _root.focusManager.getFocus();
                _loc2.fire_to.onEnterKeyPress(_loc2.text, _loc2.tool_id);
            } // end if
        };
        __ml.onMouseUp = function ()
        {
            ttbi.__submenu_interval = setInterval(ttbi.hideSubmenu, 100, true, ttbi);
            Mouse.removeListener(ttbi.__ml);
        };
        boundingBox_mc._visible = false;
        boundingBox_mc._width = boundingBox_mc._height = 0;
        this.size();
    } // End of the function
    function fsMenu()
    {
    } // End of the function
    function createChildren(Void)
    {
        super.createChildren();
    } // End of the function
    function draw(Void)
    {
        super.draw();
        var _loc4 = 10;
        var _loc6 = 1 + __fbar_y;
        for (var _loc5 = 0; _loc5 < __toolbar_items.length; ++_loc5)
        {
            var _loc3 = __toolbar_items[_loc5];
            _loc3.movie._x = _loc4;
            if (_loc3.type == "menu")
            {
                _loc3.submenu._x = _loc3.movie._x;
                _loc3.movie._y = _loc6;
                _loc3.submenu._y = _loc6 + 21;
                if (!_loc3.inited)
                {
                    _loc3.movie.pfeil._x = Math.round(_loc3.movie._width) + 4;
                    _loc3.movie.frame._width = Math.round(_loc3.movie._width) - 11;
                } // end if
                _loc4 = _loc4 + Math.round(_loc3.movie._width);
            }
            else if (_loc3.type == "textfield")
            {
                _loc3.submenu._x = _loc4;
                _loc3.movie._y = _loc6;
                _loc4 = _loc4 + Math.round(_loc3.movie._width);
            }
            else if (_loc3.type == "tool")
            {
                _loc3.movie._y = _loc6;
                if (!_loc3.inited)
                {
                    _loc3.movie.frame._width = _loc3.movie._width + 4;
                } // end if
                if (__width < _loc4 + _loc3.movie._width + 6)
                {
                    _loc3.movie._visible = false;
                }
                else
                {
                    _loc3.movie._visible = true;
                } // end else if
                _loc4 = _loc4 + Math.round(_loc3.movie._width);
            }
            else if (_loc3.type == "label")
            {
                _loc4 = _loc4 + Math.round(_loc3.movie._width);
            }
            else if (_loc3.type == "slider")
            {
                _loc4 = _loc4 + (_loc3.sliderwidth + 10);
            } // end else if
            _loc4 = _loc4 + 4;
            if (__width < _loc4 + 10)
            {
                _loc3.movie._visible = false;
            }
            else
            {
                _loc3.movie._visible = true;
            } // end else if
            _loc3.inited = true;
        } // end of for
    } // End of the function
    function setWidth(w)
    {
        var _loc3 = __bg_mitte;
        var _loc2 = __bg_rechts;
        _loc2._x = w - 3 - __fbar_x;
        _loc3._width = w - 6 - 2 * __fbar_x;
        if (__showbg)
        {
            var _loc4 = __bg_border;
            _loc4._width = w;
        } // end if
    } // End of the function
    function doLayout()
    {
        if (__width != undefined)
        {
            this.setWidth(__width);
        } // end if
    } // End of the function
    function size(Void)
    {
        super.size();
        this.doLayout();
        this.draw();
    } // End of the function
    function prepareTooltip(txt)
    {
        if (txt != undefined && txt.length > 0)
        {
            __tooltip.labelField.text = txt;
            __tooltip.labelField.draw();
            __tooltip.box._width = __tooltip.labelField._width + 2;
            __tooltip_interval = setInterval(showTooltip, __tooltip_delay, this);
        } // end if
    } // End of the function
    function showTooltip(obj)
    {
        obj.__tooltip._x = obj._xmouse + 2;
        obj.__tooltip._y = obj._ymouse + 22;
        obj.__tooltip._visible = true;
        clearInterval(obj.__tooltip_interval);
    } // End of the function
    function hideTooltip()
    {
        __tooltip._visible = false;
        clearInterval(__tooltip_interval);
    } // End of the function
    function addTool(label, icon, action, tooltip)
    {
        var _loc5 = 0;
        var _loc9 = __pos;
        var _loc2 = this.createEmptyMovieClip("menu" + String(__toolbar_items.length), 11 + 2 * __toolbar_items.length);
        __toolbar_items.push({movie: _loc2, type: "tool", active: true, label: label, icon: icon, inited: false, tooltip: tooltip});
        if (icon != null && icon != undefined)
        {
            var ic = _loc2.attachMovie(icon, "icon", 2, {_y: 3, _x: 4});
            ic._y = Math.round((22 - ic._height) / 2);
            _loc5 = 8 + ic._width;
        } // end if
        if (label != "" && label != null)
        {
            var _loc7 = _loc2.attachMovie("Label", "labelField", 4, {text: label, _width: 20, autoSize: "left", _y: 1, _x: _loc5});
        } // end if
        _loc7.draw();
        var ic = _loc2.attachMovie("MenuBoundingBox", "frame", 1, {_y: 0, _height: 21.700000, _width: 20});
        var _loc6 = new Color(ic);
        _loc6.setRGB(__highlightcolor);
        ic.enableStatus = true;
        ic.onRollOver = function ()
        {
            _alpha = 70;
            _parent._parent.prepareTooltip(tooltip);
        };
        ic.onRollOut = ic.onReleaseOutside = function ()
        {
            _alpha = 0;
            _parent._parent.hideTooltip();
        };
        var this_item_pos = __toolbar_items.length - 1;
        if (String(action) == "[object Object]")
        {
            ic.onRelease = function ()
            {
                if (ic.enableStatus)
                {
                    _alpha = 100;
                    action.onPress(this_item_pos);
                } // end if
            };
        }
        else
        {
            ic.onRelease = function ()
            {
                if (ic.enableStatus)
                {
                    _alpha = 100;
                    _parent._parent._parent[action](this_item_pos);
                } // end if
            };
        } // end else if
        ic._alpha = 0;
        ic.inside._alpha = 40;
        __pos = __pos + (_loc2._width + 10);
        this.draw();
        return (this_item_pos);
    } // End of the function
    function addSeparator()
    {
        var _loc3 = __pos;
        var _loc2 = this.attachMovie("toolbar_divider", "div" + String(__toolbar_items.length), 11 + 2 * __toolbar_items.length, {_x: _loc3, _y: 4 + __fbar_y});
        __toolbar_items.push({movie: _loc2, type: "separator", inited: false});
        __pos = __pos + (_loc2._width + 10);
        this.draw();
        return (__toolbar_items.length - 1);
    } // End of the function
    function addMenuTool(label, icon, smitems, action, tooltip)
    {
        var _loc15 = this.createEmptyMovieClip("menu" + String(__toolbar_items.length), 11 + 2 * __toolbar_items.length);
        var smcontainer = this.createEmptyMovieClip("smenu" + String(__toolbar_items.length), 12 + 2 * __toolbar_items.length);
        var pfeiltool = _loc15.attachMovie("toolbar_menupfeil", "pfeil", 5, {_x: 0});
        c = new Color(pfeiltool);
        c.setRGB(__highlightcolor);
        var this_item_pos = __toolbar_items.length - 1;
        var _loc19 = 0;
        __toolbar_items.push({movie: _loc15, submenu: smcontainer, type: "menu", active: true, label: label, icon: icon, inited: false, tooltip: tooltip});
        if (icon != null && icon != undefined)
        {
            var ic = _loc15.attachMovie(icon, "icon", 2, {_y: 3, _x: 4});
            ic._y = Math.round((22 - ic._height) / 2);
            _loc19 = 8 + ic._width;
        } // end if
        if (label != "" && label != null)
        {
            var _loc20 = _loc15.attachMovie("Label", "labelField", 4, {text: label, _width: 20, autoSize: "left", _y: 1, _x: _loc19});
            _loc20.draw();
        } // end if
        var ic = _loc15.attachMovie("MenuBoundingBox", "frame", 1, {_y: 0, _height: 21.700000, _width: 20});
        var c = new Color(ic);
        c.setRGB(__highlightcolor);
        ic._alpha = 0;
        ic.inside._alpha = 40;
        pfeiltool.frame._alpha = 0;
        pfeiltool.frame.inside._alpha = 40;
        var _loc8 = 0;
        var _loc9 = new Array();
        for (var _loc21 = 0; _loc21 < smitems.length; ++_loc21)
        {
            var _loc4 = smitems[_loc21];
            var _loc3 = smcontainer.createEmptyMovieClip("smi" + _loc21, _loc21 + 10);
            _loc3._y = 2 + _loc21 * 21;
            _loc3._x = 2;
            if (_loc4.icon != undefined)
            {
                var _loc6 = _loc3.attachMovie(_loc4.icon, "icon", 2, {_y: 3, _x: 6});
                _loc6._y = Math.round((22 - _loc6._height) / 2);
            } // end if
            var _loc7 = _loc3.attachMovie("Label", "labelField", 4, {text: _loc4.label, _width: 20, autoSize: "left", _y: 1, _x: 28});
            _loc7.draw();
            var _loc2 = _loc3.attachMovie("MenuBoundingBox", "frame", 1, {_x: 0, _y: 0, _height: 21.700000});
            var c = new Color(_loc2);
            c.setRGB(__highlightcolor);
            _loc9.push(_loc2);
            _loc8 = Math.max(_loc8, Math.round(_loc7._width) + 30);
            _loc2.enableStatus = true;
            _loc2.onRollOver = function ()
            {
                _alpha = 70;
            };
            _loc2.onRollOut = _loc2.onReleaseOutside = function ()
            {
                _alpha = 0;
            };
            _loc2.data_attr = _loc4.data;
            _loc2.onRelease = function ()
            {
                if (enableStatus)
                {
                    _alpha = 100;
                    action.onPress(data_attr, this_item_pos);
                } // end if
            };
            _loc2.inside._alpha = 40;
            _loc2._alpha = 0;
        } // end of for
        for (var _loc5 = 0; _loc5 < _loc9.length; ++_loc5)
        {
            _loc9[_loc5]._width = _loc8;
        } // end of for
        var _loc18 = smcontainer.attachMovie("MenuBoundingBox", "frame", 1, {_width: _loc8 + 4, _height: 21 * _loc21 + 4});
        var c = new Color(_loc18.border);
        c.setRGB(__highlightcolor);
        var c = new Color(_loc18.inside);
        c.setRGB(__submenubg);
        smcontainer._visible = false;
        var ich = this;
        ic.enableStatus = true;
        ic.onRollOver = pfeiltool.onRollOver = function ()
        {
            if (ic.enableStatus)
            {
                ic._alpha = 70;
                pfeiltool.frame._alpha = 70;
                _parent._parent.prepareTooltip(tooltip);
            } // end if
        };
        ic.onRollOut = pfeiltool.onRollOut = ic.onReleaseOutside = pfeiltool.onReleaseOutside = function ()
        {
            if (!smcontainer._visible && ic.enableStatus)
            {
                ic._alpha = 0;
                pfeiltool.frame._alpha = 0;
            } // end if
            _parent._parent.hideTooltip();
        };
        ic.onRelease = function ()
        {
            if (ic.enableStatus)
            {
                _alpha = 100;
                action.onPress(0, this_item_pos);
            } // end if
        };
        pfeiltool.onRelease = function ()
        {
            if (ic.enableStatus)
            {
                if (!smcontainer._visible)
                {
                    ich.hideSubmenu(true);
                    smcontainer._visible = true;
                    Mouse.addListener(ich.__ml);
                    ich.__active_submenu = {m: ic, p: pfeiltool.frame, sm: smcontainer};
                }
                else
                {
                    ich.__active_submenu = undefined;
                    smcontainer._visible = false;
                } // end if
            } // end else if
        };
        this.draw();
        return (this_item_pos);
    } // End of the function
    function addTextfieldTool(label, width, action)
    {
        var _loc2 = this.createEmptyMovieClip("menu" + String(__toolbar_items.length), 11 + 2 * __toolbar_items.length);
        __toolbar_items.push({movie: _loc2, type: "textfield", active: true, label: label, width: width, inited: false});
        _loc2.createTextField("fsTextField", 4, 2, 1, width, 20);
        var tf = _loc2.fsTextField;
        tf.type = "input";
        var _loc3 = new TextFormat();
        _loc3.font = "Arial";
        _loc3.size = 12;
        _loc3.color = 11184810;
        tf.setNewTextFormat(_loc3);
        var _loc4 = _loc2.attachMovie("MenuBoundingBox", "frame", 1, {_y: 1, _height: 19.700000, _width: width});
        var _loc8 = new Color(_loc4.border);
        _loc8.setRGB(__highlightcolor);
        _loc4.border._alpha = 70;
        tf.info_text = label;
        tf.text = label;
        var _loc7 = __toolbar_items.length - 1;
        tf.fire_to = action;
        tf.tool_id = _loc7;
        tf.focus = false;
        tf.enabled = true;
        var tkl = __kl;
        tf.onSetFocus = function ()
        {
            if (enabled)
            {
                Key.addListener(tkl);
                tf.focus = true;
                tf.text = "";
                tf.textColor = 0;
            } // end if
        };
        tf.onKillFocus = function (newFocus)
        {
            Key.removeListener(tkl);
            tf.focus = false;
            if (newFocus != null && tf.info_text != undefined && tf.info_text.length > 0)
            {
                tf.text = tf.info_text;
                tf.textColor = 11184810;
            } // end if
        };
        __pos = __pos + (_loc2._width + 10);
        this.draw();
        return (_loc7);
    } // End of the function
    function addLabel(labeltxt, textcolor, width, align)
    {
        var _loc3 = this.createEmptyMovieClip("menu" + String(__toolbar_items.length), 11 + 2 * __toolbar_items.length);
        __toolbar_items.push({movie: _loc3, type: "label", active: true, label: labeltxt, inited: false});
        _loc3.createTextField("labelField", 1, 0, __fbar_y + 2, width, 20);
        var _loc4 = _loc3.labelField;
        var _loc2 = new TextFormat();
        _loc2.font = "Arial";
        _loc2.size = 12;
        _loc2.color = textcolor;
        _loc2.align = align;
        _loc4.setNewTextFormat(_loc2);
        _loc4.text = labeltxt;
        _loc4.selectable = false;
        this.draw();
        return (__toolbar_items.length - 1);
    } // End of the function
    function addSliderTool(slide_width, action, tooltip)
    {
        var _loc2 = this.createEmptyMovieClip("menu" + String(__toolbar_items.length), 11 + 2 * __toolbar_items.length);
        __toolbar_items.push({movie: _loc2, type: "slider", sliderwidth: slide_width, active: true, inited: false});
        var _loc3 = _loc2.attachMovie("toolbar_slider_line", "sline", 1, {_x: 6, _y: 12 + __fbar_y, _width: slide_width});
        var _loc5 = _loc2.attachMovie("toolbar_slider_terminator", "sterminator", 2, {_y: 12 + __fbar_y, _x: slide_width + 6});
        var sknob = _loc2.attachMovie("toolbar_slider_knob", "sknob", 3, {_y: 7 + __fbar_y, _x: 3});
        var _loc4 = new Color(sknob);
        _loc4.setRGB(__highlightcolor);
        sknob.onPress = function ()
        {
            sknob.moveme = true;
            action.onSliderPress((_x - 3) / slide_width, this_item_pos);
        };
        var this_item_pos = __toolbar_items.length - 1;
        sknob.onRelease = sknob.onReleaseOutside = function ()
        {
            sknob.moveme = false;
            action.onSliderRelease((_x - 3) / slide_width, this_item_pos);
        };
        sknob.onMouseMove = function ()
        {
            if (sknob.moveme)
            {
                _x = Math.min(slide_width + 3, Math.max(3, _parent._xmouse));
            } // end if
        };
        _loc3.onPress = function ()
        {
            _parent.sknob._x = _xmouse * _xscale / 100 + 3;
            action.onSliderPress((_parent.sknob._x - 3) / slide_width, this_item_pos);
            _parent.sknob.moveme = true;
        };
        _loc3.onRelease = _loc3.onReleaseOutside = function ()
        {
            _parent.sknob.moveme = false;
            action.onSliderRelease((_parent.sknob._x - 3) / slide_width, this_item_pos);
        };
        this.draw();
        return (__toolbar_items.length - 1);
    } // End of the function
    function setSliderToolPos(newpos, tool_id)
    {
        if (__toolbar_items[tool_id].type == "slider")
        {
            newpos = Math.min(1, newpos);
            newpos = Math.max(0, newpos);
            __toolbar_items[tool_id].movie.sknob._x = newpos * __toolbar_items[tool_id].sliderwidth + 3;
        } // end if
    } // End of the function
    function changeLabel(newLabel, tool_id)
    {
        __toolbar_items[tool_id].movie.labelField.text = newLabel;
        if (__toolbar_items[tool_id].type != "label")
        {
            __toolbar_items[tool_id].inited = false;
            __toolbar_items[tool_id].movie.labelField.draw();
            this.draw();
        } // end if
    } // End of the function
    function disableToolAt(position)
    {
        var _loc3 = -1;
        for (var _loc2 = 0; _loc2 < __toolbar_items.length & _loc3 < position; ++_loc2)
        {
            if (__toolbar_items[_loc2].type != "separator")
            {
                ++_loc3;
            } // end if
        } // end of for
        _loc3 = _loc2 - 1;
        this.disableTool(_loc3);
    } // End of the function
    function disableTool(tool_id)
    {
        if (__toolbar_items[tool_id].active == true)
        {
            var _loc2 = __toolbar_items[tool_id].movie;
            if (__toolbar_items[tool_id].type == "tool")
            {
                _loc2._alpha = 30;
                _loc2.labelField.setStyle("color", 10066329);
                _loc2.frame.onRollOver = Void;
                _loc2.frame.onRollOut = _loc2.frame.onReleaseOutside = Void;
                _loc2.frame._alpha = 0;
                _loc2.frame.enableStatus = false;
                _loc2.frame.useHandCursor = false;
            }
            else if (__toolbar_items[tool_id].type == "textfield")
            {
                _loc2.fsTextField.text = _loc2.fsTextField.info_text;
                _loc2.fsTextField.textColor = 11184810;
                _loc2.fsTextField.type = "dynamic";
                _loc2.fsTextField.selectable = false;
                _loc2.fsTextField.enabled = false;
                _loc2.frame._alpha = 30;
            }
            else if (__toolbar_items[tool_id].type == "menu")
            {
                this.hideSubmenu(false);
                var _loc4 = _loc2.pfeil;
                _loc2._alpha = 30;
                _loc2.labelField.setStyle("color", 10066329);
                _loc2.frame._alpha = _loc4.frame._alpha = 0;
                _loc2.frame.enableStatus = false;
                _loc2.frame.useHandCursor = _loc4.useHandCursor = false;
            } // end else if
            this.hideTooltip();
            __toolbar_items[tool_id].active = false;
        } // end if
    } // End of the function
    function enableToolAt(position)
    {
        var _loc3 = -1;
        for (var _loc2 = 0; _loc2 < __toolbar_items.length & _loc3 < position; ++_loc2)
        {
            if (__toolbar_items[_loc2].type != "separator")
            {
                ++_loc3;
            } // end if
        } // end of for
        _loc3 = _loc2 - 1;
        this.enableTool(_loc3);
    } // End of the function
    function enableTool(tool_id)
    {
        if (__toolbar_items[tool_id].active == false)
        {
            var _loc2 = __toolbar_items[tool_id].movie;
            if (__toolbar_items[tool_id].type == "tool")
            {
                _loc2._alpha = 100;
                _loc2.labelField.setStyle("color", 0);
                var ttt = __toolbar_items[tool_id].tooltip;
                _loc2.frame.onRollOver = function ()
                {
                    _alpha = 70;
                    _parent._parent.prepareTooltip(ttt);
                };
                _loc2.frame.onRollOut = _loc2.frame.onReleaseOutside = function ()
                {
                    _alpha = 0;
                    _parent._parent.hideTooltip();
                };
                _loc2.frame.enableStatus = true;
                _loc2.frame.useHandCursor = true;
            }
            else if (__toolbar_items[tool_id].type == "textfield")
            {
                _loc2.fsTextField.type = "input";
                _loc2.fsTextField.selectable = true;
                _loc2.fsTextField.enabled = true;
                _loc2.frame._alpha = 100;
            }
            else if (__toolbar_items[tool_id].type == "menu")
            {
                var _loc4 = _loc2.pfeil;
                _loc2._alpha = 100;
                _loc2.labelField.setStyle("color", 0);
                _loc2.frame.enableStatus = true;
                _loc2.frame.useHandCursor = _loc4.useHandCursor = true;
            } // end else if
            __toolbar_items[tool_id].active = true;
        } // end if
    } // End of the function
    function removeAll()
    {
        Mouse.removeListener(__ml);
        Key.removeListener(__kl);
        for (var _loc2 = 0; _loc2 < __toolbar_items.length; ++_loc2)
        {
            if (__toolbar_items[_loc2].type == "tool")
            {
                __toolbar_items[_loc2].movie.icon.removeMovieClip();
                __toolbar_items[_loc2].movie.labelField.removeMovieClip();
                __toolbar_items[_loc2].movie.frame.removeMovieClip();
            }
            else if (__toolbar_items[_loc2].type == "textfield")
            {
                __toolbar_items[_loc2].movie.fsTextField.removeMovieClip();
                __toolbar_items[_loc2].movie.frame.removeMovieClip();
            }
            else if (__toolbar_items[_loc2].type == "menu")
            {
                __toolbar_items[_loc2].movie.icon.removeMovieClip();
                __toolbar_items[_loc2].movie.labelField.removeMovieClip();
                __toolbar_items[_loc2].movie.frame.removeMovieClip();
                __toolbar_items[_loc2].submenu.removeMovieClip();
            } // end else if
            __toolbar_items[_loc2].movie.removeMovieClip();
        } // end of for
        __toolbar_items = new Array();
        __pos = 10;
    } // End of the function
    function hideSubmenu(delete_interval, this_toolbar)
    {
        if (this_toolbar == undefined)
        {
            this_toolbar = this;
        } // end if
        if (this_toolbar.__active_submenu != undefined)
        {
            this_toolbar.__active_submenu.m._alpha = 0;
            this_toolbar.__active_submenu.p._alpha = 0;
            this_toolbar.__active_submenu.sm._visible = false;
            this_toolbar.__active_submenu = undefined;
        } // end if
        if (delete_interval)
        {
            clearInterval(this_toolbar.__submenu_interval);
        } // end if
    } // End of the function
    var className = "fsToolbar2";
    static var symbolOwner = fsToolbar2;
    static var symbolName = "fsToolbar2";
    var __pos = 10;
    var __kl = new Object();
    var __ml = new Object();
    var __fbar_x = 0;
    var __fbar_y = 0;
} // End of Class
