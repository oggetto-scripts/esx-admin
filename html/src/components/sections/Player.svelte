<script lang="ts">
  import type { Player, Vehicle } from "@/types";
  import Icon from "@/components/Icon.svelte";
  import Actions from "./player/Actions.svelte";
  import Weapons from "./player/Weapons.svelte";
  import Economy from "./player/Economy.svelte";
  import { createEventDispatcher } from "svelte";
  import { sendEvent } from "@/utils/sendEvent";
  import { useNuiEvent } from "@/utils/useNuiEvent";
  import Vehicles from "./player/Vehicles.svelte";

  export let player: Player;

  let vehicles: Vehicle[] = [];

  sendEvent("r:getPlayerVehicles", {
    id: player.id,
  });

  useNuiEvent<{ vehicles: Vehicle[]; player: number }>("r:vehicles", (data) => {
    if (data.player === player.id) {
      vehicles = data.vehicles;
    }
  });

  let currentOption = 0;
  let section = 0;

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
      title: "Vehicle",
      icon: "car",
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

  const dispatch = createEventDispatcher();

  const onKeyDown = (event: KeyboardEvent) => {
    if (section !== 0) {
      return;
    }
    
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
      section = currentOption + 1;
    } else if (event.key === "Backspace" && section === 0) {
      dispatch("back", {});
    }
  };
</script>

<svelte:window on:keydown={onKeyDown} />
{#if section === 0}
  <div class="grid grid-cols-1">
    {#each options as option, i}
      <span
        class={`${
          currentOption === i ? "bg-primary text-black" : "bg-secondary"
        } p-2 rounded-lg cursor-pointer transition font-semibold flex items-center justify-between`}
      >
      <div class="flex items-center">
        <div class="mr-2">
          <Icon icon={option.icon} dark={currentOption === i} />
        </div>
        {option.title}
      </div>
      <Icon icon="arrow" dark={currentOption === i} />
      </span>
    {/each}
  </div>
{:else if section === 1}
  <Weapons {player} on:back={() => (section = 0)} />
{:else if section === 2}
  <Economy {player} on:back={() => (section = 0)} />
{:else if section === 3}
  <Vehicles {vehicles} on:back={() => (section = 0)} />
{:else if section === 5}
  <Actions {player} on:back={() => (section = 0)} />
{/if}
