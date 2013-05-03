class com.bjc.core.LabelWrapper extends com.bjc.core.BJCComponent
{
    var __set__align, __get__align, __set__disableStyles, __get__disableStyles, __set__disabledColor, __get__disabledColor, __set__embedFont, __get__embedFont, __set__fontColor, __get__fontColor, __set__fontFace, __get__fontFace, __set__fontSize, __get__fontSize, __set__html, __get__html;
    function LabelWrapper(Void)
    {
        super();
    } // End of the function
    function init(Void)
    {
        super.init();
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
    function set disabledColor(c)
    {
        var _loc1 = this;
        _loc1.__disabledColor = c;
        _loc1.invalidate();
        //return (_loc1.disabledColor());
    } // End of the function
    function get disabledColor()
    {
        return (this.__disabledColor);
    } // End of the function
    function set disableStyles(b)
    {
        var _loc1 = this;
        _loc1.__disableStyles = b;
        _loc1.invalidate();
        //return (_loc1.disableStyles());
    } // End of the function
    function get disableStyles()
    {
        return (this.__disableStyles);
    } // End of the function
    function set embedFont(b)
    {
        var _loc1 = this;
        _loc1.__embedFont = b;
        _loc1.invalidate();
        //return (_loc1.embedFont());
    } // End of the function
    function get embedFont()
    {
        return (this.__embedFont);
    } // End of the function
    function set fontColor(col)
    {
        var _loc1 = this;
        _loc1.__fontColor = col;
        _loc1.invalidate();
        //return (_loc1.fontColor());
    } // End of the function
    function get fontColor()
    {
        return (this.__fontColor);
    } // End of the function
    function set fontFace(font)
    {
        var _loc1 = this;
        _loc1.__fontFace = font;
        _loc1.invalidate();
        //return (_loc1.fontFace());
    } // End of the function
    function get fontFace()
    {
        return (this.__fontFace);
    } // End of the function
    function set fontSize(size)
    {
        var _loc1 = this;
        _loc1.__fontSize = size;
        _loc1.invalidate();
        //return (_loc1.fontSize());
    } // End of the function
    function get fontSize()
    {
        return (this.__fontSize);
    } // End of the function
    function set html(b)
    {
        var _loc1 = this;
        _loc1.__html = b;
        _loc1.invalidate();
        //return (_loc1.html());
    } // End of the function
    function get html()
    {
        return (this.__html);
    } // End of the function
    var clipParameters = {align: 1, disableStyles: 1, embedFont: 1, fontColor: 1, fontFace: 1, fontSize: 1, html: 1};
    var __align = "left";
    var __disabledColor = 10066329;
    var __disableStyles = false;
    var __embedFont = false;
    var __fontColor = 3355443;
    var __fontFace = "_sans";
    var __fontSize = 12;
    var __html = false;
} // End of Class
