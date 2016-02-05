# viewport

移动端页面的 viewport 设置，主要在于 `<meta>` 标签的使用，如：

```html
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
```

一般地，我们都会禁止用户手动对页面进行缩放，因此 meta 的设置策略可简化为`width` 和 `scale` 的取值策略。

我们知道，在大部分设备上，CSS像素宽度并不等于物理像素，这个宽度即为 viewport 的宽度（以下简称“vw”），如 iPhone5 为 320px，iPhone6 为 375px，iPhone 6+ 为 414px。在移动设备上，可以通过 screen.width 或者 document.documentElement.clientWidth 获得，但后者需要先行设置 meta 标签后才能获取正确的值，否则一般为固定 980px。

vw 是可以改变的，影响因素为 width 和 scale。注意无论如何设置，screen.width  的值始终保持不变。最终 vw，即 document.documentElement.clientWidth 值的计算方式为：

```javascript
vw = MAX(screen.width / scale, width); ----------①
```

如何设置 width 和 scale 值关系到UE图的尺寸，最终展示效果等问题。


常见有以下三种设置方案。

## scale固定为1

由①式可知，vw 为 screen.width 与 width 的最大值。由于 screen.width 理论上无上限，因此我们也不可能取到一个合适的 width 值，保证 width > screen.width，因此 vw 不可能是定值，一般取“device-width”。

在实际的操作中，必须要使用百分比或者 `Flex` 等技术才能还原UE图的宽度比例，但是 ___宽高比___ 一定无法完美还原，同时还存在着UE图尺寸的单位换算问题，如px转换百分比等，非常麻烦。

```html
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<style type="text/css">
.target {
    width: 100%;
    height: 50px;
}
.half {
    width: 30%;
    height: 100%;
}
</style>
<div class="target">
    <div class="half"></div>
</div>
```

## width固定为UE图宽度

将 width 设置为UE图的尺寸，这样就能顺利地将UE图尺寸1：1转换过来。但是一旦 screen.width > width，那么页面有效内容的宽度就会小于屏幕宽，造成白边。显然地，我们可以设置一个合适的 scale 值，将有效内容缩放至屏幕宽：

```javascript
scale = screen.width / width;
```

__注意要将HTML元素的宽度属性强制设置为 width__。

实现代码可为：
```html
<script>
   (function() {
      var base = 720;
  
      var f = function() {
          var scale = screen.width / base;
          var meta = document.querySelector('meta[name="viewport"]');
          if (!meta) {
              meta = document.createElement('meta');
              document.head.insertBefore(meta, document.head.lastChild);
          }
          meta.setAttribute('name', 'viewport');
          meta.setAttribute('content', 'width=' + base + ', initial-scale=' + scale + ', minimum-scale=' + scale + ', maximum-scale=' + scale + ', user-scalable=no');
      }
      window.addEventListener('resize', f, false);
      window.addEventListener('pageshow',
      function(e) {
          if (e.persisted) {
              f();
          }
      },
      false);
      f();
  })();
</script>
<style type="text/css">
html {
    width: 750px; !important;
}
.target {
    width: 750px;
    height: 50px;
}
.half {
    width: 375px;
    height: 100%;
}
</style>
<div class="target">
    <div class="half"></div>
</div>
```

## rem

还有一种设置 scale 的方案，即:

```javascript
scale = 1 / dpr;
```

这样可以针对高DPI的屏幕，实现1物理像素的线条以及合适的响应式图片。比如对于 dpr=2 的设备，0.5px 即为1物理像素，100×100 的图片可以刚好在 50×50 的位置上高清呈现，不会损失细节。

那么 width 如何设置呢？根据①式，

```javascript
vw = MAX(screen.width * dpr, width)
```

因此无法保证 width > screen * dpr，索性使 width = screen.width * dpr，即“device-width” 的取值。与第一种方案一样，UE 图尺寸比例和单位转换成了问题。这里可以使用动态 html[font-size] 以及 rem 方案来还原UE图元素的尺寸比例，使用 LESS 预处理来将 UE 尺寸换算为 rem 值。如：

```html
<style type="text/less">
.px2rem(@var, @px) {
    @{var}: @px / 75px;
}
</style>
<style type="text/css">
html {
    font-size: 75px;
}
.target {
    .px2rem(width;375);
    .px2rem(height;375);
}
</style>
```

对于一张宽度 750px 的 UE 图，宽为二分之一的元素宽度为 375px，换算后为 5rem。
在 iPhone5 上，设置 html[font-size] 为 75 * 320 / 375 = 64px，vw 为 320 / 0.5 = 640px，5rem 也刚好为 vw 的二分之一。因此可以还原UE图尺寸。

但是注意使用 rem 会遇到无限小数导致误差。

该方案实现见[flexible-viewport](https://github.com/yanni4night/flexible-viewport)。

## 总结

|方案|UE等比|px精确控制|1px线条|高清图片|
|----|----|----|----|----|
|scale固定为1|✘|✔|✘|✘|
|width固定为UE图宽度|✔|✔|✘|✘|
|rem|✔|✘|✔|✔|

第一种方案无法保证还原 UE 图并在不同屏幕上有一样的展示效果，但其展示效果是合理的，并且技术最简单；第二种能够对于 UE 拥有完美比例的还原，但由于 UE 一般是竖屏的，因此往往在横屏模式下效果不尽人意；第三种能够实现1物理像素和何时的高清图片，但 rem 会引入一定的误差，也无法处理字体的大小，同时开发一般需要 CSS 预处理器进行单位转换，比较复杂。

因此并没有万能的方案，根据实际的需求去选择合适的方案。