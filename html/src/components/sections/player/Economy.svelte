<script lang="ts">
  import { sendEvent } from "@/utils/sendEvent";
  import Icon from "@/components/Icon.svelte";
  import type { Player } from "@/types";
  import { createEventDispatcher } from "svelte";
  import Set from "@/components/selectors/money/Set.svelte";
  import Remove from "@/components/selectors/money/Remove.svelte";
  import Add from "@/components/selectors/money/Add.svelte";

  export let player: Player;

  let currentOption = 0;

  let moneyAdderModal = false;
  let moneyRemoverModal = false;
  let moneySetterModal = false;

  const dispatch = createEventDispatcher();

  const options = [
    {
      title: "Add Money Ammount",
      icon: "plus",
      action: () => {
        sendEvent("trapMouse", {});
        dispatch("selection", {});
        moneyAdderModal = true;
      },
    },
    {
      title: "Remove Money Ammount",
      icon: "minus",
      action: () => {
        sendEvent("trapMouse", {});
        dispatch("selection", {});
        moneyRemoverModal = true;
      },
    },
    {
      title: "Set Money Ammount",
      icon: "equals",
      action: () => {
        sendEvent("trapMouse", {});
        dispatch("selection", {});
        moneySetterModal = true;
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
    } else if (event.key === "Backspace" && !moneyAdderModal && !moneyRemoverModal && !moneySetterModal) {
      dispatch("back", {});
    } else if (event.key === "Escape") {
      moneyAdderModal = false;
      sendEvent("untrapMouse", {});
    }
  };
</script>

{#if moneyAdderModal}
  <Add on:select={(e) => {
    moneyAdderModal = false;
    sendEvent("untrapMouse", {});
    sendEvent("addMoney", { id: player.id, amount: e.detail.quantity, method: e.detail.method });
  }} />
{:else if moneyRemoverModal}
  <Remove on:select={(e) => {
    moneyRemoverModal = false;
    sendEvent("untrapMouse", {});
    sendEvent("removeMoney", { id: player.id, amount: e.detail.quantity, method: e.detail.method });
  }} />
{:else if moneySetterModal}
  <Set on:select={(e) => {
    moneySetterModal = false;
    sendEvent("untrapMouse", {});
    sendEvent("setMoney", { id: player.id, amount: e.detail.quantity, method: e.detail.method });
  }} />
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
