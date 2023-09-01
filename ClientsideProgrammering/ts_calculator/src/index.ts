class Calculator {
    keys: any = [ ["Clear", "Undo", "", "/"], 
                  ["7", "8", "9", "*"], 
                  ["4", "5", "6", "-"], 
                  ["1", "2", "3", "+"], 
                  [".", "0", "", "="] 
                ];
    cachedVal: string = "";
    display: string = "";
    keysElement: any = document.getElementById("keys");

    constructor() {
        for (let i = 0; i < this.keys.length; i++) {
            for (let j = 0; j < this.keys[i].length; j++) {
                const btn = document.createElement("button");
                btn.textContent = this.keys[i][j].toString();
                btn.addEventListener("click", () => this.calculate(this.keys[i][j]));
                btn.classList.add("key");
                this.keysElement.appendChild(btn);
            }
        }
    }
    
    private calculate(val: string, pasteVal = false) {
        if (val == "=") {            

            this.cachedVal = eval(this.cachedVal).toString();
        } else if (val == "Clear") {
            this.cachedVal = "";
        } else if (val == "Undo") {
            this.cachedVal = this.cachedVal.slice(0, this.cachedVal.length - 1);
        } else if (pasteVal == false) {
            this.cachedVal += val;
        }
        
        if (pasteVal == true)
        {
            this.cachedVal = val;
        }
            
        this.display = this.cachedVal;

        let displayElement = document.getElementById("display");
        
        if (displayElement != null) {
            displayElement.innerHTML = this.display;
        }
    }
}

const calc = new Calculator();