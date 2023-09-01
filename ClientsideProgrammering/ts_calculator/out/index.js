"use strict";
var Calculator = /** @class */ (function () {
    function Calculator() {
        var _this = this;
        this.keys = [["Clear", "Undo", "", "/"],
            ["7", "8", "9", "*"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "+"],
            [".", "0", "", "="]
        ];
        this.cachedVal = "";
        this.display = "";
        this.keysElement = document.getElementById("keys");
        var _loop_1 = function (i) {
            var _loop_2 = function (j) {
                var btn = document.createElement("button");
                btn.textContent = this_1.keys[i][j].toString();
                btn.addEventListener("click", function () { return _this.calculate(_this.keys[i][j]); });
                btn.classList.add("key");
                this_1.keysElement.appendChild(btn);
            };
            for (var j = 0; j < this_1.keys[i].length; j++) {
                _loop_2(j);
            }
        };
        var this_1 = this;
        for (var i = 0; i < this.keys.length; i++) {
            _loop_1(i);
        }
    }
    Calculator.prototype.calculate = function (val, pasteVal) {
        if (pasteVal === void 0) { pasteVal = false; }
        if (val == "=") {
            this.cachedVal = eval(this.cachedVal).toString();
        }
        else if (val == "Clear") {
            this.cachedVal = "";
        }
        else if (val == "Undo") {
            this.cachedVal = this.cachedVal.slice(0, this.cachedVal.length - 1);
        }
        else if (pasteVal == false) {
            this.cachedVal += val;
        }
        if (pasteVal == true) {
            this.cachedVal = val;
        }
        this.display = this.cachedVal;
        var displayElement = document.getElementById("display");
        if (displayElement != null) {
            displayElement.innerHTML = this.display;
        }
    };
    return Calculator;
}());
var calc = new Calculator();
//# sourceMappingURL=index.js.map