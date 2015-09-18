/**
 * Created by Yuxin on 2015/9/18.
 */
var test = (function () {
    function test() {
    }
    test.prototype.run = function () {
        Console.log("JS中的ConsoleLog");
        return "test.js中的run函数";
    };
    return test;
})();
