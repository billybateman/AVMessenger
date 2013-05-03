class com.bjc.loader.BJCAdvLoader extends mx.core.UIComponent
{
    var ico, __width, w, __height, h, _xscale, _yscale, tcounter, startPos, startRot, bytesLoaded, bytesTotal, percentLoaded, holder, content, btn, allowPrint, completed, mcLoader, printLoader, loadListener, printListener, _parent, source, preloader, invalidate, __get__Source, maskSource, __get__Mask, scaleMode, __get__ScaleContent, btnMode, __get__ScaleButton, prelView, __get__ShowPreloader, prelTextView, __get__ShowPreloadText, prelCol, __get__PrelColor, prelTextColor, __get__PrelTextColor, compEffect, __get__CompleteEffect, unloadEffect, __get__UnloadEffect, rollOverEffect, __get__ROverEffect, rollOverZoom, __get__ROverZoom, effectSpeed, __get__EffectSpeed, effectStrength, __get__EffectStrength, reload, sourceArray, local, effectID, onFailure, unloading, rOverID, unloaded, createEmptyMovieClip, printer, mask, __set__CompleteEffect, __set__EffectSpeed, __set__EffectStrength, __set__Mask, __set__PrelColor, __set__PrelTextColor, __set__ROverEffect, __set__ROverZoom, __set__ScaleButton, __set__ScaleContent, __set__ShowPreloadText, __set__ShowPreloader, __set__Source, __set__UnloadEffect;
    function BJCAdvLoader()
    {
        super();
        ico._visible = false;
        w = __width;
        h = __height;
        _xscale = 100;
        _yscale = 100;
        tcounter = 0;
        startPos = 0;
        startRot = 0;
        bytesLoaded = 0;
        bytesTotal = 0;
        percentLoaded = 0;
        holder.createEmptyMovieClip("content", 0);
        content = holder.content;
        holder._visible = false;
        btn.enabled = false;
        allowPrint = true;
        completed = false;
        mcLoader = new MovieClipLoader();
        printLoader = new MovieClipLoader();
        loadListener = new Object();
        loadListener.onLoadStart = function (target_mc)
        {
            if (target_mc._parent._parent.prelView)
            {
                target_mc._parent._parent.preloader.bar._visible = true;
                target_mc._parent._parent.preloader.bar._width = 0;
            }
            else
            {
                target_mc._parent._parent.preloader.bar._visible = false;
            } // end else if
            if (target_mc._parent._parent.prelTextView)
            {
                target_mc._parent._parent.preloader.prelTxt._visible = true;
                target_mc._parent._parent.preloader.prelTxt.text = "0%";
                target_mc._parent._parent.preloader.prelTxt.textColor = target_mc._parent._parent.prelTextColor;
            }
            else
            {
                target_mc._parent._parent.preloader.prelTxt._visible = false;
                target_mc._parent._parent.preloader.prelTxt.text = "";
            } // end else if
        };
        loadListener.onLoadProgress = function (target_mc, loaded, total)
        {
            var _loc2 = new Number(0);
            _loc2 = Math.round(loaded / total * 100);
            target_mc._parent._parent.bytesLoaded = loaded;
            target_mc._parent._parent.bytesTotal = total;
            target_mc._parent._parent.percentLoaded = _loc2;
            if (target_mc._parent._parent.prelView)
            {
                target_mc._parent._parent.preloader.bar._width = _loc2 * target_mc._parent._parent.w / 100;
            } // end if
            if (target_mc._parent._parent.prelTextView)
            {
                target_mc._parent._parent.preloader.prelTxt.text = _loc2 + "%";
                target_mc._parent._parent.preloader.prelTxt.textColor = target_mc._parent._parent.prelTextColor;
            } // end if
            target_mc._parent._parent.onProgress.call(target_mc._parent._parent, total, loaded, _loc2);
        };
        loadListener.onLoadInit = function (target_mc)
        {
            target_mc._parent._parent.preloader.bar._visible = false;
            target_mc._parent._parent.preloader.prelTxt._visible = false;
            target_mc._parent._parent.scaleContent();
            switch (target_mc._parent._parent.compEffect)
            {
                case "None":
                {
                    target_mc._parent._parent.holder._visible = true;
                    break;
                } 
                case "Fade in":
                {
                    target_mc._parent._parent.holder._alpha = 0;
                    target_mc._parent._parent.holder._visible = true;
                    break;
                } 
                case "Zoom in":
                case "Wobble in":
                case "Rotate in":
                {
                    target_mc._parent._parent.holder._xscale = 0;
                    target_mc._parent._parent.holder._yscale = 0;
                    target_mc._parent._parent.holder._visible = true;
                    break;
                } 
            } // End of switch
            completed = true;
            target_mc._parent._parent.tcounter = 0;
            target_mc._parent._parent.onComplete.call();
            clearInterval(target_mc._parent._parent.effectID);
            target_mc._parent._parent.effectID = setInterval(target_mc._parent._parent, "onCmp", 30);
        };
        loadListener.onLoadError = function (target_mc, errorCode)
        {
            target_mc._parent._parent.onFailure.call();
        };
        mcLoader.addListener(loadListener);
        printListener = new Object();
        printListener.onLoadInit = function (target_mc)
        {
            if (target_mc._parent._parent.printer.content._width / target_mc._parent._parent.printer.bg._width >= target_mc._parent._parent.printer.content._height / target_mc._parent._parent.printer.bg._height)
            {
                target_mc._parent._parent.printer.content._width = target_mc._parent._parent.printer.bg._width - 3;
                target_mc._parent._parent.printer.content._yscale = target_mc._parent._parent.printer.content._xscale;
                target_mc._parent._parent.printer.content._y = (target_mc._parent._parent.printer.bg._height - target_mc._parent._parent.printer.content._height) / 2;
                target_mc._parent._parent.printer.content._x = 1.500000;
            }
            else
            {
                target_mc._parent._parent.printer.content._height = target_mc._parent._parent.printer.bg._height - 3;
                target_mc._parent._parent.printer.content._xscale = target_mc._parent._parent.printer.content._yscale;
                target_mc._parent._parent.printer.content._x = (target_mc._parent._parent.printer.bg._width - target_mc._parent._parent.printer.content._width) / 2;
                target_mc._parent._parent.printer.content._y = 1.500000;
            } // end else if
            if (target_mc._parent._parent.allowPrint)
            {
                target_mc._parent._parent.allowPrint = false;
                getURL("print:#bmax", target_mc._parent._parent.printer);
            } // end if
        };
        printLoader.addListener(printListener);
        btn.onRollOver = function ()
        {
            _parent.onFocus.call();
            _parent.startPos = _parent.holder._xscale;
            _parent.startRot = _parent.holder._rotation;
            _parent.tcounter = 0;
            clearInterval(_parent.rOverID);
            _parent.rOverID = setInterval(_parent, "onROver", 30);
        };
        btn.onRollOut = function ()
        {
            _parent.onBlur.call();
            _parent.startPos = _parent.holder._xscale;
            _parent.startRot = _parent.holder._rotation;
            _parent.tcounter = 0;
            clearInterval(_parent.rOverID);
            _parent.rOverID = setInterval(_parent, "onROut", 30);
        };
        btn.onPress = function ()
        {
            _parent.onClick.call(_parent, _parent.content);
        };
        if (source != "")
        {
            this.load(source);
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
        _xscale = 100;
        _yscale = 100;
        holder._visible = false;
        ico._x = w / 2 - 10;
        ico._y = h / 2 - 10;
        preloader._y = Math.round(h / 2 - 2);
        preloader.bar._visible = false;
        preloader.bar._width = 0;
        preloader.prelTxt.text = "";
    } // End of the function
    function set Source(src)
    {
        ico._visible = true;
        source = src;
        this.invalidate();
        //return (this.Source());
        null;
    } // End of the function
    function set Mask(msk)
    {
        maskSource = msk;
        this.invalidate();
        //return (this.Mask());
        null;
    } // End of the function
    function set ScaleContent(sc)
    {
        scaleMode = sc;
        this.invalidate();
        //return (this.ScaleContent());
        null;
    } // End of the function
    function set ScaleButton(sb)
    {
        btnMode = sb;
        this.invalidate();
        //return (this.ScaleButton());
        null;
    } // End of the function
    function set ShowPreloader(view)
    {
        prelView = view;
        this.invalidate();
        //return (this.ShowPreloader());
        null;
    } // End of the function
    function set ShowPreloadText(view)
    {
        prelTextView = view;
        this.invalidate();
        //return (this.ShowPreloadText());
        null;
    } // End of the function
    function set PrelColor(color)
    {
        prelCol = new Color(preloader.bar);
        prelCol.setRGB(color);
        this.invalidate();
        //return (this.PrelColor());
        null;
    } // End of the function
    function set PrelTextColor(color)
    {
        prelTextColor = color;
        this.invalidate();
        //return (this.PrelTextColor());
        null;
    } // End of the function
    function set CompleteEffect(ce)
    {
        compEffect = ce;
        this.invalidate();
        //return (this.CompleteEffect());
        null;
    } // End of the function
    function set UnloadEffect(ue)
    {
        unloadEffect = ue;
        this.invalidate();
        //return (this.UnloadEffect());
        null;
    } // End of the function
    function set ROverEffect(roe)
    {
        rollOverEffect = roe;
        this.invalidate();
        //return (this.ROverEffect());
        null;
    } // End of the function
    function set ROverZoom(roz)
    {
        rollOverZoom = roz;
        if (rollOverZoom < 0)
        {
            rollOverZoom = 0;
        } // end if
        this.invalidate();
        //return (this.ROverZoom());
        null;
    } // End of the function
    function set EffectSpeed(es)
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
        //return (this.EffectSpeed());
        null;
    } // End of the function
    function set EffectStrength(es)
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
        //return (this.EffectStrength());
        null;
    } // End of the function
    function load(source)
    {
        this.source = source;
        if (completed)
        {
            reload = true;
            this.unload();
        }
        else
        {
            holder._visible = false;
            holder._x = 0;
            holder._y = 0;
            holder._xscale = 100;
            holder._yscale = 100;
            holder._rotation = 0;
            holder._alpha = 100;
            completed = false;
            tcounter = 0;
            btn.enabled = false;
            if (source != "" && source != undefined && source != null)
            {
                sourceArray = new Array();
                sourceArray = source.split(".");
                if (sourceArray.length > 1)
                {
                    local = false;
                }
                else
                {
                    local = true;
                } // end else if
                if (local)
                {
                    holder.attachMovie(this.source, "content", 0);
                    this.scaleContent();
                    switch (compEffect)
                    {
                        case "None":
                        {
                            holder._visible = true;
                            break;
                        } 
                        case "Fade in":
                        {
                            holder._alpha = 0;
                            holder._visible = true;
                            break;
                        } 
                        case "Zoom in":
                        case "Wobble in":
                        case "Rotate in":
                        {
                            holder._xscale = 0;
                            holder._yscale = 0;
                            holder._visible = true;
                            break;
                        } 
                    } // End of switch
                    clearInterval(effectID);
                    effectID = setInterval(this, "onCmp", 30);
                }
                else if (!local)
                {
                    holder.createEmptyMovieClip("content", 0);
                    mcLoader.loadClip(this.source, holder.content);
                } // end else if
            }
            else
            {
                onFailure.call();
            } // end else if
        } // end else if
    } // End of the function
    function unload()
    {
        if (!unloading)
        {
            clearInterval(rOverID);
            tcounter = 0;
            unloaded = false;
            clearInterval(effectID);
            effectID = setInterval(this, "onUnl", 30);
        } // end if
    } // End of the function
    function print()
    {
        allowPrint = true;
        if (completed && !unloading)
        {
            this.createEmptyMovieClip("printer", -10);
            printer._visible = false;
            printer.attachMovie("BJCLoaderBox", "bg", 0);
            printer.bg._width = 21;
            printer.bg._height = 30;
            if (local)
            {
                printer.attachMovie(source, "content", 10);
                if (printer.content._width / printer.bg._width >= printer.content._height / printer.bg._height)
                {
                    printer.content._width = printer.bg._width - 3;
                    printer.content._yscale = printer.content._xscale;
                    printer.content._y = (printer.bg._height - printer.content._height) / 2;
                    printer.content._x = 1.500000;
                }
                else
                {
                    printer.content._height = printer.bg._height - 3;
                    printer.content._xscale = printer.content._yscale;
                    printer.content._x = (printer.bg._width - printer.content._width) / 2;
                    printer.content._y = 1.500000;
                } // end else if
                if (allowPrint)
                {
                    allowPrint = false;
                    getURL("print:#bmax", printer);
                } // end if
            }
            else if (!local)
            {
                printer.createEmptyMovieClip("content", 10);
                printLoader.loadClip(source, printer.content);
            } // end if
        } // end else if
    } // End of the function
    function scaleContent()
    {
        holder.content.setMask(null);
        holder.setMask(null);
        switch (scaleMode)
        {
            case "No scale":
            {
                if (holder.content._width <= w && holder.content._height <= h)
                {
                    holder.content._x = -holder.content._width / 2;
                    holder.content._y = -holder.content._height / 2;
                }
                else if (holder.content._width / w >= holder.content._height / h)
                {
                    holder.content._width = w;
                    holder.content._yscale = holder.content._xscale;
                    holder.content._y = -holder.content._height / 2;
                    holder.content._x = -w / 2;
                }
                else
                {
                    holder.content._height = h;
                    holder.content._xscale = holder.content._yscale;
                    holder.content._x = -holder.content._width / 2;
                    holder.content._y = -h / 2;
                } // end else if
                break;
            } 
            case "Scale to fit":
            {
                if (holder.content._width / w >= holder.content._height / h)
                {
                    holder.content._width = w;
                    holder.content._yscale = holder.content._xscale;
                    holder.content._y = -holder.content._height / 2;
                    holder.content._x = -w / 2;
                }
                else
                {
                    holder.content._height = h;
                    holder.content._xscale = holder.content._yscale;
                    holder.content._x = -holder.content._width / 2;
                    holder.content._y = -h / 2;
                } // end else if
                break;
            } 
            case "Scale to fill":
            {
                if (holder.content._width / w <= holder.content._height / h)
                {
                    holder.content._width = w;
                    holder.content._yscale = holder.content._xscale;
                    holder.content._y = -holder.content._height / 2;
                    holder.content._x = -w / 2;
                }
                else
                {
                    holder.content._height = h;
                    holder.content._xscale = holder.content._yscale;
                    holder.content._x = -holder.content._width / 2;
                    holder.content._y = -h / 2;
                } // end else if
                holder.attachMovie("BJCLoaderBox", "contentMask", 100);
                holder.contentMask._x = -w / 2;
                holder.contentMask._y = -h / 2;
                holder.contentMask._width = w;
                holder.contentMask._height = h;
                holder.setMask(holder.contentMask);
                break;
            } 
            case "Stretch to fill":
            {
                holder.content._width = w;
                holder.content._height = h;
                holder.content._y = -h / 2;
                holder.content._x = -w / 2;
                break;
            } 
        } // End of switch
        holder._y = h / 2;
        holder._x = w / 2;
        btn._x = w / 2 - holder.content._width / 2;
        btn._y = h / 2 - holder.content._height / 2;
        btn._width = holder.content._width;
        btn._height = holder.content._height;
        if (maskSource != "")
        {
            holder.attachMovie(maskSource, "userMask", 200);
            mask = holder.userMask;
            if (scaleMode != "Scale to fill")
            {
                holder.userMask._x = holder.content._x;
                holder.userMask._y = holder.content._y;
                holder.userMask._width = holder.content._width;
                holder.userMask._height = holder.content._height;
                holder.setMask(holder.userMask);
            }
            else
            {
                holder.userMask._x = holder.contentMask._x;
                holder.userMask._y = holder.contentMask._y;
                holder.userMask._width = holder.contentMask._width;
                holder.userMask._height = holder.contentMask._height;
                holder.content.setMask(holder.userMask);
            } // end if
        } // end else if
    } // End of the function
    function onCmp()
    {
        completed = true;
        ++tcounter;
        holder._visible = true;
        switch (compEffect)
        {
            case "None":
            {
                completed = true;
                break;
            } 
            case "Fade in":
            {
                holder._alpha = this.easeInOut(tcounter, 0, 100, effectSpeed);
                break;
            } 
            case "Zoom in":
            {
                holder._xscale = this.easeInOut(tcounter, 0, 100, effectSpeed);
                holder._yscale = this.easeInOut(tcounter, 0, 100, effectSpeed);
                break;
            } 
            case "Wobble in":
            {
                holder._xscale = this.elasticOut(tcounter, 0, 100, effectSpeed, effectStrength, effectSpeed / 2);
                holder._yscale = this.elasticOut(tcounter, 0, 100, effectSpeed, effectStrength, effectSpeed / 2);
                break;
            } 
            case "Rotate in":
            {
                holder._xscale = this.easeInOut(tcounter, 0, 100, effectSpeed);
                holder._yscale = this.easeInOut(tcounter, 0, 100, effectSpeed);
                holder._rotation = this.easeInOut(tcounter, 0, 360, effectSpeed);
                break;
            } 
            case "Bounce in":
            {
                holder._xscale = this.bounceOut(tcounter, 0, 100, effectSpeed);
                holder._yscale = this.bounceOut(tcounter, 0, 100, effectSpeed);
                break;
            } 
        } // End of switch
        if (tcounter >= effectSpeed)
        {
            clearInterval(effectID);
            holder._rotation = 0;
            holder._visible = true;
            holder._alpha = 100;
            btn.enabled = true;
        } // end if
    } // End of the function
    function onUnl()
    {
        unloading = true;
        btn.enabled = false;
        ++tcounter;
        switch (unloadEffect)
        {
            case "None":
            {
                unloaded = true;
                break;
            } 
            case "Fade out":
            {
                holder._alpha = this.easeInOut(tcounter, holder._alpha, -holder._alpha, effectSpeed);
                break;
            } 
            case "Zoom out":
            {
                holder._xscale = this.easeInOut(tcounter, holder._xscale, -holder._xscale, effectSpeed);
                holder._yscale = this.easeInOut(tcounter, holder._yscale, -holder._yscale, effectSpeed);
                break;
            } 
            case "Wobble out":
            {
                holder._xscale = this.elasticOut(tcounter, holder._xscale, -holder._xscale, effectSpeed, effectStrength, effectSpeed / 2);
                holder._yscale = this.elasticOut(tcounter, holder._yscale, -holder._yscale, effectSpeed, effectStrength, effectSpeed / 2);
                break;
            } 
            case "Rotate out":
            {
                holder._xscale = this.easeInOut(tcounter, holder._xscale, -holder._xscale, effectSpeed);
                holder._yscale = this.easeInOut(tcounter, holder._yscale, -holder._yscale, effectSpeed);
                holder._rotation = this.easeInOut(tcounter, 0, -360, effectSpeed);
                break;
            } 
            case "Bounce out":
            {
                holder._xscale = this.bounceOut(tcounter, holder._xscale, -holder._xscale, effectSpeed);
                holder._yscale = this.bounceOut(tcounter, holder._yscale, -holder._yscale, effectSpeed);
                break;
            } 
        } // End of switch
        if (tcounter >= effectSpeed)
        {
            unloaded = true;
        } // end if
        if (unloaded)
        {
            unloading = false;
            completed = false;
            clearInterval(effectID);
            holder._visible = false;
            holder._alpha = 100;
            holder._rotation = 0;
            holder._x = 0;
            holder._y = 0;
            holder.content.removeMovieClip();
            if (reload)
            {
                reload = false;
                this.load(source);
            } // end if
        } // end if
    } // End of the function
    function onROver()
    {
        if (btnMode)
        {
            btn._x = w / 2 - holder.content._width / 2 * rollOverZoom / 100;
            btn._y = h / 2 - holder.content._height / 2 * rollOverZoom / 100;
            btn._width = holder.content._width * rollOverZoom / 100;
            btn._height = holder.content._height * rollOverZoom / 100;
        } // end if
        ++tcounter;
        switch (rollOverEffect)
        {
            case "None":
            {
                holder._xscale = rollOverZoom;
                holder._yscale = rollOverZoom;
                clearInterval(rOverID);
                break;
            } 
            case "Eased":
            {
                holder._xscale = this.easeInOut(tcounter, startPos, rollOverZoom - startPos, effectSpeed);
                holder._yscale = this.easeInOut(tcounter, startPos, rollOverZoom - startPos, effectSpeed);
                break;
            } 
            case "Wobble":
            {
                holder._xscale = this.elasticOut(tcounter, startPos, rollOverZoom - startPos, effectSpeed, effectStrength, effectSpeed / 2);
                holder._yscale = this.elasticOut(tcounter, startPos, rollOverZoom - startPos, effectSpeed, effectStrength, effectSpeed / 2);
                break;
            } 
            case "Rotate":
            {
                holder._xscale = this.easeInOut(tcounter, startPos, rollOverZoom - startPos, effectSpeed);
                holder._yscale = this.easeInOut(tcounter, startPos, rollOverZoom - startPos, effectSpeed);
                if (startRot >= 0)
                {
                    holder._rotation = this.easeInOut(tcounter, startRot, 360 - startRot, effectSpeed);
                }
                else
                {
                    holder._rotation = this.easeInOut(tcounter, startRot, -startRot, effectSpeed);
                } // end else if
                break;
            } 
            case "Bounce":
            {
                holder._xscale = this.bounceOut(tcounter, startPos, rollOverZoom - startPos, effectSpeed);
                holder._yscale = this.bounceOut(tcounter, startPos, rollOverZoom - startPos, effectSpeed);
                break;
            } 
        } // End of switch
        if (tcounter >= effectSpeed)
        {
            clearInterval(rOverID);
        } // end if
    } // End of the function
    function onROut()
    {
        if (btnMode)
        {
            btn._x = w / 2 - holder.content._width / 2;
            btn._y = h / 2 - holder.content._height / 2;
            btn._width = holder.content._width;
            btn._height = holder.content._height;
        } // end if
        ++tcounter;
        switch (rollOverEffect)
        {
            case "None":
            {
                holder._xscale = 100;
                holder._yscale = 100;
                clearInterval(rOverID);
                break;
            } 
            case "Eased":
            {
                holder._xscale = this.easeInOut(tcounter, startPos, 100 - startPos, effectSpeed);
                holder._yscale = this.easeInOut(tcounter, startPos, 100 - startPos, effectSpeed);
                break;
            } 
            case "Wobble":
            {
                holder._xscale = this.elasticOut(tcounter, startPos, 100 - startPos, effectSpeed, effectStrength, effectSpeed / 2);
                holder._yscale = this.elasticOut(tcounter, startPos, 100 - startPos, effectSpeed, effectStrength, effectSpeed / 2);
                break;
            } 
            case "Rotate":
            {
                holder._xscale = this.easeInOut(tcounter, startPos, 100 - startPos, effectSpeed);
                holder._yscale = this.easeInOut(tcounter, startPos, 100 - startPos, effectSpeed);
                if (startRot > 0)
                {
                    holder._rotation = this.easeInOut(tcounter, startRot, -startRot, effectSpeed);
                }
                else
                {
                    holder._rotation = this.easeInOut(tcounter, startRot, -360 - startRot, effectSpeed);
                } // end else if
                break;
            } 
            case "Bounce":
            {
                holder._xscale = this.bounceOut(tcounter, startPos, 100 - startPos, effectSpeed);
                holder._yscale = this.bounceOut(tcounter, startPos, 100 - startPos, effectSpeed);
                break;
            } 
        } // End of switch
        if (tcounter >= effectSpeed)
        {
            tcounter = 0;
            clearInterval(rOverID);
        } // end if
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
    var className = "BJCAdvLoader";
    static var symbolOwner = com.bjc.loader.BJCAdvLoader;
    static var symbolName = "BJCAdvLoader";
    var version = "1.0.0.0";
} // End of Class
