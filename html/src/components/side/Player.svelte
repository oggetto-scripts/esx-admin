<script lang="ts">
  import type { Player } from "@/types";

  export let player: Player;
</script>

<div class="bg-dark text-white p-4 rounded-xl mt-8">
  <h1 class="text-xl font-extrabold mb-2 flex items-center">
    <img src="./icons/white/player.svg" alt="player" class="h-6 mr-2" />
    {player.name}
    <span class="bg-primary text-black rounded-lg px-2 py-1 ml-2">
      ID: {player.id}
    </span>
  </h1>
  <p class="text-sm text-white/70">
    {player.identifier}
  </p>
  <hr class="border-white/10 my-4" />
  <div class="grid grid-cols-3 gap-2 mt-4">
    <div class="flex flex-col items-center">
      <span class="text-sm text-white/50">Money</span>
      <span class="font-semibold">${player.money}</span>
    </div>
    <div class="flex flex-col items-center">
      <span class="text-sm text-white/50">Bank</span>
      <span class="font-semibold">${player.bank}</span>
    </div>
    <div class="flex flex-col items-center">
      <span class="text-sm text-white/50">Dirty</span>
      <span class="font-semibold">${player.black_money}</span>
    </div>
  </div>
</div>
