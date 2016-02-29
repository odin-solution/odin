# Animate

### JavaScript 控制库

JS 动画库可使用 [velocity.js](https://github.com/julianshapiro/velocity)，具有类似于 jQuery.animate 的 API，但可以不依赖 JQuery 或 Zepto，如

```javascript
var $harmmer = document.querySelector('.harmmer');
new Promise(function(resolve) {
    Velocity($harmmer, {
        left: 100,
        top: 150
    },1e3,resolve);
}).then(function(){
    return new Promise(function(resolve){
        Velocity($harmmer, {
            rotateZ: -45
        }, 1500,resolve);
    });
}).then(function(){
    return new Promise(function(resolve){
        Velocity($harmmer, {
            'backgroundColor': '#f6f656'
        }, 1e3,resolve);
    });
}).then(function(){
    return new Promise(function(resolve){
        Velocity($harmmer, {
            left: -200
        }, 1e3,resolve);
    });
});
```

支持的属性：

 - opacity
 - width
 - height
 - minWidth
 - minHeight
 - maxWidth
 - maxHeight
 - paddingTop
 - paddingRight
 - paddingBottom
 - paddingLeft
 - top
 - right
 - bottom
 - left
 - marginTop
 - marginRight
 - marginBottom
 - marginLeft
 - borderTopWidth
 - borderRightWidth
 - borderBottomWidth
 - borderLeftWidth
 - borderRadius
 - outlineWidth
 - fontSize
 - lineHeight
 - letterSpacing
 - wordSpacing
 - color
 - colorRed
 - colorGreen
 - colorBlue
 - colorAlpha
 - backgroundColor
 - backgroundColorRed
 - backgroundColorGreen
 - backgroundColorBlue
 - backgroundColorAlpha
 - borderColor
 - borderColorRed
 - borderColorGreen
 - borderColorBlue
 - borderColorAlpha
 - outlineColor
 - outlineColorRed
 - outlineColorGreen
 - outlineColorBlue
 - outlineColorAlpha
 - backgroundPositionX
 - backgroundPositionY
 - textShadowX
 - textShadowY
 - textShadowBlur
 - boxShadowX
 - boxShadowY
 - boxShadowBlur
 - boxShadowSpread
 - translateX
 - translateY
 - translateZ
 - scale
 - scaleX
 - scaleY
 - scaleZ
 - rotateX
 - rotateY
 - rotateZ
 - skewX
 - skewY
 - transformPerspective
 - perspective
 - perspectiveOriginX
 - perspectiveOriginY
 - transformOriginX
 - transformOriginY
 - transformOriginZ
 - clipTop
 - clipRight
 - clipBottom
 - clipLeft
 - blur

### CSS 动画效果

[animate.css](https://github.com/daneden/animate.css) 封装了一些常用的动画效果，可对 DOM 元素进行一些定性的动画设置，如

```javascript
var $harmmer = $('.harmmer');
var evts = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
new Promise(function (resolve) {
    $harmmer.one(evts, function(){
        $harmmer.removeClass('slideInDown');
        resolve();
    }).addClass('slideInDown');
}).then(function(){
    return new Promise(function (resolve) {
        $harmmer.one(evts, function(){
            $harmmer.removeClass('swing');
            resolve();
        }).addClass('swing');
    });
}).then(function(){
    return new Promise(function (resolve) {
        $harmmer.one(evts, function(){
            $harmmer.removeClass('wobble');
            resolve();
        }).addClass('wobble');
    });
});
```

支持的效果有：

 - bounce
 - flash
 - pulse
 - rubberBand
 - shake
 - swing
 - tada
 - wobble
 - jello
 - bounceIn
 - bounceInDown
 - bounceInLeft
 - bounceInRight
 - bounceInUp
 - bounceOut
 - bounceOutDown
 - bounceOutLeft
 - bounceOutRight
 - bounceOutUp
 - fadeIn
 - fadeInDown
 - fadeInDownBig
 - fadeInLeft
 - fadeInLeftBig
 - fadeInRight
 - fadeInRightBig
 - fadeInUp
 - fadeInUpBig
 - fadeOut
 - fadeOutDown
 - fadeOutDownBig
 - fadeOutLeft
 - fadeOutLeftBig
 - fadeOutRight
 - fadeOutRightBig
 - fadeOutUp
 - fadeOutUpBig
 - flip
 - flipInX
 - flipInY
 - flipOutX
 - flipOutY
 - lightSpeedIn
 - lightSpeedOut
 - rotateIn
 - rotateInDownLeft
 - rotateInDownRight
 - rotateInUpLeft
 - rotateInUpRight
 - rotateOut
 - rotateOutDownLeft
 - rotateOutDownRight
 - rotateOutUpLeft
 - rotateOutUpRight
 - slideInUp
 - slideInDown
 - slideInLeft
 - slideInRight
 - slideOutUp
 - slideOutDown
 - slideOutLeft
 - slideOutRight
 - zoomIn
 - zoomInDown
 - zoomInLeft
 - zoomInRight
 - zoomInUp
 - zoomOut
 - zoomOutDown
 - zoomOutLeft
 - zoomOutRight
 - zoomOutUp
 - hinge
 - rollIn
 - rollOut