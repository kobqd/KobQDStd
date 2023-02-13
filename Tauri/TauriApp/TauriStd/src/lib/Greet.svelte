<script>
  import { invoke } from "@tauri-apps/api/tauri";
  import {resourceDir, appDataDir} from "@tauri-apps/api/path";
  import { resolveResource } from '@tauri-apps/api/path'
  import {
  BaseDirectory,
  readTextFile,
  writeTextFile
} from "@tauri-apps/api/fs";
  

  let name = "";
  let greetMsg = "";
  let testStr = "";

//   export const readFile1 = async() => {
//   try {
//     const result = await readTextFile("package.json", {
//       dir: BaseDirectory.App,
//     });
//     console.log("result: " + result);
//     return result;
//   } catch (error) {
//     console.log(error);
//     return false;
//   }
// };

  async function test(){
    const resourceDirPath = await resourceDir();
    console.log("resourceDirPath", resourceDirPath);
    const resourcePath = await resolveResource('resources/test.json')
    const csvRs = JSON.parse(await readTextFile(resourcePath))
    console.log("csvRs",csvRs)
    testStr = resourceDirPath;

    csvRs.a = csvRs.a + 1
    // const obj = {a:1,b:2}

    // await writeTextFile({ path: resourcePath, contents: JSON.stringify(obj) }, { dir: BaseDirectory.AppConfig });
    await writeTextFile({ path: resourcePath, contents: JSON.stringify(csvRs) });
    // testStr = result;
  }

  async function greet(){
    // Learn more about Tauri commands at https://tauri.app/v1/guides/features/command
    greetMsg = await invoke("greet", { name })
  }
</script>

<div>
  <div class="row">
    <input id="greet-input" placeholder="Enter a name..." bind:value={name} />
    <button on:click={greet}>
      Greet
    </button>
  </div>
  <p>{greetMsg}</p>
  <button on:click={test}>Test</button>
  <p>Result: {testStr}
  </p>
</div>

