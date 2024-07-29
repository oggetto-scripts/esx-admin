<script lang="ts">
  export let icon: string;
  export let dark: boolean = false;
</script>

<img
  src={`./icons/${dark ? "black" : "white"}/${icon}.svg`}
  alt="remove"
  class="h-5"
/>
