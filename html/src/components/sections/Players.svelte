<script lang="ts">
  import { createEventDispatcher } from "svelte";
  import Icon from "../Icon.svelte";
  import type { Player } from "@/types";

  export let players: Player[];
  export let currentPlayer = 0;
  let parent: HTMLElement;

  const dispatch = createEventDispatcher();

  const onKeyDown = (event: KeyboardEvent) => {
    if (event.key === "ArrowUp") {
      if (currentPlayer > 0) {
        currentPlayer -= 1;
      } else {
        currentPlayer = players.length - 1;
      }
    } else if (event.key === "ArrowDown") {
      if (currentPlayer < players.length - 1) {
        currentPlayer += 1;
      } else {
        currentPlayer = 0;
      }
    } else if (event.key === "Enter") {
      handleSelect(players[currentPlayer]);
    }

    const childElement = parent.children[currentPlayer] as HTMLElement;
    if (childElement && typeof childElement.offsetTop === 'number') {
      parent.scrollTo({
        top: childElement.offsetTop - parent.clientHeight,
        behavior: "smooth",
      });
    }
  };

  const handleSelect = (player: Player) => {
    dispatch("selectPlayer", player);
  };
</script>

<svelte:window on:keydown={onKeyDown} />

<div class="overflow-y-scroll max-h-80 scroll-smooth no-scrollbar" bind:this={parent}>
  {#each players as player, i}
    <span
      class={`${
        currentPlayer === i ? "bg-primary text-black" : "bg-secondary"
      } p-2 rounded-lg cursor-pointer transition font-semibold flex items-center`}
    >
      <div class="mr-2">
        <Icon icon="player" dark={currentPlayer === i} />
      </div>
      {player.username} ({player.id})
    </span>
  {/each}
</div>

<style>
  /* Disable native scrollbars */
  .no-scrollbar::-webkit-scrollbar {
    display: none;
  }
</style>