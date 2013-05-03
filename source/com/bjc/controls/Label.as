class com.bjc.controls.Label extends com.bjc.core.LabelWrapper
{
    var __tf, __set__text, __get__text, __get__textHeight;
    function Label(Void)
    {
        super();
    } // End of the function
    function init(Void)
    {
        super.init();
        this.__tf.selectable = false;
        this.draw();
    } // End of the function
    function createChildren(Void)
    {
        var _loc1 = this;
        _loc1.createTextField("tf", 0, 0, 0, 100, 22);
        _loc1.__tf = _loc1.tf;
    } // End of the function
    function draw(Void)
    {
        var _loc1 = this;
        _loc1.__format = new TextFormat(_loc1.__fontFace, _loc1.__fontSize, _loc1.__fontColor);
        _loc1.__format.align = _loc1.__align;
        if (!_loc1.__enabled)
        {
            _loc1.__format.color = _loc1.__disabledColor;
        } // end if
        if (!_global.isLivePreview)
        {
            _loc1.__tf.embedFonts = _loc1.__embedFont;
        } // end if
        if (_loc1.__html)
        {
            _loc1.__tf.html = true;
            _loc1.__tf.htmlText = _loc1.__text;
        }
        else
        {
            _loc1.__tf.html = false;
            _loc1.__tf.text = _loc1.__text;
        } // end else if
        _loc1.__tf.setTextFormat(_loc1.__format);
        _loc1.__tf.setNewTextFormat(_loc1.__format);
        _loc1.size();
    } // End of the function
    function size(Void)
    {
        var _loc1 = this;
        _loc1.__tf._width = _loc1.__width;
        _loc1.__tf._height = _loc1.__tf.textHeight + 4;
        _loc1.__tf._y = Math.round(_loc1.__height / 2 - _loc1.__tf._height / 2);
    } // End of the function
    static function create(target, id, depth, initObj)
    {
        return (target.attachMovie("Label", id, depth, initObj));
    } // End of the function
    function set text(txt)
    {
        var _loc1 = this;
        _loc1.__text = txt;
        _loc1.draw();
        //return (_loc1.text());
    } // End of the function
    function get text()
    {
        return (this.__text);
    } // End of the function
    function get textHeight()
    {
        return (this.__tf.textHeight);
    } // End of the function
    var clipParameters = {text: 1};
    static var mergedClipParameters = com.bjc.core.BJCComponent.mergeClipParameters(com.bjc.controls.Label.prototype.clipParameters, com.bjc.core.LabelWrapper.prototype.clipParameters);
    var __text = "";
} // End of Class
