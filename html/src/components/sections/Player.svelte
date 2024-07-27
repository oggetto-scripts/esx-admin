<script lang="ts">
  import type { Player } from "@/types";
  import Icon from "../Icon.svelte";

  export let player: Player;

  let currentOption = 0;

  const options = [
    {
      title: "Weapons",
      icon: "weapons",
    },
    {
      title: "Economy",
      icon: "economy",
    },
    {
      title: "Inventory",
      icon: "inventory",
    },
    {
      title: "Actions",
      icon: "actions",
    },
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
