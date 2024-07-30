<script lang="ts">
  import { ammos } from "@/utils/lists/ammos";
  import { createEventDispatcher } from "svelte";

  let results = ammos.slice(0, 5);
  let selectedAmmo = "";
  let section = 0;
  let ammo = 0;

  const dispatch = createEventDispatcher();

  const handleSearch = (query: string) => {
    const lowerCaseQuery = query.toLowerCase();

    results = ammos.filter(
      (ammos) =>
        ammos.name.toLowerCase().includes(lowerCaseQuery) ||
        ammos.id.toLowerCase().includes(lowerCaseQuery) ||
        ammos.category.toLowerCase().includes(lowerCaseQuery)
    );
  };

  const onKeyDown = (event: KeyboardEvent) => {
    if (event.key === "Enter" && section === 1) {

      dispatch("select", { type: selectedAmmo, ammo });
    }
  };
</script>

<svelte:window on:keydown={onKeyDown} />
<div class="absolute inset-0 flex items-center justify-center bg-dark/70">
  <div class="bg-dark rounded-lg p-4 w-96">
    {#if section === 0}
      <!-- svelte-ignore a11y-autofocus -->
      <input
        type="text"
        autofocus={true}
        class="text-white bg-white/5 focus:outline-none border-2 border-primary rounded-lg p-2 w-full"
        placeholder="Search weapons"
        on:input={(e) => handleSearch(e.target.value)}
      />

      <div class="pt-4 space-y-2">
        {#each results.slice(0, 3) as weapon}
          <button
            on:click={() => {
              selectedAmmo = weapon.id;
              section = 1;
            }}
            class="p-2 border w-full border-white/5 bg-white/5 rounded-xl hover:border-primary hover:bg-primary/50 cursor-pointer"
          >
            <h1 class="text-white font-bold">
              {weapon.name}
            </h1>
            <p class="text-white/30 text-sm">
              Usable for {weapon.category} weapons
            </p>
          </button>
        {/each}
      </div>
    {:else if section === 1}
      <!-- svelte-ignore a11y-autofocus -->
      <input
        type="number"
        autofocus={true}
        class="text-white bg-white/5 focus:outline-none border-2 border-primary rounded-lg p-2 w-full"
        placeholder="Enter ammo amount"
        pattern="[0-9]*"
        on:input={(e) => (ammo = parseInt(e.target.value))}
      />

      <div class="pt-4 grid grid-cols-4 gap-x-4">
        <button
          class="p-2 border border-white/5 bg-white/5 rounded-xl hover:border-primary hover:bg-primary/50 cursor-pointer"
          on:click={() => {
            dispatch("select", { type: selectedAmmo, ammo: 50 });
          }}
        >
          +50
        </button>
        <button
          class="p-2 border border-white/5 bg-white/5 rounded-xl hover:border-primary hover:bg-primary/50 cursor-pointer"
          on:click={() => {
            dispatch("select", { type: selectedAmmo, ammo: 100 });
          }}
        >
          +100
        </button>
        <button
          class="p-2 border border-white/5 bg-white/5 rounded-xl hover:border-primary hover:bg-primary/50 cursor-pointer"
          on:click={() => {
            dispatch("select", { type: selectedAmmo, ammo: 150 });
          }}
        >
          +150
        </button>
        <button
          class="p-2 border border-white/5 bg-white/5 rounded-xl hover:border-primary hover:bg-primary/50 cursor-pointer"
          on:click={() => {
            dispatch("select", { type: selectedAmmo, ammo: 200 });
          }}
        >
          +200
        </button>
      </div>
    {/if}
  </div>
</div>
