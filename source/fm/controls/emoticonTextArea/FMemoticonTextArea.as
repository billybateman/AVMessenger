class fm.controls.emoticonTextArea.FMemoticonTextArea extends mx.core.ScrollView
{
    var _name, __emoteClick, dispatchEvent, __get__emoteClick, __anamationTimeOut, __get__anamationTimeOut, __hScrollPolicy, __get__hScrollPolicy, __vScrollPolicy, scrollbarVis, __get__vScrollPolicy, __get__autoLinkTypes, textIndent, __get__indent, marginRight, __get__rightMargin, marginLeft, __get__leftMargin, _getTextFormat, label, __label, invalidate, __get__leading, __clearUnusedIcons, __get__clearUnusedIcons, __autoScroll, __get__autoScroll, __autoHiliteURL, __get__autoHiliteURL, __autoColorScrollBar, scrollColor, __get__autoColorScrollBar, __emoteClicking, __get__emoteClicking, __rollOverAnamation, __get__rollOverAnamation, __keyWordHide, __get__keyWordHide, __keyWordTrim, __get__keyWordTrim, __maxMessageHistory, __get__maxMessageHistory, __maxMessageHistoryPollRate, __get__maxMessageHistoryPollRate, __history, __iconScale, __get__iconScale, __iconRunOnce, __get__iconRunOnce, __iconFloodLimit, __get__iconFloodLimit, __iconOnScroll, __get__iconOnScroll, __backgroundColor, __hideColor, fmtHide, fmtTrim, __get__backgroundColor, __set__backgroundColor, __get__hideColor, __linkColor, fmtURL, __get__linkColor, __get__maxChars, __get__restrict, __get__wordWrap, __get__editable, __get__password, __get__htmlText, __get__text, initText, __get__message, __set__message, tfh, tfw, doLater, dispatchValueChangedEvent, getHPosition, setHPosition, __get__hPosition, getVPosition, setVPosition, __get__vPosition, _color, focusTextField, _parent, owner, hscroll, scroll, __set__text, addEventListener, __updateMapsInt, depth, createTextField, _ex, _ex2, tfx, tfy, _vpos, _hpos, hookedV, vScroller, hookedH, hScroller, getViewMetrics, __get__width, __get__height, __get__minWidth, __set__hScrollPolicy, __set__vScrollPolicy, getStyle, getFocusManager, removeEventListener, mapChanged, __resizeingInt, reSizing, xyzzy, destroyObject, createChild, drawValues, index, line, extent, _yOffset, move, _x, width, _y, _visible, firstRun, anamate, __loadExternal, hideMe, externalCheckInt, __complete, getBytesLoaded, getBytesTotal, key, _width, _height, alignment, __stopAnamationInt, __Playing, play, gotoAndStop, drawMe, loadList, loadedList, scrollAlpha, oldBackgroundColor, __get__tabIndex, __get___accProps, __get__styleSheet, __set___accProps, __set__anamationTimeOut, __set__autoColorScrollBar, __set__autoHiliteURL, __set__autoLinkTypes, __set__autoScroll, __set__clearUnusedIcons, __set__editable, __set__emoteClick, __set__emoteClicking, __get__fmCopyright, __get__fmVersion, __set__hPosition, __set__hideColor, __get__history, __set__htmlText, __set__iconFloodLimit, __set__iconOnScroll, __set__iconRunOnce, __set__iconScale, __set__indent, __set__keyWordHide, __set__keyWordTrim, __set__leading, __set__leftMargin, __get__length, __set__linkColor, __set__maxChars, __get__maxHPosition, __set__maxMessageHistory, __set__maxMessageHistoryPollRate, __get__maxVPosition, __set__password, __set__restrict, __set__rightMargin, __set__rollOverAnamation, __set__styleSheet, __set__tabIndex, __set__vPosition, __set__wordWrap;
    function FMemoticonTextArea()
    {
        super();
    } // End of the function
    function get fmCopyright()
    {
        return (this.getFMcopyright());
    } // End of the function
    function get fmVersion()
    {
        return (this.getFMVersion());
    } // End of the function
    function getFMcopyright()
    {
        return (fm.controls.emoticonTextArea.FMemoticonTextArea.FMcopyright);
    } // End of the function
    function getFMVersion()
    {
        return (fm.controls.emoticonTextArea.FMemoticonTextArea.FMversion);
    } // End of the function
    function tracer(msg, traceLevel, varName)
    {
        if (tracerLevel + 1 > 0)
        {
            if (typeof(traceLevel) == "string")
            {
                varName = traceLevel;
                traceLevel = 0;
            } // end if
            if (traceLevel < tracerLevel + 1)
            {
                varName = varName == undefined ? ("") : ("." + varName);
                var _loc2 = _name + "." + varName;
                switch (typeof(msg))
                {
                    case "object":
                    {
                        this.objTrace(msg, _loc2);
                        break;
                    } 
                    case "null":
                    {
                        trace (_loc2 + " value is null");
                        break;
                    } 
                    default:
                    {
                        trace (_loc2 + ": " + msg);
                        break;
                    } 
                } // End of switch
                trace (" ");
            } // end if
        } // end if
    } // End of the function
    function objTrace(obj, parentObj, run)
    {
        parentObj = parentObj == undefined ? ("") : (parentObj);
        run = run == undefined ? (500) : (run--);
        for (var _loc6 in obj)
        {
            var _loc2 = parentObj + "." + _loc6;
            if (typeof(obj[_loc6]) == "object")
            {
                trace (_loc2);
                if (run > 0)
                {
                    this.objTrace(obj[_loc6], "  " + _loc2, run);
                } // end if
                continue;
            } // end if
            trace (_loc2 + "=" + obj[_loc6]);
        } // end of for...in
    } // End of the function
    function randRange(min, max)
    {
        var _loc1 = Math.round(Math.random() * (max - min)) + min;
        return (_loc1);
    } // End of the function
    function copyObject(n)
    {
        var _loc2 = new Object();
        for (var _loc3 in n)
        {
            if (_loc3 !== "__ID__")
            {
                _loc2[_loc3] = n[_loc3];
            } // end if
        } // end of for...in
        return (_loc2);
    } // End of the function
    function get emoteClick()
    {
        return (__emoteClick);
    } // End of the function
    function set emoteClick(n)
    {
        __emoteClick = n;
        this.dispatchEvent(n);
        //return (this.emoteClick());
        null;
    } // End of the function
    function get anamationTimeOut()
    {
        return (__anamationTimeOut);
    } // End of the function
    function set anamationTimeOut(n)
    {
        __anamationTimeOut = n;
        //return (this.anamationTimeOut());
        null;
    } // End of the function
    function set hScrollPolicy(policy)
    {
        __hScrollPolicy = policy.toLowerCase();
        //return (this.hScrollPolicy());
        null;
    } // End of the function
    function set vScrollPolicy(policy)
    {
        __vScrollPolicy = policy.toLowerCase();
        scrollbarVis = __vScrollPolicy == "on";
        //return (this.vScrollPolicy());
        null;
    } // End of the function
    function get autoLinkTypes()
    {
        return (urlHeaders);
    } // End of the function
    function set autoLinkTypes(n)
    {
        urlHeaders = n;
        for (var _loc3 in n)
        {
            urlHeaders.push(n[_loc3]);
        } // end of for...in
        //return (this.autoLinkTypes());
        null;
    } // End of the function
    function get indent()
    {
        return (textIndent);
    } // End of the function
    function set indent(n)
    {
        textIndent = n;
        //return (this.indent());
        null;
    } // End of the function
    function get rightMargin()
    {
        return (marginRight);
    } // End of the function
    function set rightMargin(n)
    {
        marginRight = n;
        //return (this.rightMargin());
        null;
    } // End of the function
    function get leftMargin()
    {
        return (marginLeft);
    } // End of the function
    function set leftMargin(n)
    {
        marginLeft = n;
        //return (this.leftMargin());
        null;
    } // End of the function
    function get leading()
    {
        var _loc2 = this._getTextFormat();
        return (_loc2.leading);
    } // End of the function
    function set leading(n)
    {
        var _loc2 = this._getTextFormat();
        _loc2.leading = n;
        label.setTextFormat(_loc2);
        label.setNewTextFormat(_loc2);
        __label.setTextFormat(_loc2);
        __label.setNewTextFormat(_loc2);
        this.invalidate();
        //return (this.leading());
        null;
    } // End of the function
    function get clearUnusedIcons()
    {
        return (__clearUnusedIcons);
    } // End of the function
    function set clearUnusedIcons(n)
    {
        __clearUnusedIcons = n;
        //return (this.clearUnusedIcons());
        null;
    } // End of the function
    function get autoScroll()
    {
        return (__autoScroll);
    } // End of the function
    function set autoScroll(n)
    {
        __autoScroll = n;
        this.doAutoScroll();
        //return (this.autoScroll());
        null;
    } // End of the function
    function get autoHiliteURL()
    {
        return (__autoHiliteURL);
    } // End of the function
    function set autoHiliteURL(n)
    {
        __autoHiliteURL = n;
        //return (this.autoHiliteURL());
        null;
    } // End of the function
    function get autoColorScrollBar()
    {
        return (__autoColorScrollBar);
    } // End of the function
    function set autoColorScrollBar(n)
    {
        __autoColorScrollBar = n;
        if (!n)
        {
            scrollColor = undefined;
        } // end if
        //return (this.autoColorScrollBar());
        null;
    } // End of the function
    function get emoteClicking()
    {
        return (__emoteClicking);
    } // End of the function
    function set emoteClicking(n)
    {
        __emoteClicking = n;
        //return (this.emoteClicking());
        null;
    } // End of the function
    function get rollOverAnamation()
    {
        return (__rollOverAnamation);
    } // End of the function
    function set rollOverAnamation(n)
    {
        __rollOverAnamation = n;
        //return (this.rollOverAnamation());
        null;
    } // End of the function
    function get keyWordHide()
    {
        return (__keyWordHide);
    } // End of the function
    function set keyWordHide(n)
    {
        __keyWordHide = n;
        //return (this.keyWordHide());
        null;
    } // End of the function
    function get keyWordTrim()
    {
        return (__keyWordTrim);
    } // End of the function
    function set keyWordTrim(n)
    {
        __keyWordTrim = n;
        //return (this.keyWordTrim());
        null;
    } // End of the function
    function get maxMessageHistory()
    {
        return (__maxMessageHistory);
    } // End of the function
    function set maxMessageHistory(n)
    {
        __maxMessageHistory = n;
        //return (this.maxMessageHistory());
        null;
    } // End of the function
    function get maxMessageHistoryPollRate()
    {
        return (__maxMessageHistoryPollRate);
    } // End of the function
    function set maxMessageHistoryPollRate(n)
    {
        __maxMessageHistoryPollRate = n;
        //return (this.maxMessageHistoryPollRate());
        null;
    } // End of the function
    function get history()
    {
        return (__history);
    } // End of the function
    function get iconScale()
    {
        return (__iconScale);
    } // End of the function
    function set iconScale(n)
    {
        __iconScale = n;
        //return (this.iconScale());
        null;
    } // End of the function
    function get iconRunOnce()
    {
        return (__iconRunOnce);
    } // End of the function
    function set iconRunOnce(n)
    {
        __iconRunOnce = n;
        this.linesShowing();
        //return (this.iconRunOnce());
        null;
    } // End of the function
    function get iconFloodLimit()
    {
        return (__iconFloodLimit);
    } // End of the function
    function set iconFloodLimit(n)
    {
        __iconFloodLimit = n;
        //return (this.iconFloodLimit());
        null;
    } // End of the function
    function get iconOnScroll()
    {
        return (__iconOnScroll);
    } // End of the function
    function set iconOnScroll(n)
    {
        __iconOnScroll = n;
        //return (this.iconOnScroll());
        null;
    } // End of the function
    function get backgroundColor()
    {
        return (__backgroundColor);
    } // End of the function
    function set backgroundColor(n)
    {
        __backgroundColor = n;
        __hideColor.setRGB(n);
        fmtHide.color = fmtTrim.color = n;
        //return (this.backgroundColor());
        null;
    } // End of the function
    function get hideColor()
    {
        return (__hideColor);
    } // End of the function
    function set hideColor(n)
    {
        __hideColor = n;
        var _loc2 = n;
        this.__set__backgroundColor(_loc2);
        //return (this.hideColor());
        null;
    } // End of the function
    function get linkColor()
    {
        return (__linkColor);
    } // End of the function
    function set linkColor(n)
    {
        __linkColor = n;
        var _loc2 = n;
        fmtURL.color = _loc2;
        //return (this.linkColor());
        null;
    } // End of the function
    function get maxChars()
    {
        return (label.maxChars);
    } // End of the function
    function set maxChars(x)
    {
        __label.maxChars = label.maxChars = x;
        //return (this.maxChars());
        null;
    } // End of the function
    function get length()
    {
        return (label.length);
    } // End of the function
    function get restrict()
    {
        return (label.restrict);
    } // End of the function
    function set restrict(s)
    {
        __label.restrict = label.restrict = s == "" ? (null) : (s);
        //return (this.restrict());
        null;
    } // End of the function
    function get wordWrap()
    {
        return (label.wordWrap);
    } // End of the function
    function set wordWrap(s)
    {
        __label.wordWrap = label.wordWrap = s;
        this.invalidate();
        //return (this.wordWrap());
        null;
    } // End of the function
    function get editable()
    {
        return (__editable);
    } // End of the function
    function set editable(x)
    {
        __editable = x;
        __label.type = label.type = x ? ("input") : ("dynamic");
        //return (this.editable());
        null;
    } // End of the function
    function get password()
    {
        return (label.password);
    } // End of the function
    function set password(s)
    {
        __label.password = label.password = s;
        //return (this.password());
        null;
    } // End of the function
    function get htmlText()
    {
        return (this.getHtmlText());
    } // End of the function
    function set htmlText(t)
    {
        this.setHtmlText(t);
        //return (this.htmlText());
        null;
    } // End of the function
    function get text()
    {
        return (this.getText());
    } // End of the function
    function set text(t)
    {
        this.setText(t);
        //return (this.text());
        null;
    } // End of the function
    function getText()
    {
        if (initializing)
        {
            return (initText);
        } // end if
        var _loc2 = label;
        return (_loc2.text);
    } // End of the function
    function getHtmlText()
    {
        if (initializing)
        {
            return (initText);
        } // end if
        var _loc2 = label;
        return (_loc2.htmlText);
    } // End of the function
    function setText(t)
    {
        this.setMessage(t, "text");
    } // End of the function
    function setHtmlText(t)
    {
        if (initializing)
        {
            initText = t;
        }
        else
        {
            this.setMessage(t, "htmlText");
        } // end else if
    } // End of the function
    function get message()
    {
        return ("");
    } // End of the function
    function set message(t)
    {
        this.makeMessage(t);
        //return (this.message());
        null;
    } // End of the function
    function setMessage(t, f)
    {
        var _loc2 = label;
        lastTEXTlength = _loc2.text.length;
        lastHTMLlength = _loc2.htmlText.length;
        var _loc4 = t.substring(0, lastHTMLlength - 1);
        if (t.length == 0 || _loc2.htmlText !== _loc4)
        {
            this.cleanField();
        } // end if
        if (messageID == 0)
        {
            lastTEXTlength = lastHTMLlength = 0;
        } // end if
        this.__set__message(t.substring(lastHTMLlength, t.length));
    } // End of the function
    function makeMessage(t)
    {
        var _loc14 = this.getHtmlText();
        var _loc7 = label;
        var _loc3 = __label;
        _loc3.text = "";
        _loc3.html = true;
        _loc3.htmlText = t;
        _loc3.setSize(tfw, tfh);
        var _loc6 = messages.length;
        var _loc2 = new Object();
        _loc2.messageID = _loc6;
        _loc2.emotes = new Array();
        _loc2.hasIcons = false;
        _loc2.childrenLoaded = false;
        _loc2.offset = this.getOffset(_loc6);
        var _loc8 = this.keyWord(_loc3.htmlText);
        if (__autoHiliteURL)
        {
            _loc8.htmlText = this.getLinks(_loc8.htmlText);
        } // end if
        _loc8.message = _loc6;
        var _loc12 = this._getTextFormat();
        _loc7.embedFonts = _loc12.embedFonts == true;
        _loc3.embedFonts = _loc12.embedFonts == true;
        _loc7.multiline = true;
        _loc7.wordWrap = this.__get__wordWrap() == true;
        _loc3.multiline = true;
        _loc3.wordWrap = this.__get__wordWrap() == true;
        _loc3.setTextFormat(_loc12);
        _loc3.htmlText = _loc8.htmlText;
        _loc2.text = _loc3.text;
        _loc8.htmlText = _loc2.htmlText = _loc3.htmlText;
        _loc8.index = _loc2.index = _loc7.text.length;
        _loc3.wordWrap = false;
        _loc3.autoSize = true;
        _loc2.textWidth = _loc3.textWidth;
        _loc2.hasIcons = _loc8.keys.length > 0;
        _loc7.setTextFormat(_loc12);
        _loc7.htmlText = _loc14 + _loc3.htmlText;
        _loc7.type = this.__get__editable() == true ? ("input") : ("dynamic");
        _loc3.type = this.__get__editable() == true ? ("input") : ("dynamic");
        this.size();
        _loc7.background = false;
        _loc3.background = false;
        Selection.getFocus();
        var _loc4;
        _loc2.lineMap = this.messageLines(_loc2);
        var _loc5;
        for (var _loc9 = 0; _loc9 < _loc2.lineMap.length; ++_loc9)
        {
            _loc4 = _loc2.lineMap[_loc9];
            _loc5 = _loc4.yOffset + _loc2.offset.yOffset;
            lineMap.push({m: _loc6, l: _loc9, i: _loc2.lineMap[_loc9].index, y: _loc5, h: _loc2.hasIcons});
        } // end of for
        var _loc13 = _loc7.textHeight - (_loc4.extent.height + _loc4.extent.leading - 4);
        lineMap[lineMap.length - 1].y = _loc13;
        messages.push(_loc2);
        if (_loc8.keys.length > 0)
        {
            _loc8.text = _loc3.text;
            _loc2.emotes = this.addIcons(_loc8);
            _loc2.childrenLoaded = this.loadMessageEmotes(_loc6, true, _loc2.emotes);
        } // end if
        this.linesShowing();
        this.doAutoScroll();
        this.doLater(this, "reAlignIcons");
        this.dispatchValueChangedEvent(t);
    } // End of the function
    function get hPosition()
    {
        return (this.getHPosition());
    } // End of the function
    function set hPosition(pos)
    {
        this.setHPosition(pos);
        label.hscroll = pos;
        label.background = false;
        //return (this.hPosition());
        null;
    } // End of the function
    function get vPosition()
    {
        return (this.getVPosition());
    } // End of the function
    function set vPosition(pos)
    {
        this.setVPosition(pos);
        label.scroll = pos + 1;
        label.background = false;
        //return (this.vPosition());
        null;
    } // End of the function
    function get maxVPosition()
    {
        var _loc2 = label.maxscroll - 1;
        return (_loc2 == undefined ? (0) : (_loc2));
    } // End of the function
    function get maxHPosition()
    {
        var _loc2 = label.maxhscroll;
        return (_loc2 == undefined ? (0) : (_loc2));
    } // End of the function
    function get minWidth()
    {
        var _loc5 = this.getMessageFromLineNum(linesShowingObj.topLine);
        var _loc3 = Number(_loc5.minRight);
        var _loc4 = Number(linesShowingObj.topLine);
        for (var _loc2 = Number(_loc5.messageID) + 1; _loc4 < linesShowingObj.bottomLine; _loc2 = _loc2 + 1)
        {
            _loc3 = messages[_loc2].minRight > _loc3 ? (messages[_loc2].minRight) : (_loc3);
            _loc4 = _loc4 + messages[_loc2].lineMap.length;
        } // end of for
        return (_loc3);
    } // End of the function
    function init(Void)
    {
        super.init();
        label.styleName = this;
        __label.styleName = this;
        __label.multiline = true;
        _color = UIObject.textColorList;
        focusTextField = label;
        label.html = true;
        __label.html = true;
        label.owner = this;
        __label.owner = this;
        label.onSetFocus = function (x)
        {
            _parent.onSetFocus(x);
        };
        label.onKillFocus = function (x)
        {
            _parent.onKillFocus(x);
        };
        label.drawFocus = function (b)
        {
            _parent.drawFocus(b);
        };
        label.onChanged = function ()
        {
            owner.adjustScrollBars();
            owner.dispatchEvent({type: "change"});
            owner.dispatchValueChangedEvent(owner.text);
        };
        label.onScroller = function ()
        {
            owner.hPosition = hscroll;
            owner.vPosition = scroll - 1;
            if (owner.__onScrollMaster)
            {
                owner.doLater(owner, "linesShowing");
            } // end if
        };
        if (this.__get__text() == undefined)
        {
            this.__set__text("");
        } // end if
        var _loc3 = new Object();
        _loc3.owner = this;
        _loc3.handleEvent = function (eventObj)
        {
            clearInterval(owner.__resizeingInt);
            owner.mapChanged = true;
            owner.reSizing = true;
            owner.__resizeingInt = setInterval(owner, "updateMaps", 350);
            if (owner.tfw <= owner.__minWidth)
            {
                owner.dispatchEvent({type: "iconUpdate", cmd: "hide"});
            }
            else
            {
                owner.dispatchEvent({type: "iconUpdate", value: owner.linesShowingObj, cmd: "resizeing"});
            } // end else if
        };
        this.addEventListener("resize", _loc3);
        var _loc4 = __maxMessageHistoryPollRate > 0 ? (__maxMessageHistoryPollRate * 100) : (30000);
        __updateMapsInt = setInterval(this, "updateMaps", _loc4, false);
    } // End of the function
    function createChildren(Void)
    {
        super.createChildren();
        depth = depth == undefined ? (1) : (depth);
        this.createTextField("__label", depth++, 0, 0, tfw, 1);
        this.createTextField("_ex", depth++, 0, 0, tfw, 1);
        this.createTextField("_ex2", depth++, 0, 0, tfw, 1);
        __label._visible = false;
        label.autoSize = "none";
        __label.autoSize = "none";
        _ex._visible = false;
        _ex.autoSize = "left";
        _ex2._visible = false;
        _ex2.autoSize = "left";
    } // End of the function
    function layoutContent(x, y, totalW, totalH, displayW, displayH)
    {
        var _loc2 = label;
        if (tfx != x || tfy != y || tfw != displayW || tfh != displayH)
        {
            tfx = x;
            tfy = y;
            tfw = displayW;
            tfh = displayH;
            _loc2.move(tfx, tfy);
            _loc2.setSize(tfw, tfh);
            __label.setSize(tfw, tfh);
            this.doLater(this, "adjustScrollBars");
        } // end if
        this.dispatchEvent({type: "iconUpdate", value: linesShowingObj, realign: true});
    } // End of the function
    function scrollChanged(Void)
    {
        var _loc2 = Selection;
        if (_loc2.lastBeginIndex != undefined)
        {
            this.restoreSelection();
        } // end if
        label.background = false;
        if (!this.__get__iconOnScroll())
        {
            this.linesShowing();
            __onScrollMaster = true;
            this.dispatchEvent({type: "iconUpdate", value: linesShowingObj, cmd: "show"});
        } // end if
        this.checkVisibleIcons();
    } // End of the function
    function draw()
    {
        var _loc2 = label;
        var _loc4 = this.getHtmlText();
        if (initializing)
        {
            var _loc5 = this.iconEnvSetup();
            initializing = false;
            delete this.initText;
            this.doLater(this, "invalidate");
        } // end if
        var _loc3 = this._getTextFormat();
        _loc2.embedFonts = _loc3.embedFonts == true;
        if (_loc3 != undefined)
        {
            if (initializing)
            {
                _loc2.setTextFormat(_loc3);
                _loc2.setNewTextFormat(_loc3);
            } // end if
        } // end if
        _loc2.multiline = true;
        _loc2.wordWrap = this.__get__wordWrap() == true;
        _loc2.setTextFormat(_loc3);
        _loc2.htmlText = _loc4;
        _loc2.type = this.__get__editable() == true ? ("input") : ("dynamic");
        this.size();
        _loc2.background = false;
        Selection.getFocus();
        this.linesShowing();
        this.doAutoScroll();
    } // End of the function
    function onScroll(docObj)
    {
        var _loc3 = label;
        super.onScroll(docObj);
        _loc3.hscroll = this.__get__hPosition() + 0;
        _loc3.scroll = this.__get__vPosition() + 1;
        _vpos = _loc3.scroll;
        _hpos = _loc3.hscroll;
        _loc3.background = false;
        if (hookedV != true)
        {
            vScroller.addEventListener("scrollChanged", this);
            hookedV = true;
        } // end if
        if (hookedH != true)
        {
            hScroller.addEventListener("scrollChanged", this);
            hookedH = true;
        } // end if
        if (this.__get__iconOnScroll())
        {
            var _loc5 = linesShowingObj;
            var _loc4 = this.linesShowing();
            if (_loc4.topLine < _loc5.topLine)
            {
                this.reloadDeadEmotes(linesShowingObj.topLine, __iconFloodLimit);
            }
            else
            {
                this.reloadDeadEmotes(linesShowingObj.bottomLine, __iconFloodLimit);
            } // end else if
        }
        else if (__onScrollMaster)
        {
            __onScrollMaster = false;
            this.dispatchEvent({type: "iconUpdate", value: linesShowingObj, cmd: "hide"});
        } // end else if
    } // End of the function
    function size(Void)
    {
        var _loc4 = tfw;
        var _loc3 = this.getViewMetrics();
        var _loc8 = _loc3.left + _loc3.right;
        var _loc5 = _loc3.top + _loc3.bottom;
        var _loc7 = _loc3.left;
        var _loc6 = _loc3.top;
        tfx = _loc7;
        tfy = _loc6;
        tfw = this.__get__width() - _loc8;
        tfh = this.__get__height() - _loc5;
        __minWidth = tfw < _loc4 || __minWidth > tfw || isNaN(__minWidth) ? (this.__get__minWidth()) : (__minWidth);
        super.size();
        label.move(tfx, tfy);
        label.setSize(tfw, tfh);
        if (this.__get__height() <= 40)
        {
            this.__set__hScrollPolicy("off");
            this.__set__vScrollPolicy("off");
        } // end if
        this.doLater(this, "adjustScrollBars");
    } // End of the function
    function setEnabled(enable)
    {
        vScroller.enabled = enable;
        hScroller.enabled = enable;
        label.type = this.__get__editable() == false || enable == false ? ("dynamic") : ("input");
        __label.type = this.__get__editable() == false || enable == false ? ("dynamic") : ("input");
        label.selectable = enable;
        __label.selectable = enable;
        var _loc3 = this.getStyle(enable ? ("color") : ("disabledColor"));
        if (_loc3 == undefined)
        {
            _loc3 = enable ? (0) : (8947848);
        } // end if
        this.setColor(_loc3);
    } // End of the function
    function setColor(col)
    {
        label.textColor = col;
        __label.textColor = col;
    } // End of the function
    function setFocus(Void)
    {
        Selection.setFocus(label);
    } // End of the function
    function onSetFocus(x)
    {
        var f = Selection.getFocus();
        var o = eval(f);
        if (o != this.label)
        {
            Selection.setFocus(this.label);
            return;
        } // end if
        this.getFocusManager().defaultPushButtonEnabled = false;
        this.addEventListener("keyDown", this);
        super.onSetFocus(x);
    } // End of the function
    function onKillFocus(x)
    {
        this.getFocusManager().defaultPushButtonEnabled = true;
        this.removeEventListener("keyDown", this);
        this.doAutoScroll();
        super.onKillFocus(x);
    } // End of the function
    function restoreSelection(x)
    {
        var _loc2 = Selection;
        Selection.setSelection(_loc2.lastBeginIndex, _loc2.lastEndIndex);
        label.scroll = _vpos;
        label.hscroll = _hpos;
    } // End of the function
    function getExtents(s, Start, End, parm, xMap)
    {
        var _loc12 = 0;
        if (s == undefined)
        {
            var _loc5 = label;
        }
        else if (isNaN(s))
        {
            _loc5 = _ex2;
            _loc5.html = true;
            _loc5.htmlText = s;
        }
        else
        {
            _loc5 = label;
            _loc12 = s;
        } // end else if
        if (Start !== undefined)
        {
            switch (parm)
            {
                case "length":
                {
                    End = Start + End;
                    break;
                } 
                case "eow":
                {
                    End = _loc5.text.indexOf(" ", Start);
                    End = End > 0 ? (End) : (_loc5.text.length);
                    break;
                } 
                case "eol":
                {
                    End = _loc5.text.indexOf("\r", Start);
                    End = End > 0 ? (End) : (_loc5.text.length);
                    break;
                } 
                case "fit":
                {
                    var _loc14 = new Number(End);
                    End = _loc5.text.length;
                    break;
                } 
                default:
                {
                    parm = "default";
                    break;
                } 
            } // End of switch
            var _loc17 = new Object({text: "", height: 0, width: 0, ascent: 0, descent: 0, index: Start - _loc12, end: End - _loc12, length: End - Start, parm: parm});
            End = End == Start || End == undefined ? (Start + 1) : (End);
            if (xMap)
            {
                _loc17.xMap = new Array();
            } // end if
            var _loc3 = Start;
            var _loc10 = false;
            var _loc9 = true;
            while (_loc3 < End)
            {
                var _loc7 = _loc5.text.charAt(_loc3);
                var _loc11 = _loc5.text.charCodeAt(_loc3);
                var _loc4 = _loc5.getTextFormat(_loc3);
                var _loc2 = _loc4.getTextExtent(_loc7);
                _loc2.height = _loc2.ascent + _loc2.descent;
                if (_loc9)
                {
                    _loc9 = false;
                    _loc17.align = _loc4.align;
                    _loc17.leading = _loc4.leading;
                } // end if
                if (parm == "fit")
                {
                    _loc10 = _loc17.width + _loc2.width > _loc14;
                    _loc17.end = _loc3 - _loc12;
                    _loc17.length = _loc3 - Start;
                    if (_loc10)
                    {
                        break;
                    } // end if
                } // end if
                if (xMap)
                {
                    _loc17.xMap.push(_loc17.width);
                } // end if
                _loc17.text = _loc17.text + _loc7;
                _loc17.width = _loc17.width + _loc2.width;
                _loc17.height = _loc17.height > _loc2.height ? (_loc17.height) : (_loc2.height);
                _loc17.ascent = _loc17.ascent > _loc2.ascent ? (_loc17.ascent) : (_loc2.ascent);
                _loc17.descent = _loc17.descent > _loc2.descent ? (_loc17.descent) : (_loc2.descent);
                ++_loc3;
            } // end while
        }
        else
        {
            _loc17 = new Object();
        } // end else if
        false;
        return (_loc17);
    } // End of the function
    function linesShowing()
    {
        var _loc2 = label;
        var _loc6 = _loc2.bottomScroll - _loc2.scroll;
        var _loc7 = _loc6 + _loc2.maxscroll;
        var _loc5 = _loc2.bottomScroll - 1;
        var _loc3 = _loc5 - _loc6;
        linesShowingObj = new Object({visibleLines: _loc6, totalLines: _loc7, topLine: _loc3, bottomLine: _loc5, yOffset: this.getLineYoffSet(_loc3)});
        this.dispatchEvent({type: "iconUpdate", value: linesShowingObj});
        return (linesShowingObj);
    } // End of the function
    function checkVisibleIcons()
    {
        var _loc3 = this.linesShowing();
        for (var _loc2 = _loc3.topLine; _loc2 < _loc3.bottomLine + 1; ++_loc2)
        {
            this.reloadDeadEmotes(_loc2);
        } // end of for
        this.doLater(this, "reAlignIcons");
    } // End of the function
    function reloadDeadEmotes(l, n)
    {
        var _loc2 = this.getMessageFromLineNum(l);
        if (_loc2.hasIcons && !_loc2.childrenLoaded)
        {
            if (n > 0 && _loc2.emotes.length < n || n == undefined)
            {
                this.loadMessageEmotes(_loc2.messageID, false, _loc2.emotes);
                this.reAlignIcons(_loc2.messageID);
            } // end if
        } // end if
    } // End of the function
    function lineXoffset(lineWidth, lineAlign, isWraped)
    {
        var _loc3 = isWraped ? (0) : (textIndent);
        var _loc2 = 0;
        switch (lineAlign)
        {
            case "left":
            {
                _loc2 = marginLeft + _loc3 + tfx + 2;
                break;
            } 
            case "right":
            {
                _loc2 = tfw - lineWidth - (marginRight + 2) + tfx;
                break;
            } 
            case "center":
            {
                _loc2 = (tfw - lineWidth + (marginLeft + _loc3 + 2 + tfx - marginRight)) * 0.500000;
                break;
            } 
        } // End of switch
        return (_loc2);
    } // End of the function
    function getOffset(m)
    {
        var _loc7 = 4;
        for (var _loc6 = 0; m > 0; _loc6 = _loc6 + (_loc2 == undefined || isNaN(_loc2) ? (0) : (_loc2)))
        {
            --m;
            var _loc2 = messages[m].lineMap.length;
            var _loc3 = messages[m].lineMap[_loc2 - 1];
            var _loc4 = _loc3.yOffset + _loc3.extent.height + _loc3.extent.leading;
            _loc7 = _loc7 + (_loc4 == undefined || isNaN(_loc4) ? (0) : (_loc4));
        } // end of for
        return ({yOffset: _loc7, lines: _loc6});
    } // End of the function
    function purgeOldMessages(b)
    {
        b = b == undefined ? (0) : (b);
        var _loc6 = messages.length;
        var _loc4 = _loc6 - __maxMessageHistory > b ? (_loc6 - __maxMessageHistory) : (0);
        var _loc2 = new Object({purged: _loc4, htmlText: "", purgeLength: 0, messages: new Array()});
        if (_loc4 > 0 && __maxMessageHistory > 0 && !mapChanged)
        {
            this.dispatchEvent({type: "iconUpdate", cmd: "kill"});
            mapChanged = true;
            var _loc3 = new Number(_loc4);
            var _loc8 = "";
            while (_loc3 > 0)
            {
                _loc2.messages.push(messages.shift());
                _loc2.htmlText = _loc2.htmlText + new String(_loc2.messages[0].htmlText);
                --_loc3;
            } // end while
            _loc2.purgeLength = messages[0].index;
            label.replaceText(0, _loc2.purgeLength + 1, label.text.substr(_loc2.purgeLength, 1));
            this.dispatchEvent({type: "purge", detail: _loc2});
        } // end if
        return (_loc2);
    } // End of the function
    function updateMaps(f)
    {
        clearInterval(__resizeingInt);
        reSizing = f !== undefined ? (f) : (true);
        var _loc13 = reSizing ? (__maxMessageHistory * 0.500000) : (__maxMessageHistory * 1.500000);
        var _loc12 = this.purgeOldMessages(_loc13);
        if (_loc12.purged == 0 && !reSizing)
        {
            return (false);
        }
        else
        {
            mapChanged = true;
            reSizing = false;
            this.draw();
            var _loc6 = 0;
            var _loc10 = _loc12.purgeLength;
            lineMap = new Array();
            for (var _loc6 = 0; _loc6 < messages.length; ++_loc6)
            {
                var _loc3 = messages[_loc6];
                _loc3.index = _loc3.index - _loc10;
                var _loc11 = lineMap[lineMap.length - 1];
                _loc3.offset = this.getOffset(_loc6);
                _loc3.messageID = _loc6;
                var _loc4 = new Number(_loc10);
                if (_loc3.textWidth > tfw || _loc3.forceResize)
                {
                    _loc3.lineMap = this.messageLines(_loc3);
                    _loc4 = 0;
                } // end if
                var _loc2 = _loc3.lineMap;
                for (var _loc5 = 0; _loc5 < _loc2.length; ++_loc5)
                {
                    _loc2[_loc5].index = _loc2[_loc5].index - _loc4;
                    _loc2[_loc5].end = _loc2[_loc5].end - _loc4;
                    _loc2[_loc5].messageID = _loc6;
                    lineMap.push({m: _loc6, l: _loc5, i: _loc2[_loc5].index, y: _loc2[_loc5].yOffset + _loc3.offset.yOffset, h: _loc3.hasIcons});
                } // end of for
            } // end of for
            mapChanged = false;
            this.linesShowing();
            this.doLater(this, "reAlignIcons");
            this.doLater(this, "checkVisibleIcons");
        } // end else if
        return (true);
    } // End of the function
    function reAlignIcons(m)
    {
        this.dispatchEvent({type: "iconUpdate", message: m, value: linesShowingObj, realign: true});
    } // End of the function
    function getMessageFromLineNum(n)
    {
        var _loc2 = messages[lineMap[n].m];
        return (_loc2);
    } // End of the function
    function getLineYoffSet(n)
    {
        return (lineMap[n].y);
    } // End of the function
    function messageLines(ll)
    {
        ll.forceResize = false;
        ll.minRight = 0;
        _ex.html = true;
        _ex.text = "";
        _ex._width = tfw;
        _ex.wordWrap = true;
        _ex.htmlText = ll.htmlText;
        _ex.autoSize = true;
        ll.maxscroll = _ex.maxscroll;
        ll.textHeight = _ex.textHeight;
        var _loc10 = new Array();
        var _loc16 = _ex.maxscroll;
        var _loc31 = "<P ";
        var _loc11 = ll.htmlText.split(_loc31);
        var _loc12 = new String(ll.text);
        while (_loc11[0].length == 0 || _loc11[0].lastIndexOf("</P>") < 0)
        {
            var _loc28 = _loc11.shift();
        } // end while
        for (var _loc32 in _loc11)
        {
            _loc11[_loc32] = _loc31 + _loc11[_loc32];
            _ex.htmlText = _loc11[_loc32];
            _loc12 = _loc12.substring(0, _loc12.length - _ex.text.length - 1);
            var _loc3 = new Object({text: _ex.text, htmlText: _ex.htmlText, index: ll.index + _loc12.length});
            var _loc9 = _loc3.text.length;
            var _loc13 = _ex.maxscroll;
            var _loc2 = _ex.text.length - 2;
            var _loc14 = _loc2 > 0;
            if (_loc2 <= 1)
            {
                _ex.replaceText(0, _loc3.text.length, "|-|");
                _loc9 = _loc3.text.length;
                _loc2 = _ex.text.length - 2;
            } // end if
            var _loc4;
            var _loc8;
            while (_loc2 > 0 || _loc14)
            {
                _ex.replaceText(_loc2, _loc2 + 2, " ");
                if (_loc13 > _ex.maxscroll || _loc2 <= 1)
                {
                    _loc2 = _loc2 < 0 ? (0) : (_loc2);
                    if (_loc3.text.charCodeAt(_loc2) !== 32)
                    {
                        var _loc15 = _ex.text.substring(0, _loc2);
                        for (var _loc6 = _loc15.lastIndexOf(" ") + 1; _loc3.text.charCodeAt(_loc6) == 32; ++_loc6)
                        {
                        } // end of for
                        _loc4 = this.getExtents(_loc3.index, _loc6 + _loc3.index, _loc9 + _loc3.index, "", ll.hasIcons);
                        _loc8 = _loc4.width < tfw;
                        _loc2 = _loc8 ? (_loc6) : (_loc2);
                    } // end if
                    while (_loc3.text.charCodeAt(_loc2) == 32)
                    {
                        ++_loc2;
                        _loc8 = false;
                    } // end while
                    _loc4 = _loc8 ? (_loc4) : (this.getExtents(_loc3.index, _loc2 + _loc3.index, _loc9 + _loc3.index, "", ll.hasIcons));
                    var _loc19 = _loc2 > 0;
                    if (_loc4.align.toLowerCase() !== "left" || _loc19)
                    {
                        ll.forceResize = true;
                    } // end if
                    var _loc25 = this.lineXoffset(_loc4.width, _loc4.align, _loc19);
                    ll.minRight = ll.minRight > _loc4.width + _loc25 ? (ll.minRight) : (_loc4.width + _loc25);
                    _loc10.unshift({line: _loc16, index: _loc3.index + _loc2, cIndex: _loc12.length + _loc2, maxWidth: _loc4.width, extent: _loc4, xOffset: _loc25, isWraped: _loc19, yOffset: undefined, messageID: ll.messageID, hasIcons: ll.hasIcons, childrenLoaded: ll.childrenLoaded, isBlank: _loc14});
                    _loc14 = false;
                    _loc13 = _ex.maxscroll;
                    --_loc16;
                    _loc9 = _loc2 - 1;
                } // end if
                _loc2 = _ex.text.length - 2;
            } // end while
        } // end of for...in
        for (var _loc7 = 0; _loc7 < _loc10.length; ++_loc7)
        {
            _loc10[_loc7].line = _loc7;
            _loc10[_loc7].yOffset = _loc7 == 0 ? (0) : (_loc10[_loc7 - 1].yOffset + _loc10[_loc7 - 1].extent.height + _loc10[_loc7 - 1].extent.leading);
        } // end of for
        if (!reSizing)
        {
            this.linesShowing();
        } // end if
        if (ll.hasIcons)
        {
            this.dispatchEvent({type: "iconUpdate", message: ll.messageID, value: linesShowingObj, realign: true});
        } // end if
        return (_loc10);
    } // End of the function
    function getLicense()
    {
        var _loc2 = xyzzy == 1904 ? (keyWords.length) : (20);
        _loc2 = _loc2 > keyWords.length ? (keyWords.length) : (_loc2);
        return (_loc2);
    } // End of the function
    function getLinePosition(idx, m)
    {
        var _loc3 = messages[m];
        var _loc4 = new Object();
        for (var _loc2 = 0; _loc2 < _loc3.lineMap.length; ++_loc2)
        {
            if (idx >= _loc3.lineMap[_loc2].cIndex && idx <= _loc3.lineMap[_loc2].cIndex + _loc3.lineMap[_loc2].extent.length)
            {
                _loc4.line = Number(_loc2);
                _loc4.num = Number(_loc2) + Number(_loc3.offset.lines);
                _loc4.x = _loc3.lineMap[_loc2].xOffset + _loc3.lineMap[_loc2].extent.xMap[idx - _loc3.lineMap[_loc2].cIndex];
                _loc4.extent = _loc3.lineMap[_loc2].extent;
                _loc4.textWidth = _loc3.textWidth;
                _loc4.forceResize = _loc3.forceResize;
                return (_loc4);
            } // end if
        } // end of for
        return (_loc4);
    } // End of the function
    function addIcons(m)
    {
        var _loc11 = new Array();
        for (var _loc12 in m.keys)
        {
            var _loc3 = m.keys[_loc12].key;
            var _loc5 = m.keys[_loc12].found;
            var _loc2 = 0;
            while (_loc2 >= 0 && _loc5 > 0)
            {
                _loc2 = m.text.indexOf(_loc3.text, _loc2);
                if (_loc2 >= 0)
                {
                    _loc11.push({contentPath: _loc3.contentPath, index: _loc2, end: _loc2 + _loc3.text.length, key: _loc3, extent: this.getExtents(m.index, _loc2 + m.index, _loc3.text.length, "length")});
                    _loc2 = _loc2 + _loc3.text.length;
                    --_loc5;
                } // end if
            } // end while
        } // end of for...in
        return (_loc11);
    } // End of the function
    function loadMessageEmotes(n, f, m)
    {
        f = f == undefined ? (false) : (f);
        m = m == undefined ? (messages[n].emotes) : (m);
        m.sortOn("index", Array.NUMERIC);
        for (var _loc3 = 0; _loc3 < m.length; ++_loc3)
        {
            var _loc2 = new Object(m[_loc3]);
            _loc2.message = n;
            _loc2.firstRun = f;
            this.destroyObject(n + "-" + _loc2.index);
            this.createChild(_loc2.contentPath, n + "-" + _loc2.index, _loc2);
        } // end of for
        messages[n].childrenLoaded = true;
        return (true);
    } // End of the function
    function childLoaded(obj)
    {
        super.childLoaded(obj);
        obj.owner = this;
        this.addEventListener("iconUpdate", obj);
        var _loc8 = obj._width;
        var _loc7 = obj._height;
        obj.__stopAnamationInt = 0;
        obj.key.width = obj.key.width == undefined ? (_loc8) : (obj.key.width);
        obj.key.height = obj.key.height == undefined ? (_loc7) : (obj.key.height);
        obj.key.scaleOn = obj.key.scaleOn == undefined ? (this.__get__iconScale()) : (obj.key.scaleOn);
        obj._alpha = obj.key.alpha;
        obj.drawValues = linesShowingObj;
        obj.key.h = obj.key.scaleOn == "width" ? (obj.extent.width) : (obj.extent.ascent);
        obj.key.w = obj.key.scaleOn == "height" ? (obj.extent.ascent) : (obj.extent.width);
        obj.__loadExternal = obj.key.contentPath.indexOf("://") >= 0;
        obj.externalCheckInt = 0;
        if (obj.key.scaleOn == "both")
        {
            obj.key.height = obj.key.h;
            obj.key.width = obj.key.w;
        } // end if
        obj.key.scale = obj.key.scaleOn == "both" ? (1) : (obj.key.scaleOn == "width" ? (obj.key.h / obj.key.width) : (obj.key.w / obj.key.height));
        obj.line = this.getLinePosition(obj.index, obj.message);
        obj.__playing = false;
        obj.hideMe = false;
        obj.drawMe = false;
        obj._yOffset = 0;
        obj.alignment = function ()
        {
            drawValues = owner.linesShowingObj;
            line = new Object(owner.getLinePosition(index, message));
            _yOffset = owner.getLineYoffSet(line.num) + line.extent.height + line.extent.leading - extent.ascent;
            this.move(line.x, _yOffset - drawValues.yOffset);
            _visible = _x + width < owner.tfw && _y < owner.tfh && _y > 3 ? (_visible) : (false);
            this.anamate(firstRun);
            if (__loadExternal)
            {
                if (!_visible && !hideMe)
                {
                    externalCheckInt = setInterval(this, "externalView", 500);
                } // end if
            } // end if
        };
        obj.externalView = function ()
        {
            clearInterval(externalCheckInt);
            trace (_name + " external " + __complete + " " + this.getBytesLoaded());
            if (this.getBytesLoaded() < this.getBytesTotal() - 100)
            {
                externalCheckInt = setInterval(this, "externalView", 500);
            }
            else
            {
                __loadExternal = false;
                owner.invalidate();
            } // end else if
        };
        obj.fit = function ()
        {
            _visible = false;
            _width = key.width * key.scale;
            _height = key.height * key.scale;
            this.alignment();
        };
        obj.anamate = function (run)
        {
            clearInterval(__stopAnamationInt);
            if (run)
            {
                if (!__Playing || firstRun)
                {
                    this.play();
                    for (var _loc2 in this)
                    {
                        if (this[_loc2] !== owner && typeof(this[_loc2]) == "movieclip")
                        {
                            this[_loc2].play();
                        } // end if
                    } // end of for...in
                } // end if
                if ((key.anamationTimeOut == undefined ? (owner.anamationTimeOut) : (key.anamationTimeOut)) > 0)
                {
                    __stopAnamationInt = setInterval(this, "stopAnamation", (key.anamationTimeOut == undefined ? (owner.anamationTimeOut) : (key.anamationTimeOut)) * 1000);
                } // end if
                __Playing = true;
            }
            else
            {
                __Playing = false;
                this.gotoAndStop(1);
                for (var _loc2 in this)
                {
                    if (this[_loc2] !== owner && typeof(this[_loc2]) == "movieclip")
                    {
                        this[_loc2].gotoAndStop(this[_loc2]._totalframes);
                    } // end if
                } // end of for...in
            } // end else if
        };
        obj.stopAnamation = function ()
        {
            this.anamate(false);
        };
        if (this.__get__rollOverAnamation() || obj.key.rollOverAnamation)
        {
            obj.onRollOver = function ()
            {
                super.onRollOver();
                this.anamate(true);
            };
        } // end if
        var _loc6 = obj.key.emoteClicking == undefined ? (this.__get__emoteClicking()) : (obj.key.emoteClicking);
        if (_loc6)
        {
            obj.onPress = function ()
            {
                super.onPress();
                var _loc3 = new Object();
                _loc3.type = "emoteClick";
                _loc3.target = this;
                _loc3.detail = key.emoteClickDetail == undefined ? (key.text) : (key.emoteClickDetail);
                _loc3.contentPath = key.contentPath;
                owner.emoteClick = _loc3;
            };
        } // end if
        obj.handleEvent = function (ev)
        {
            if (ev.message !== undefined && ev.message !== message || ev._name !== undefined && ev._name !== _name)
            {
                return;
            } // end if
            drawValues = ev.value !== undefined ? (ev.value) : (drawValues);
            if (ev.realign)
            {
                hideMe = false;
                this.alignment();
            } // end if
            switch (ev.type)
            {
                case "iconUpdate":
                {
                    switch (ev.cmd)
                    {
                        case "hide":
                        {
                            hideMe = true;
                            this.anamate(false);
                            break;
                        } 
                        case "show":
                        {
                            hideMe = false;
                            this.anamate(firstRun);
                            break;
                        } 
                        case "stop":
                        {
                            this.anamate(false);
                            break;
                        } 
                        case "start":
                        {
                            this.anamate(true);
                            break;
                        } 
                        case "resizeing":
                        {
                            hideMe = line.forceResize || line.textWidth > owner.tfw || !_visible;
                            this.anamate(false);
                            break;
                        } 
                        case "kill":
                        {
                            owner.killIcon(this);
                            break;
                        } 
                    } // End of switch
                    if (line.num > ev.value.bottomLine + 15 || line.num < ev.value.topLine - 2)
                    {
                        if (owner.getMessageFromLineNum(ev.value.bottomLine).messageID < message || owner.getMessageFromLineNum(ev.value.topLine).messageID > message)
                        {
                            owner.killIcon(this);
                        } // end if
                    } // end if
                    drawMe = false && (!hideMe ? (line.num >= ev.value.topLine) : (line.num <= ev.value.bottomLine));
                    _visible = drawMe ? (_visible) : (false);
                    if (drawMe && drawValues !== undefined)
                    {
                        this.move(line.x, _yOffset - drawValues.yOffset);
                        _visible = _x + width < owner.tfw && _y < owner.tfh && _y > 3;
                        if (!key.runOnce && !owner.iconRunOnce)
                        {
                            this.anamate(true);
                        } // end if
                    } // end if
                    break;
                } 
            } // End of switch
        };
        obj.fit();
    } // End of the function
    function killIcon(n)
    {
        this.removeEventListener("iconUpdate", n);
        messages[n.message].childrenLoaded = false;
        this.destroyObject(n._name);
    } // End of the function
    function cleanField(Void)
    {
        this.dispatchEvent({type: "iconUpdate", cmd: "kill"});
        lineMap = new Array();
        __firstMessage = 1;
        messageID = 0;
        messages = new Array();
        label.text = "";
    } // End of the function
    function getLinks(s)
    {
        __label.htmlText = s;
        var _loc11 = __label.text;
        var _loc5 = _loc11.toLowerCase();
        for (var _loc12 in urlHeaders)
        {
            var _loc9 = urlHeaders[_loc12].toLowerCase();
            for (var _loc3 = 0; _loc3 >= 0; _loc3 = _loc4)
            {
                _loc3 = _loc5.indexOf(_loc9, _loc3);
                if (_loc3 >= 0)
                {
                    var _loc7 = _loc3;
                    var _loc4 = _loc5.indexOf(" ", _loc3);
                    if (_loc4 < 0)
                    {
                        _loc4 = __label.text.length;
                    } // end if
                    fmtURL.url = (_loc9 == "www." ? ("http://") : ("")) + _loc11.substring(_loc7, _loc4);
                    __label.setTextFormat(_loc7, _loc4, fmtURL);
                } // end if
            } // end of for
        } // end of for...in
        for (var _loc2 = 0; _loc2 >= 0; _loc2 = _loc6)
        {
            _loc2 = _loc5.indexOf("@", _loc2);
            if (_loc2 >= 0)
            {
                while (_loc5.charCodeAt(_loc2 - 1) !== 32 && _loc2 - 1 >= 0)
                {
                    _loc2 = _loc2 - 1;
                } // end while
                var _loc6 = _loc5.indexOf(" ", _loc2 + 1);
                _loc6 = _loc6 > 0 ? (_loc6) : (_loc5.length - 1);
                var _loc10 = _loc5.substring(_loc2, _loc6);
                var _loc8 = _loc10.lastIndexOf(".");
                _loc8 = _loc10.length - _loc8;
                if (_loc8 < 5 && _loc8 > 1)
                {
                    fmtURL.url = "mailto:" + _loc11.substring(_loc2, _loc6);
                    __label.setTextFormat(_loc2, _loc6, fmtURL);
                } // end if
            } // end if
        } // end of for
        return (__label.htmlText);
    } // End of the function
    function checkLoadProgress()
    {
        for (var _loc7 in loadList)
        {
            var _loc2 = loadList[_loc7];
            _loc2.loaded = _loc2.obj.getBytesLoaded();
            _loc2.total = _loc2.obj.getBytesTotal();
            if (_loc2.total > 0)
            {
                _loc2.obj._visible = false;
                this.dispatchEvent({type: "progress", target: _loc2.obj, current: _loc2.loaded, total: _loc2.total});
                if (_loc2.loaded == _loc2.total)
                {
                    if (loadedList == undefined)
                    {
                        loadedList = new Object();
                    } // end if
                    loadedList[_loc7] = _loc2;
                    delete loadList[_loc7];
                    this.doLater(this, "contentLoaded");
                }
                else
                {
                    this.doLater(this, "checkLoadProgress");
                } // end else if
                continue;
            } // end if
            if (_loc2.total == -1)
            {
                if (_loc2.failedOnce != undefined)
                {
                    ++_loc2.failedOnce;
                }
                else
                {
                    _loc2.failedOnce = 0;
                } // end if
            } // end else if
            this.doLater(this, "checkLoadProgress");
        } // end of for...in
    } // End of the function
    function keyWord(s)
    {
        var _loc5 = new Object();
        _loc5.htmlText = s;
        var _loc4 = new Array();
        var _loc8 = new Number(this.__get__iconFloodLimit());
        if (_loc8 == 0)
        {
            return (_loc5);
        } // end if
        __label.htmlText = s;
        var _loc6 = false;
        fmtHide.color = __backgroundColor;
        var _loc11 = this.getLicense();
        for (var _loc7 = 0; _loc7 < _loc11; ++_loc7)
        {
            _loc6 = true;
            var _loc2 = keyWords[_loc7];
            _loc2.hideText = _loc2.hideText == undefined ? (this.__get__keyWordHide()) : (_loc2.hideText);
            _loc2.trim = _loc2.trim == undefined ? (this.__get__keyWordTrim()) : (_loc2.trim);
            var _loc3 = 0;
            while (_loc3 >= 0)
            {
                _loc3 = __label.text.indexOf(_loc2.text, _loc3);
                if (_loc8 <= 0)
                {
                    if (__clearUnusedIcons)
                    {
                        __label.replaceText(_loc3, _loc3 + _loc2.text.length, " ");
                    }
                    else
                    {
                        _loc5.keys = _loc4;
                        _loc5.htmlText = __label.htmlText;
                        return (_loc5);
                    } // end else if
                    continue;
                } // end if
                if (_loc3 >= 0)
                {
                    --_loc8;
                    if (_loc2.hideText)
                    {
                        __label.setTextFormat(_loc3, _loc3 + _loc2.text.length, fmtHide);
                    } // end if
                    if (_loc2.trim > 0)
                    {
                        __label.setTextFormat(_loc3 + _loc2.trim, _loc3 + _loc2.text.length, fmtTrim);
                    } // end if
                    _loc3 = _loc3 + _loc2.text.length;
                    if (_loc6)
                    {
                        _loc4.push({key: _loc2, found: 1});
                        _loc6 = false;
                        continue;
                    } // end if
                    ++_loc4[_loc4.length - 1].found;
                } // end if
            } // end while
        } // end of for
        _loc5.keys = _loc4;
        _loc5.htmlText = __label.htmlText;
        return (_loc5);
    } // End of the function
    function getLineOffsets(Void)
    {
        var _loc16 = this._getTextFormat();
        var _loc18 = _loc16.getTextExtent2(label.text);
        var _loc5 = _root._getTextExtent;
        _loc5.setNewTextFormat((TextFormat)(_loc16));
        var _loc14 = label.wordWrap;
        var _loc9 = 0;
        var _loc7 = tfw - 2 - 2;
        var _loc12 = new Array();
        var _loc17 = new String(label.text);
        var _loc15 = _loc17.split("\r");
        for (var _loc11 = 0; _loc11 < _loc15.length; ++_loc11)
        {
            _loc12.push(_loc9);
            var _loc4 = _loc15[_loc11];
            _loc5.text = _loc4;
            var _loc13 = Math.ceil(_loc5.textWidth / _loc7);
            var _loc10 = Math.floor(_loc4.length / _loc13);
            var _loc3;
            while (_loc14 && _loc5.textWidth > _loc7)
            {
                _loc3 = _loc4.indexOf(" ", _loc10);
                var _loc6;
                if (_loc3 == -1)
                {
                    _loc3 = _loc4.lastIndexOf(" ");
                    if (_loc3 == -1)
                    {
                        _loc3 = _loc10;
                    } // end if
                } // end if
                _loc6 = _loc4.substr(0, _loc3);
                _loc5.text = _loc6;
                if (_loc5.textWidth > _loc7)
                {
                    while (_loc5.textWidth > _loc7)
                    {
                        var _loc8 = _loc3;
                        _loc3 = _loc4.lastIndexOf(" ", _loc3 - 1);
                        if (_loc3 == -1)
                        {
                            _loc3 = _loc8 - 1;
                        } // end if
                        _loc6 = _loc4.substr(0, _loc3);
                        _loc5.text = _loc6;
                    } // end while
                }
                else if (_loc5.textWidth < _loc7)
                {
                    _loc8 = _loc3;
                    while (_loc5.textWidth < _loc7)
                    {
                        _loc8 = _loc3;
                        _loc3 = _loc4.indexOf(" ", _loc3 + 1);
                        if (_loc3 == -1)
                        {
                            if (_loc4.indexOf(" ", 0) != -1)
                            {
                                break;
                            }
                            else
                            {
                                _loc3 = _loc8 + 1;
                            } // end if
                        } // end else if
                        _loc6 = _loc4.substr(0, _loc3);
                        _loc5.text = _loc6;
                    } // end while
                    _loc3 = _loc8;
                } // end else if
                _loc9 = _loc9 + _loc3;
                _loc12.push(_loc9 + 1);
                _loc4 = _loc4.substr(_loc3);
                if (_loc4.charAt(0) == " ")
                {
                    _loc4 = _loc4.substr(1, _loc4.length - 1);
                    _loc9 = _loc9 + 1;
                } // end if
                _loc5.text = _loc4;
            } // end while
            _loc9 = _loc9 + (_loc4.length + 1);
        } // end of for
        return (_loc12);
    } // End of the function
    function keyDown(e)
    {
        var _loc5 = e.code;
        if (_loc5 == 34)
        {
            var _loc6 = label.bottomScroll - label.scroll + 1;
            var _loc3 = this.getLineOffsets();
            var _loc2 = Math.min(label.bottomScroll + 1, label.maxscroll);
            if (_loc2 == label.maxscroll)
            {
                var _loc4 = label.length;
                Selection.setSelection(_loc4, _loc4);
            }
            else
            {
                label.scroll = _loc2;
                Selection.setSelection(_loc3[_loc2 - 1], _loc3[_loc2 - 1]);
            } // end else if
        }
        else if (_loc5 == 33)
        {
            _loc6 = label.bottomScroll - label.scroll + 1;
            _loc3 = this.getLineOffsets();
            _loc2 = label.scroll - 1;
            if (_loc2 < 1)
            {
                Selection.setSelection(0, 0);
            }
            else
            {
                Selection.setSelection(_loc3[_loc2 - 1], _loc3[_loc2 - 1]);
                label.scroll = Math.max(_loc2 - _loc6, 1);
            } // end else if
        } // end else if
    } // End of the function
    function iconEnvSetup()
    {
        fmtHide = new TextFormat();
        fmtHide.color = fmtTrim.color = __backgroundColor;
        fmtTrim = new TextFormat();
        fmtTrim.size = 0;
        fmtURL = new TextFormat();
        var _loc2 = __linkColor;
        fmtURL.color = _loc2;
        fmtURL.underline = true;
        fmtURL.bold = true;
        fmtURL.target = "_blank";
        return (true);
    } // End of the function
    function checkScroller()
    {
        var _loc2 = vScroller !== undefined;
        if (_loc2 !== scrollbarVis)
        {
            scrollbarVis = _loc2;
            if (!reSizing && !mapChanged)
            {
                reSizing = true;
                this.updateMaps();
            } // end if
        }
        else
        {
            scrollbarVis = vScroller !== undefined;
        } // end else if
    } // End of the function
    function doAutoScroll()
    {
        if (String(Selection.getFocus()) !== String(label) && __autoScroll)
        {
            label.scroll = label.maxscroll;
        } // end if
    } // End of the function
    function setScrollColor(Void)
    {
        scrollAlpha = scrollAlpha == undefined ? (40) : (scrollAlpha);
        if ((scrollColor == undefined || oldBackgroundColor !== this.__get__backgroundColor()) && this.__get__autoColorScrollBar())
        {
            oldBackgroundColor = backgroundColor;
            var _loc3 = new Color(vScroller.scrollTrack_mc);
            _loc3.setRGB(this.__get__backgroundColor());
            var _loc2 = _loc3.getTransform();
            _loc2 = {ra: _loc2.ra + 15, ba: _loc2.ba + 15, ga: _loc2.ga + 15, aa: _loc2.aa - 20};
            _loc3.setTransform(_loc2);
            scrollColor = _loc3.getRGB();
        } // end if
        if (vScroller !== undefined && scrollColor !== undefined)
        {
            _loc3 = new Color(vScroller.scrollTrack_mc);
            _loc3.setRGB(scrollColor);
            vScroller.scrollThumb_mc.r_mc._alpha = scrollAlpha;
            vScroller.scrollThumb_mc.m_mc._alpha = scrollAlpha;
            vScroller.scrollThumb_mc.l_mc._alpha = scrollAlpha;
            vScroller.upArrow_mc._alpha = scrollAlpha;
            vScroller.downArrow_mc._alpha = scrollAlpha;
        } // end if
        if (hScroller !== undefined && scrollColor !== undefined)
        {
            _loc3 = new Color(hScroller.scrollTrack_mc);
            _loc3.setRGB(scrollColor);
            hScroller.scrollThumb_mc.r_mc._alpha = scrollAlpha;
            hScroller.scrollThumb_mc.m_mc._alpha = scrollAlpha;
            hScroller.scrollThumb_mc.l_mc._alpha = scrollAlpha;
            hScroller.upArrow_mc._alpha = scrollAlpha;
            hScroller.downArrow_mc._alpha = scrollAlpha;
        } // end if
    } // End of the function
    function adjustScrollBars()
    {
        var _loc2 = label;
        var _loc4 = _loc2.bottomScroll - _loc2.scroll + 1;
        var _loc3 = _loc4 + _loc2.maxscroll - 1;
        if (_loc3 < 1)
        {
            _loc3 = 1;
        } // end if
        var _loc5 = 0;
        if (_loc2.textWidth + 5 > _loc2._width)
        {
            if (!_loc2.wordWrap)
            {
                _loc5 = _loc2._width + _loc2.maxhscroll;
            } // end if
        }
        else
        {
            _loc2.hscroll = 0;
            _loc2.background = false;
        } // end else if
        if (_loc2.height / _loc4 != Math.round(_loc2.height / _loc4))
        {
            --_loc3;
            this.doLater(this, "linesShowing");
        } // end if
        this.setScrollProperties(_loc5, 1, _loc3, _loc2.height / _loc4);
        this.setScrollColor();
    } // End of the function
    function setScrollProperties(colCount, colWidth, rwCount, rwHeight, hPadding, wPadding)
    {
        super.setScrollProperties(colCount, colWidth, rwCount, rwHeight, hPadding, wPadding);
        if (vScroller == undefined)
        {
            hookedV = false;
        } // end if
        if (hScroller == undefined)
        {
            hookedH = false;
        } // end if
    } // End of the function
    function get tabIndex()
    {
        return (label.tabIndex);
    } // End of the function
    function set tabIndex(w)
    {
        label.tabIndex = w;
        //return (this.tabIndex());
        null;
    } // End of the function
    function set _accProps(val)
    {
        label._accProps = val;
        //return (this._accProps());
        null;
    } // End of the function
    function get _accProps()
    {
        return (label._accProps);
    } // End of the function
    function get styleSheet()
    {
        return (label.styleSheet);
    } // End of the function
    function set styleSheet(v)
    {
        label.styleSheet = v;
        //return (this.styleSheet());
        null;
    } // End of the function
    function copy(refObj)
    {
        var _loc2 = new Function(refObj.__proto__.constructor)();
        this.copyProperties(_loc2, refObj);
        return (_loc2);
    } // End of the function
    function copyProperties(dstObj, srcObj)
    {
        var _loc7;
        for (var _loc8 in srcObj)
        {
            _loc7 = typeof(srcObj[_loc8]);
            if (_loc7 != "function")
            {
                if (_loc7 == "object")
                {
                    if (srcObj[_loc8] instanceof Array)
                    {
                        var _loc6 = new Array();
                        var _loc4 = srcObj[_loc8];
                        for (var _loc3 = 0; _loc3 < _loc4.length; ++_loc3)
                        {
                            _loc6[_loc3] = _loc4[_loc3];
                        } // end of for
                        dstObj[_loc8] = _loc6;
                    }
                    else if (srcObj[_loc8] instanceof String)
                    {
                        dstObj[_loc8] = new String(srcObj[_loc8]);
                    }
                    else if (srcObj[_loc8] instanceof Number)
                    {
                        dstObj[_loc8] = new Number(srcObj[_loc8]);
                    }
                    else if (srcObj[_loc8] instanceof Boolean)
                    {
                        dstObj[_loc8] = new Boolean(srcObj[_loc8]);
                    }
                    else
                    {
                        dstObj[_loc8] = this.copy(srcObj[_loc8]);
                    } // end else if
                    continue;
                } // end if
                dstObj[_loc8] = srcObj[_loc8];
            } // end if
        } // end of for...in
    } // End of the function
    static var symbolName = "FMemoticonTextArea";
    static var symbolOwner = fm.controls.emoticonTextArea.FMemoticonTextArea;
    static var FMversion = "rc.1.0.0";
    static var FMcopyright = "Copyright (C) 2004 - 2005 Scott Richter / BanTV / FLYnMonkey. All Rights Reserved.  The following Code is subject to all restrictions on such code as contained in the End User License Agreement accompanying this product.  A license must be uptained for comerical use.";
    var tracerLevel = 0;
    var className = "FMemoticonTextArea";
    var initializing = true;
    var clipParameters = {text: 1, wordWrap: 1, editable: 1, maxChars: 1, restrict: 1, html: 1, password: 1, autoScroll: 1, indent: 1, leftMargin: 1, rightMargin: 1, leading: 1, iconOnScroll: 1, iconRunOnce: 1, iconFloodLimit: 1, keyWordTrim: 1, keyWordHide: 1, iconScale: 1};
    static var mergedClipParameters = UIObject.mergeClipParameters(fm.controls.emoticonTextArea.FMemoticonTextArea.prototype.clipParameters, mx.core.ScrollView.prototype.clipParameters);
    var messageID = 0;
    var __lineMapRec = 0;
    var messages = new Array();
    var urlHeaders = new Array("www.", "http://", "ftp://", "mms://", "rms://", "https://", "ftps://", "rtmp://", "mailto:");
    var lineMap = new Array();
    var linesShowingObj = new Object();
    var keyWords = new Array();
    var lastL = 0;
    var __onScrollMaster = true;
    var __labelHeight = 1000;
    var oldBottomLine = -1;
    var lastHTMLlength = 0;
    var lastTEXTlength = 0;
    var __minWidth = 0;
    var __firstMessage = 1;
    var __licenses = new Array();
    var __editable = false;
} // End of Class
