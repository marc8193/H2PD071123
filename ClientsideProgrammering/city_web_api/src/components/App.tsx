import { Component, createResource, Show, For } from "solid-js";

import styles from "./App.module.css";

const UserName = "UserMarcus";

const App: Component = () => {
  const [getCity] = createResource(async () => {
    const response = await fetch(`https://cityinfo.buchwaldshave34.dk/api/city?UserName=${UserName}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    return response.json();
  })

  const delCity = (cityId: string) => {
    const response = fetch(`https://cityinfo.buchwaldshave34.dk/api/City/${cityId}?UserName=${UserName}`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
      },
    });
  }

  const copyCity = async (cityObj: any) => {
    const response = await fetch(`https://cityinfo.buchwaldshave34.dk/api/City?UserName=${UserName}`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(cityObj)
    });
  }

  const updateCity = async (cityObj: any) => {
    cityObj.name = `${cityObj.name} - UPDATED BY ${UserName}`;

    const response = await fetch(`https://cityinfo.buchwaldshave34.dk/api/City/${cityObj.cityId}?UserName=${UserName}`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(cityObj)
    });
  }

  const addLanguage = async (cityObj: any) => {
    let cityLanguagesArr = cityObj.cityLanguages as Array<any>;

    cityLanguagesArr.push({cityId: cityObj.cityId, languageId: 1});

    const response = await fetch(`https://cityinfo.buchwaldshave34.dk/api/CityLanguage?UserName=${UserName}`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(cityLanguagesArr)
    });

    console.log(cityLanguagesArr)
  }

  const [getCountry] = createResource(async () => {
    const response = await fetch(`https://cityinfo.buchwaldshave34.dk/api/country?UserName=${UserName}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    return response.json();
  })

  return (
    <div class={styles.App}>
      <Show when={getCity()}>
        <ul>
          <For each={getCity()}>{(cityobj, i) =>
            <li>
              <For each={getCountry()}>{(countryobj, i) =>
                cityobj.country.countryID == countryobj.countryID &&
                <div>
                  <a>{`CityName: ${cityobj.name} - CountryName: ${countryobj.countryName}`}</a>
                  <ul>
                    <button onclick={() => addLanguage(cityobj)}>Add Language</button>
                    <For each={cityobj.cityLanguages}>{(cityLanguagesObj, i) =>
                      <li>
                        <a>{cityLanguagesObj.languageName}</a>
                      </li>
                    }</For>
                  </ul>
                  <button onclick={() => delCity(cityobj.cityId)}>Delete city</button>
                  <button onclick={() => copyCity(cityobj)}>Copy city</button>
                  <button onclick={() => updateCity(cityobj)}>Update city</button>
                </div>
              }</For>
            </li>
          }</For>
        </ul>
      </Show>
    </div>
  );
};

export default App;
