# date format

[moment.js](https://github.com/moment/moment/) 41kb.

<http://momentjs.com/docs/#/displaying/>

```html
<script>
    moment().format('YYYY-MM-DD HH:mm:ss');// 2016-03-03 17:02:30
    moment('2016-03-03 17:02:30', 'YYYY-MM-DD HH:mm:ss')._d //Date
</script>
```