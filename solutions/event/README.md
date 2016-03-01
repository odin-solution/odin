# event

[EventEmitter](https://github.com/Olical/EventEmitter),3KB compressed.

```javascript
var ee = new EventEmitter();

ee.on('foo', function () {
    console.log(arguments);// [1,2,3]
});

ee.emit('foo', 1, 2, 3);
```