# Font

## 字体

移动端上字体一般不显式指定 "font-family"，除非使用 `Web Fonts`。

文字大小取决于[页面缩放](https://github.com/yanni4night/odin-solution-viewport)等因素。如果存在 UE 图，则根据具体的 scale 方案来设置。

如定宽（UE 图宽） viewport 缩放至设备宽，则直接引用 UE 图的字体大小；

```html
<meta name="viewport" content="width=720,initial-scale=<%=720/screen.width%>,user-scalable=no">
<style>
    p {
        font-size: 14px;
    }
</style>
```

如 scale 固定为1，一般元素高度也直接来自于 UE 图，字体大小也按照同样的策略引用即可；

```html
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
<style>
    p {
        font-size: 14px;
    }
</style>
```

如使用 scale=1/dpr 布局，字体需要根据 dpr 来设置不同的 px 单位值，使用 rem 单位可能带来误差。

```html
<meta name="viewport" content="width=device-width,initial-scale=<%=1/dpr%>,user-scalable=no">
<style>
    p {
        font-size: 14px;
    }
    [data-dpr="2"] p {
        font-size: 28px;
    }
</style>
```

一般地，在 scale 为1时，字体大小为 14px 和 16px 是比较合适阅读的尺寸。字体大小小于 12px 被大多数浏览器所禁止。

## iconfont

对于大量小尺寸icon，使用 `iconfont` 比 `csssprite` 更灵活且更有效率。


`iconfont` 依赖 `Web Fonts` 的 [@fontface](https://drafts.csswg.org/css-fonts-3/#font-face-rule) 实现，主流浏览器甚至桌面上的IE6都支持，但在格式上不尽相同。

`iconfont` 生成步骤一般为：

 - 使用作图软件（AI、Sketch等）输出 svg 矢量图形文件；
 - 将 svg 矢量图形文件转换为 svg 字体文件；
 - 再由 svg 字体文件生成其它格式（eot、woff、woff2、ttf等）的字体文件

在第二步，可以同时生成用于 @fontface 使用的 css 文件。

例如如下字体图形文件：

![svgicon](svgicons/mrkr.svg)
![svgicon](svgicons/tiff.svg)

使用 [svgicons2svgfont](https://github.com/nfroidure/svgicons2svgfont) 工具转换为 [svg 字体文件](svgfonts/font.svg)。

接着便可以利用以下工具将 svg 转换为 ttf，再由 ttf 转换为 eot、woff、woff2等其它格式了。
 - [svg2ttf](https://github.com/fontello/svg2ttf)
 - [ttf2woff](https://github.com/fontello/ttf2woff)
 - [ttf2eot](https://github.com/fontello/ttf2eot)
 - [ttf2woff2](https://github.com/nfroidure/ttf2woff2)

如果使用 grunt、gulp 作为构建工具，则直接使用其插件会更方便一些：
 - [grunt-webfont](https://github.com/sapegin/grunt-webfont)
 - [gulp-iconfont](https://github.com/nfroidure/gulp-iconfont)

 ```html
<style type="text/css">
@font-face {
    font-family: "yup";
    src: url("./dist/yup.eot?1adb61bcea95ff967161a287a663a6ce");
    src: url("./dist/yup.eot?#iefix") format("embedded-opentype"),
         url("./dist/yup.woff2?1adb61bcea95ff967161a287a663a6ce") format("woff2"),
         url("./dist/yup.woff?1adb61bcea95ff967161a287a663a6ce") format("woff"),
         url("./dist/yup.ttf?1adb61bcea95ff967161a287a663a6ce") format("truetype"),
         url("./dist/yup.svg?1adb61bcea95ff967161a287a663a6ce#yup") format("svg");
    font-weight: normal;
    font-style: normal;
}

.icon {
    font-family: "yup";
}

/* Icons */

.icon_mrkr:before {
    content: "\f101";
}


.icon_tiff:before {
    content: "\f102";
}
<style>
<i class="icon icon_mrkr"></i>
<i class="icon icon_tiff"></i>
 ```

示例见[这里](./dist/yup.html)。