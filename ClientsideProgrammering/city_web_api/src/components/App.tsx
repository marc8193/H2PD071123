import { Component, createResource, Show, For } from "solid-js";

import styles from "./App.module.css";

const App: Component = () => {
  const [api] = createResource(async () => {
    const response = await fetch("https://todoitems.buchwaldshave34.dk/api/TodoItems", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    return response.json();
  })

  return (
    <div class={styles.App}>
      <Show when={api()}>
        <ul>
          <For each={api()}>{(obj, i) =>
            <li>
              <a>Id: {obj.id} - Name: {obj.name} - isComplete: {String(obj.isComplete)}</a>
            </li>
          }</For>
        </ul>
      </Show>
    </div>
  );
};

export default App;
