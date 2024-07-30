<script lang="ts">
  import { createEventDispatcher } from "svelte";

  const dispatch = createEventDispatcher();

  const onKeyDown = (event: KeyboardEvent) => {
    if (event.key === "Backspace") {
      dispatch("back", {});
    }
  };
</script>

<svelte:window on:keydown={onKeyDown} />
<div>
  <ul class="text-lg">
    <li>
      <span class="font-bold">Version: </span> v0.0.1-pre-alpha
    </li>
    <li>
      <span class="font-bold">Developers: </span> Valerio Clemenzi
    </li>
    <li>
      <span class="font-bold">License: </span> MIT
    </li>
  </ul>

  <span class="text-white/40 text-xs">
    Developed by Valerio Clemenzi (for OgScript) with ❤️ 
  </span>
</div>
