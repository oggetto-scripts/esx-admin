<script lang="ts">
  import Icon from "@/components/Icon.svelte";
  import type { Vehicle } from "@/types";
  import { createEventDispatcher } from "svelte";

  export let vehicles: Vehicle[];

  let currentOption = 0;

  const dispatch = createEventDispatcher();
  
  const options = [
    ...vehicles.map((vehicle) => ({
      title: vehicle.model.name,
      icon: "car",
      action: () => {},
    })),
  ];

  const onKeyDown = (event: KeyboardEvent) => {
    if (event.key === "ArrowUp") {
      if (currentOption > 0) {
        currentOption -= 1;
      } else {
        currentOption = options.length - 1;
      }
    } else if (event.key === "ArrowDown") {
      if (currentOption < options.length - 1) {
        currentOption += 1;
      } else {
        currentOption = 0;
      }
    } else if (event.key === "Enter") {
      options[currentOption].action();
    } else if (event.key === "Backspace") {
      dispatch("back", {});
    }
  };
</script>

<svelte:window on:keydown={onKeyDown} />
<div class="grid grid-cols-1">
  {#each options as option, i}
    <span
      class={`${
        currentOption === i ? "bg-primary text-black" : "bg-secondary"
      } p-2 rounded-lg cursor-pointer transition font-semibold flex items-center`}
    >
      <div class="mr-2">
        <Icon icon={option.icon} dark={currentOption === i} />
      </div>
      {option.title}
    </span>
  {/each}
</div>
