/*
jQWidgets v4.5.1 (2017-April)
Copyright (c) 2011-2017 jQWidgets.
License: http://jqwidgets.com/license/
*/
!function(a){a.jqx.jqxWidget("jqxSwitchButton","",{}),a.extend(a.jqx._jqxSwitchButton.prototype,{defineInstance:function(){var b={disabled:!1,checked:!1,onLabel:"On",offLabel:"Off",toggleMode:"default",animationDuration:250,width:90,height:30,animationEnabled:!0,thumbSize:"40%",orientation:"horizontal",switchRatio:"50%",metroMode:!1,_isMouseDown:!1,rtl:!1,_dimensions:{horizontal:{size:"width",opSize:"height",oSize:"outerWidth",opOSize:"outerHeight",pos:"left",oPos:"top",opposite:"vertical"},vertical:{size:"height",opSize:"width",oSize:"outerHeight",opOSize:"outerWidth",pos:"top",oPos:"left",opposite:"horizontal"}},_touchEvents:{mousedown:"touchstart",click:"touchend",mouseup:"touchend",mousemove:"touchmove",mouseenter:"mouseenter",mouseleave:"mouseleave"},_borders:{},_isTouchDevice:!1,_distanceRequired:3,_isDistanceTraveled:!1,_thumb:void 0,_onLabel:void 0,_offLabel:void 0,_wrapper:void 0,_animationActive:!1,aria:{"aria-checked":{name:"checked",type:"boolean"},"aria-disabled":{name:"disabled",type:"boolean"}},_events:["checked","unchecked","change"]};return this===a.jqx._jqxSwitchButton.prototype?b:(a.extend(!0,this,b),b)},createInstance:function(b){if(this._createFromInput(),this.element.nodeName&&("INPUT"==this.element.nodeName||"BUTTON"==this.element.nodeName))throw"jqxSwitchButton can be rendered only from a DIV tag.";this.host.attr("role","checkbox"),a.jqx.aria(this),this.render();var c=this;c.element.tabIndex||c.host.attr("tabindex",0),a.jqx.utilities.resize(this.host,function(){c.element.innerHTML="",c.render()})},_createFromInput:function(){var b=this;if("input"==b.element.nodeName.toLowerCase()){b.field=b.element,b.field.className&&(b._className=b.field.className);var c={title:b.field.title};b.field.value&&(c.value=b.field.value),b.field.checked&&(c.checked=!0),b.field.id.length?c.id=b.field.id.replace(/[^\w]/g,"_")+"_jqxSwitchButton":c.id=a.jqx.utilities.createId()+"_jqxSwitchButton";var d=a("<div></div>",c);d[0].style.cssText=b.field.style.cssText,b.width||(b.width=a(b.field).width()),b.height||(b.height=a(b.field).outerHeight()),a(b.field).hide().after(d);var e=b.host.data();if(b.host=d,b.host.data(e),b.element=d[0],b.element.id=b.field.id,b.field.id=c.id,b._className&&(b.host.addClass(b._className),a(b.field).removeClass(b._className)),b.field.tabIndex){var f=b.field.tabIndex;b.field.tabIndex=-1,b.element.tabIndex=f}}},resize:function(a,b){this.width=a,this.height=b,this.render()},render:function(){this.innerHTML="",!this.theme||""==this.theme||this.theme.indexOf("metro")==-1&&this.theme.indexOf("windowsphone")==-1&&this.theme.indexOf("office")==-1||("40%"==this.thumbSize&&(this.thumbSize=12),this.metroMode=!0);var b=a.data(document.body,"jqx-switchbutton")||1;this._idHandler(b),a.data(document.body,"jqx-draggables",++b),this._isTouchDevice=a.jqx.mobile.isTouchDevice(),this.switchRatio=parseInt(this.switchRatio,10),this._render(),this._addClasses(),this._performLayout(),this._removeEventHandlers(),this._addEventHandles(),this._disableSelection();this.checked||this._switchButton(!1,0,!0),this.disabled&&(this.element.disabled=!0)},setOnLabel:function(a){this._onLabel.html('<div style="display: inline-block;">'+a+"</div>"),this._centerLabels()},setOffLabel:function(a){this._offLabel.html('<div style="display: inline-block;">'+a+"</div>"),this._centerLabels()},toggle:function(){this.checked?this.uncheck():this.check()},val:function(a){return 0==arguments.length||null!=a&&"object"==typeof a?this.checked:("string"==typeof a?("true"==a&&this.check(),"false"==a&&this.uncheck(),""==a&&this.indeterminate()):(1==a&&this.check(),0==a&&this.uncheck(),null==a&&this.indeterminate()),this.checked)},uncheck:function(){this._switchButton(!1),a.jqx.aria(this,"aria-checked",this.checked)},check:function(){this._switchButton(!0),a.jqx.aria(this,"aria-checked",this.checked)},_idHandler:function(a){if(!this.element.id){var b="jqx-switchbutton-"+a;this.element.id=b}},_dir:function(a){return this._dimensions[this.orientation][a]},_getEvent:function(b){if(this._isTouchDevice){var c=this._touchEvents[b];return a.jqx.mobile.getTouchEventName(c)}return b},_render:function(){this._thumb=a("<div/>"),this._onLabel=a("<div/>"),this._offLabel=a("<div/>"),this._wrapper=a("<div/>"),this._onLabel.appendTo(this.host),this._thumb.appendTo(this.host),this._offLabel.appendTo(this.host),this.host.wrapInner(this._wrapper),this._wrapper=this.host.children(),this.setOnLabel(this.onLabel),this.setOffLabel(this.offLabel)},_addClasses:function(){var a=this._thumb,b=this._onLabel,c=this._offLabel;this.host.addClass(this.toThemeProperty("jqx-switchbutton")),this.host.addClass(this.toThemeProperty("jqx-widget")),this.host.addClass(this.toThemeProperty("jqx-widget-content")),this._wrapper.addClass(this.toThemeProperty("jqx-switchbutton-wrapper")),a.addClass(this.toThemeProperty("jqx-fill-state-normal")),a.addClass(this.toThemeProperty("jqx-switchbutton-thumb")),b.addClass(this.toThemeProperty("jqx-switchbutton-label-on")),b.addClass(this.toThemeProperty("jqx-switchbutton-label")),c.addClass(this.toThemeProperty("jqx-switchbutton-label-off")),c.addClass(this.toThemeProperty("jqx-switchbutton-label")),this.checked?this.host.addClass(this.toThemeProperty("jqx-switchbutton-on")):this.host.removeClass(this.toThemeProperty("jqx-switchbutton-on"))},_performLayout:function(){var a,b=this.host,c=this._dir("opSize"),d=this._dir("size"),e=this._wrapper;if(b.css({width:this.width,height:this.height}),e.css(c,b[c]()),this._thumbLayout(),this._labelsLayout(),a=this._borders[this._dir("opposite")],e.css(d,b[d]()+this._offLabel[this._dir("oSize")]()+a),e.css(c,b[c]()),this.metroMode||this.theme&&""!=this.theme&&(this.theme.indexOf("metro")!=-1||this.theme.indexOf("office")!=-1)){var f=(this._thumb,this._onLabel),g=this._offLabel;f.css("position","relative"),f.css("top","1px"),f.css("margin-left","1px"),g.css("position","relative"),g.css("top","1px"),g.css("left","-2px"),g.css("margin-right","1px"),g.height(f.height()-2),g.width(f.width()-3),f.height(f.height()-2),f.width(f.width()-3),this._thumb[this._dir("size")](this.thumbSize+3),this._thumb.css("top","-1px"),this._thumb[this._dir("opSize")](b[this._dir("opSize")]()+2),this._thumb.css("position","relative"),this.host.css("overflow","hidden"),this.checked?(this._onLabel.css("visibility","visible"),this._offLabel.css("visibility","hidden"),this._thumb.css("left","0px")):(this._onLabel.css("visibility","hidden"),this._offLabel.css("visibility","visible"),this._thumb.css("left","-2px"))}},_thumbLayout:function(){var a=this.thumbSize,b=this.host;a.toString().indexOf("%")>=0&&(a=b[this._dir("size")]()*parseInt(a,10)/100),this._thumb[this._dir("size")](a),this._thumb[this._dir("opSize")](b[this._dir("opSize")]()),this._handleThumbBorders()},_handleThumbBorders:function(){this._borders.horizontal=parseInt(this._thumb.css("border-left-width"),10)||0,this._borders.horizontal+=parseInt(this._thumb.css("border-right-width"),10)||0,this._borders.vertical=parseInt(this._thumb.css("border-top-width"),10)||0,this._borders.vertical+=parseInt(this._thumb.css("border-bottom-width"),10)||0;var a=this._borders[this._dir("opposite")];"horizontal"===this.orientation?(this._thumb.css("margin-top",-a/2),this._thumb.css("margin-left",0)):(this._thumb.css("margin-left",-a/2),this._thumb.css("margin-top",0))},_labelsLayout:function(){var a=this.host,b=this._thumb,c=this._dir("opSize"),d=this._dir("size"),e=this._dir("oSize"),f=a[d]()-b[e](),g=this._borders[this._dir("opposite")]/2;this._onLabel[d](f+g),this._offLabel[d](f+g),this.rtl&&this._onLabel[d](f+2*g),this._onLabel[c](a[c]()),this._offLabel[c](a[c]()),this._orderLabels(),this._centerLabels()},_orderLabels:function(){if("horizontal"===this.orientation){var a="left";this.rtl&&(a="right"),this._onLabel.css("float",a),this._thumb.css("float",a),this._offLabel.css("float",a)}else this._onLabel.css("display","block"),this._offLabel.css("display","block")},_centerLabels:function(){var a=this._onLabel.children("div"),b=this._offLabel.children("div"),c=a.parent(),d=c.height(),e=a.outerHeight(),f=this._borders[this.orientation]/2||0;0==e&&(e=14);var g=Math.floor((d-e)/2)+f;a.css("margin-top",g),b.css("margin-top",g)},_removeEventHandlers:function(){var b="."+this.element.id;this.removeHandler(this._wrapper,this._getEvent("click")+b,this._clickHandle),this.removeHandler(this._thumb,this._getEvent("mousedown")+b,this._mouseDown),this.removeHandler(a(document),this._getEvent("mouseup")+b,this._mouseUp),this.removeHandler(a(document),this._getEvent("mousemove")+b,this._mouseMove),this.removeHandler(this._thumb,"mouseenter"+b),this.removeHandler(this._thumb,"mouseleave"+b),this.removeHandler(this._wrapper,"focus"+b),this.removeHandler(this._wrapper,"blur"+b)},_addEventHandles:function(){var b="."+this.element.id,c=this;this.addHandler(this.host,"focus"+b,function(a){return c.host.addClass(c.toThemeProperty("jqx-fill-state-focus")),!1}),this.addHandler(this.host,"blur"+b,function(){c.host.removeClass(c.toThemeProperty("jqx-fill-state-focus"))}),this.addHandler(this._thumb,"mouseenter"+b,function(){c._thumb.addClass(c.toThemeProperty("jqx-fill-state-hover"))}),this.addHandler(this._thumb,"mouseleave"+b,function(){c._thumb.removeClass(c.toThemeProperty("jqx-fill-state-hover"))}),this.addHandler(this._wrapper,this._getEvent("click")+b,this._clickHandle,{self:this}),this.addHandler(this._thumb,this._getEvent("mousedown")+b,this._mouseDown,{self:this}),this.addHandler(a(document),this._getEvent("mouseup")+b,this._mouseUp,{self:this}),this.addHandler(a(document),this._getEvent("mousemove")+b,this._mouseMove,{self:this})},enable:function(){this.disabled=!1,this.element.disabled=!1,a.jqx.aria(this,"aria-disabled",this.disabled)},disable:function(){this.disabled=!0,this.element.disabled=!0,a.jqx.aria(this,"aria-disabled",this.disabled)},_clickHandle:function(a){var b=a.data.self;"click"!==b.toggleMode&&"default"!==b.toggleMode||b.disabled||b._isDistanceTraveled||b._dragged||(b._wrapper.stop(),b.toggle()),b._thumb.removeClass(b.toThemeProperty("jqx-fill-state-pressed"))},_mouseDown:function(a){var b=a.data.self,c=b._wrapper;b.metroMode&&(b.host.css("overflow","hidden"),b._onLabel.css("visibility","visible"),b._offLabel.css("visibility","visible")),b._mouseStartPosition=b._getMouseCoordinates(a),b._buttonStartPosition={left:parseInt(c.css("margin-left"),10)||0,top:parseInt(c.css("margin-top"),10)||0},b.disabled||"slide"!==b.toggleMode&&"default"!==b.toggleMode||(b._wrapper.stop(),b._isMouseDown=!0,b._isDistanceTraveled=!1,b._dragged=!1),b._thumb.addClass(b.toThemeProperty("jqx-fill-state-pressed"))},_mouseUp:function(a){var b=a.data.self;if(b.metroMode,b._isMouseDown=!1,b._thumb.removeClass(b.toThemeProperty("jqx-fill-state-pressed")),b._isDistanceTraveled){var c=b._wrapper,d=parseInt(c.css("margin-"+b._dir("pos")),10)||0,e=b._dropHandler(d);e?b._switchButton(!b.checked):b._switchButton(b.checked,null,!0),b._isDistanceTraveled=!1}},_mouseMove:function(a){var b=a.data.self,c=b._getMouseCoordinates(a);if(b._isMouseDown&&b._distanceTraveled(c)){var d=b._dir("pos"),e=b._wrapper,f=b._buttonStartPosition[d],g=f+c[d]-b._mouseStartPosition[d],g=b._validatePosition(g);return b._dragged=!0,e.css("margin-"+b._dir("pos"),g),b._onLabel.css("visibility","visible"),b._offLabel.css("visibility","visible"),!1}},_distanceTraveled:function(a){if(this._isDistanceTraveled)return!0;if(this._isMouseDown){var b=this._mouseStartPosition,c=this._distanceRequired;return this._isDistanceTraveled=Math.abs(a.left-b.left)>=c||Math.abs(a.top-b.top)>=c,this._isDistanceTraveled}return!1},_validatePosition:function(a){var b=this._borders[this._dir("opposite")],c=0,d=-(this.host[this._dir("size")]()-this._thumb[this._dir("oSize")]())-b;return c<a?c:d>a?d:a},_dropHandler:function(a){var b=0,c=-(this.host[this._dir("size")]()-this._thumb[this._dir("oSize")]()),d=Math.abs(c-b),e=Math.abs(a-this._buttonStartPosition[this._dir("pos")]),f=d*(this.switchRatio/100);return e>=f},_switchButton:function(a,b,c){this.metroMode?(this.host.css("overflow","hidden"),this._onLabel.css("visibility","visible"),this._offLabel.css("visibility","visible"),a?this._thumb.css("left","0px"):this._thumb.css("left","-2px")):(this._onLabel.css("visibility","visible"),this._offLabel.css("visibility","visible"));var d=this._wrapper,e=this,f={},g=this._borders[this._dir("opposite")],h=0;"undefined"==typeof b&&(b=this.animationEnabled?this.animationDuration:0),this.rtl?a?(h=this.host[this._dir("size")]()-this._thumb[this._dir("oSize")]()+g,this.metroMode&&(h+=5)):this.metroMode&&(h-=3):a||(h=this.host[this._dir("size")]()-this._thumb[this._dir("oSize")]()+g),f["margin-"+this._dir("pos")]=-h,a?e.host.addClass(e.toThemeProperty("jqx-switchbutton-on")):e.host.removeClass(e.toThemeProperty("jqx-switchbutton-on")),d.animate(f,b,function(){a?(e._onLabel.css("visibility","visible"),e._offLabel.css("visibility","hidden")):(e._onLabel.css("visibility","hidden"),e._offLabel.css("visibility","visible")),e.checked=a,c||e._handleEvent(!a)})},_handleEvent:function(a){a!==this.checked&&this._raiseEvent(2,{check:this.checked,checked:this.checked}),a?this._raiseEvent(0,{checked:this.checked}):this._raiseEvent(1,{checked:this.checked})},_disableSelection:function(){var b=this.host,c=b.find("*");a.each(c,function(b,c){c.onselectstart=function(){return!1},a(c).addClass("jqx-disableselect")})},_getMouseCoordinates:function(a){return this._isTouchDevice&&a.originalEvent.touches?{left:a.originalEvent.touches[0].pageX,top:a.originalEvent.touches[0].pageY}:{left:a.pageX,top:a.pageY}},destroy:function(){this._removeEventHandlers(),this.host.removeClass(this.toThemeProperty("jqx-switchbutton")),this._wrapper.remove()},_raiseEvent:function(b,c){var d=a.Event(this._events[b]);return d.args=c,this.host.trigger(d)},_themeChanger:function(b,c,d){if(b){"undefined"==typeof d&&(d=this.host);for(var e=d[0].className.split(" "),f=[],g=[],h=d.children(),i=0;i<e.length;i+=1)e[i].indexOf(b)>=0&&(f.push(e[i]),g.push(e[i].replace(b,c)));this._removeOldClasses(f,d),this._addNewClasses(g,d);for(var i=0;i<h.length;i+=1)this._themeChanger(b,c,a(h[i]))}},_removeOldClasses:function(a,b){for(var c=0;c<a.length;c+=1)b.removeClass(a[c])},_addNewClasses:function(a,b){for(var c=0;c<a.length;c+=1)b.addClass(a[c])},propertiesChangedHandler:function(a,b,c){c&&c.width&&c.height&&2==Object.keys(c).length&&(a._wrapper.css("margin-left","0px"),a._wrapper.css("margin-top","0px"),a._performLayout(),a._wrapper.css("left","0px"),a._wrapper.css("top","0px"),a._switchButton(this.checked,0,!0))},propertyChangedHandler:function(b,c,d,e){if(!(b.batchUpdate&&b.batchUpdate.width&&b.batchUpdate.height&&2==Object.keys(b.batchUpdate).length))switch(c){case"disabled":e?b.disable():b.enable();break;case"switchRatio":b.switchRatio=parseInt(b.switchRatio,10);break;case"checked":e?b.check():b.uncheck();break;case"onLabel":b.setOnLabel(e);break;case"offLabel":b.setOffLabel(e);break;case"theme":a.jqx.utilities.setTheme(d,e,b.host);break;case"width":case"height":case"thumbSize":case"orientation":b._wrapper.css("margin-left","0px"),b._wrapper.css("margin-top","0px"),b._performLayout(),b._wrapper.css("left","0px"),b._wrapper.css("top","0px"),b._switchButton(this.checked,0,!0)}}})}(jqxBaseFramework);

