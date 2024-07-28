<script lang="ts">
  import { weapons } from "@/utils/lists/weapons";
  import { createEventDispatcher } from "svelte";

  let results = weapons.slice(0, 5);

  const dispatch = createEventDispatcher();

  const handleSearch = (query: string) => {
    const lowerCaseQuery = query.toLowerCase();
    
    results = weapons.filter(
      (weapon) =>
        weapon.name.toLowerCase().includes(lowerCaseQuery) ||
        weapon.id.toLowerCase().includes(lowerCaseQuery) ||
        weapon.category.toLowerCase().includes(lowerCaseQuery)
    );
  };
</script>

<div class="absolute inset-0 flex items-center justify-center bg-dark/70">
  <div class="bg-dark rounded-lg p-4 w-96">
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
          on:click={() => dispatch("select", weapon)}
          class="p-2 border w-full border-white/5 bg-white/5 rounded-xl hover:border-primary hover:bg-primary/50 cursor-pointer"
        >
          <h1 class="text-white font-bold">
            {weapon.name}
          </h1>
          <p class="text-white/30 text-sm">
            {weapon.id} (part of {weapon.category})
          </p>
        </button>
      {/each}
    </div>
  </div>
</div>
