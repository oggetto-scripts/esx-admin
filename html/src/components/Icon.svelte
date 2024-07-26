<script lang="ts">
  export let icon: string;
  export let dark: boolean = false;
</script>

{#if icon === "players"}
  <img
    src={`./icons/${dark ? "black" : "white"}/players.svg`}
    alt="players"
    class="h-5"
  />
{:else if icon === "commands"}
  <img
    src={`./icons/${dark ? "black" : "white"}/commands.svg`}
    alt="commands"
    class="h-5"
  />
{:else if icon === "help"}
  <img
    src={`./icons/${dark ? "black" : "white"}/help.svg`}
    alt="help"
    class="h-5"
  />
{:else if icon === "player"}
  <img
    src={`./icons/${dark ? "black" : "white"}/player.svg`}
    alt="player"
    class="h-5"
  />
{/if}
