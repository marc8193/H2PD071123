<script>
	import {onMount} from 'svelte';

    const keys = [  ["Clear", "Undo", "", "/"],
                    ["7", "8", "9", "*"],
                    ["4", "5", "6", "-"],
                    ["1", "2", "3", "+"],
                    [".", "0", "", "="] 
                ];
                
    let keysObj;
    
    onMount(() => {
        for (let i = 0; i < keys.length; i++) {
            for (let j = 0; j < keys[i].length; j++) {
                const btn = document.createElement("button");
                btn.textContent = keys[i][j].toString();
                btn.addEventListener("click", () => calculate(keys[i][j]));
                btn.classList.add("key");
                keysObj.appendChild(btn);
            }
        }
    });
    

    let calcHistory = [];
    let displayTxt = "";
    let cachedValue = "";

    function calculate(val, pasteVal = false) {
        if (val == "=") {            
            calcHistory.push(cachedValue);
            calcHistory = calcHistory;

            cachedValue = eval(cachedValue).toString();
        } else if (val == "Clear") {
            cachedValue = "";
            calcHistory = [];
        } else if (val == "Undo") {
            cachedValue = cachedValue.slice(0, cachedValue.length - 1);
        } else if (pasteVal == false) {
            cachedValue += val;
        }
        
        if (pasteVal == true)
        {
            cachedValue = val;
        }
            
        displayTxt = cachedValue;
        
    }
</script>

<div class="main">
    <div class="display">{displayTxt}</div>
    <div class="keys" bind:this={keysObj} />

    <div class="calcHistory">
        <h1>Calculator History</h1>
        {#each calcHistory as element}
        <button on:click={() => calculate(element, true)}>{element}</button>
        {/each}
    </div>
</div>

<style>
    .main {
        margin: auto;
        display: flex;
        flex-direction: column;
        width: 500px;
        height: 700px;
        border-radius: 15px;
    }

    .display {
        background-color: #383838;
        width: 80%;
        height: 75px;
        border-radius: 15px;
        margin: 25px auto;
        color: white;
        text-align: right;
        font-size: 42px;
    }

    .keys {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        margin: 0 auto;
    }

    .keys :global(.key) {
        background-color: #4CAF50;
        border: none;
        color: white;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 38px;
        margin: 10px;
        cursor: pointer;
        width: 100px
    }

    .calcHistory {
        padding: 20px;
        color: white;
    }
</style>