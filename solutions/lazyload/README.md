# lazyload

[lazyload](https://github.com/verlok/lazyload) 无依赖，支持iframe，5kb compressed。

```html
<img data-original="http://...jpg"/>
<iframe data-original="http://...html"/>
<script>
    new LazyLoad({
        elements_selector: "img,iframe",
        show_while_loading: true,
    });
</script>
```