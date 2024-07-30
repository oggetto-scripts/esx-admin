<script lang="ts">
  import Icon from "@/components/Icon.svelte";
  import Add from "@/components/selectors/weapon/Add.svelte";
  import AddAmmo from "@/components/selectors/weapon/AddAmmo.svelte";
  import type { Player } from "@/types";
  import { sendEvent } from "@/utils/sendEvent";
  import { createEventDispatcher } from "svelte";

  export let player: Player;

  let currentOption = 0;

  let weaponSelectorModal = false;
  let ammoSelectorModal = false;

  const dispatch = createEventDispatcher();

  const options = [
    {
      title: "Add Weapon",
      icon: "plus",
      action: () => {
        sendEvent("trapMouse", {});
        dispatch("selection", {});
        weaponSelectorModal = true;
      },
    },
    {
      title: "Add Ammo",
      icon: "plus",
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
  <Add on:select={(e) => {
    weaponSelectorModal = false;
    sendEvent("untrapMouse", {});
    sendEvent("giveWeapon", { id: player.id, weapon: e.detail });
  }} />
{:else if ammoSelectorModal}
  <AddAmmo 
    on:select={(e) => {
      ammoSelectorModal = false;
      sendEvent("untrapMouse", {});
      sendEvent("giveAmmo", { id: player.id, type: e.detail.type, ammo: e.detail.ammo });
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