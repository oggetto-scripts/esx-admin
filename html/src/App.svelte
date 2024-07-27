<script lang="ts">
  import Icon from "./components/Icon.svelte";
  import type { Player } from "@/types";
  import { sendEvent } from "./utils/sendEvent";
  import { useNuiEvent } from "./utils/useNuiEvent";
  import Players from "./components/sections/Players.svelte";
  import PlayerSec from "./components/sections/Player.svelte";
  import PlayerSide from "./components/side/Player.svelte";

  let section = 0;
  let currentOption = 0;

  // Variables recieved from the client (server -> client -> nui)
  let players: Player[];
  let player: Player;

  useNuiEvent<Player[]>("players", (data) => {
    players = data;
  });

  const options = [
    {
      title: "Players",
      icon: "players",
    },
    {
      title: "Commands",
      icon: "commands",
    },
    {
      title: "Help",
      icon: "help",
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
    } else if (event.key === "Escape") {
      sendEvent("close", {});
      section = 0;
    } else if (event.key === "Enter") {
      section = currentOption + 1;
    } else if (event.key === "Backspace") {
      if (section === 4) {
        section = 1;
      } else if (section !== 0 && section < 4) {
        section = 0;
      } else {
        sendEvent("close", {});
        section = 0;
      }
    }
  };

  const handlePlayerChange = (e: CustomEvent<Player>) => {
    player = e.detail;
    section = 4;
  };
</script>

<svelte:window on:keydown={onKeyDown} />

<div class="flex flex-row items-start space-x-4 select-none">
  <main class="bg-dark text-white w-80 p-4 mt-8 ml-8 rounded-xl max-h">
    <div class="flex justify-center mb-5 mt-2">
      <img src="./logo.png" alt="logo" class="h-16" />
    </div>

    <div class="max-h-80">
      {#if section === 0}
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
      {:else if section === 1}
        <Players {players} on:selectPlayer={handlePlayerChange} />
      {:else if section === 4}
        <!-- First 3 sections are reserved for the options -->
        <PlayerSec {player} />
      {/if}
    </div>
    <footer>
      <div class="mt-5">
        <span class="text-xs text-white/35 flex items-center">
          <img
            src="./icons/keyboard.svg"
            alt="keyboard"
            class="h-4 opacity-35 mr-1.5"
          />
          Use Arrow Up/Down to navigate, Enter to select
        </span>
      </div>
    </footer>
  </main>

  <!-- SIDE INFO BOX -->
  {#if section === 4}
    <PlayerSide {player} />
  {/if}
</div>
