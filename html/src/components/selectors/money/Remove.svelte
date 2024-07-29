<script lang="ts">
  import { createEventDispatcher } from "svelte";

  let quantity = 0;

  const dispatch = createEventDispatcher();

  const handleSelect = (method: string) => {
    dispatch("select", { method, quantity });
  };
</script>

<div class="absolute inset-0 flex items-center justify-center bg-dark/70">
  <div class="bg-dark rounded-lg p-4 w-96">
    <!-- svelte-ignore a11y-autofocus -->
    <input
      type="number"
      autofocus={true}
      class="text-white bg-white/5 focus:outline-none border-2 border-primary rounded-lg p-2 w-full"
      placeholder="Enter money amount"
      pattern="[0-9]*"
      on:input={(e) => (quantity = parseInt(e.target.value))}
    />

    <div class="pt-4 grid grid-cols-3 gap-x-4">
      <button
        class="p-2 border rounded-xl border-white/5 bg-white/5 hover:border-primary hover:bg-primary/50"
        on:click={() => handleSelect("money")}
      >
        Cash
      </button>
      <button
        class="p-2 border rounded-xl border-white/5 bg-white/5 hover:border-primary hover:bg-primary/50"
        on:click={() => handleSelect("bank")}
      >
        Bank
      </button>
      <button
        class="p-2 border rounded-xl border-white/5 bg-white/5 hover:border-primary hover:bg-primary/50"
        on:click={() => handleSelect("black_money")}
      >
        Black
      </button>
    </div>
  </div>
</div>
