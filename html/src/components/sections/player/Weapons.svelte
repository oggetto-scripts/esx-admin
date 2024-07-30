<script lang="ts">
  import Icon from "@/components/Icon.svelte";
  import Select from "@/components/selectors/weapon/Select.svelte";
  import SelectAmmo from "@/components/selectors/weapon/SelectAmmo.svelte";
  import type { Player } from "@/types";
  import { sendEvent } from "@/utils/sendEvent";
  import { createEventDispatcher } from "svelte";

  export let player: Player;

  let currentOption = 0;

  let weaponSelectorModal = false;
  let ammoSelectorModal = false;

  let isAdding = false;

  const dispatch = createEventDispatcher();

  const options = [
    {
      title: "Add Weapon",
      icon: "plus",
      action: () => {
        sendEvent("trapMouse", {});
        dispatch("selection", {});
        weaponSelectorModal = true;
        isAdding = true;
      },
    },
    {
      title: "Add Ammo",
      icon: "plus",
      action: () => {
        sendEvent("trapMouse", {});
        dispatch("selection", {});
        ammoSelectorModal = true;
        isAdding = true;
      },
    },
    {
      title: "Remove Weapon",
      icon: "minus",
      action: () => {
        sendEvent("trapMouse", {});
        dispatch("selection", {});
        weaponSelectorModal = true;
      },
    },
    {
      title: "Remove Ammo",
      icon: "minus",
      action: () => {
        sendEvent("trapMouse", {});
        dispatch("selection", {});
        ammoSelectorModal = true;
      },
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
    } else if (event.key === "Enter") {
      options[currentOption].action();
    } else if (event.key === "Escape") {
      weaponSelectorModal = false;
      ammoSelectorModal = false;
      sendEvent("untrapMouse", {});
    } else if (event.key === "Backspace" && !weaponSelectorModal && !ammoSelectorModal) {
      dispatch("back", {});
    }
  };
</script>

{#if weaponSelectorModal}
  <Select on:select={(e) => {
    weaponSelectorModal = false;
    sendEvent("untrapMouse", {});
    
    if (isAdding) {
      sendEvent("giveWeapon", { id: player.id, weapon: e.detail });
      isAdding = false;
    } else {
      sendEvent("removeWeapon", { id: player.id, weapon: e.detail });
    }
  }} />
{:else if ammoSelectorModal}
  <SelectAmmo 
    on:select={(e) => {
      ammoSelectorModal = false;
      sendEvent("untrapMouse", {});

      if (isAdding) {
        sendEvent("giveAmmo", { id: player.id, type: e.detail.type, ammo: e.detail.ammo });
        isAdding = false;
      } else {
        sendEvent("removeAmmo", { id: player.id, type: e.detail.type, ammo: e.detail.ammo });
      }
    }}
  />
{/if}

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