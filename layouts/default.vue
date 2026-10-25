<template>
  <div :style="timeStyle">
    <aside class="exaptation-banner" aria-label="Announcement">
      <p>
        From 2026 on, I work professionally under
        <a href="https://exaptation.eu/lasse">Exaptation.eu</a>.
      </p>
    </aside>
    <slot />
  </div>
</template>
<script lang="ts" setup>
// The colour follows the visitor's time of day. The site is prerendered
// (`nuxi generate`), so anything computed during setup is the BUILD time —
// and hydration does not patch a mismatched style attribute. So the
// prerendered HTML carries no colour and the client sets it on mount.
const manualShift = 25;
const hueAmount = ref<number | null>(null);

const timeStyle = computed(() =>
  hueAmount.value === null
    ? undefined
    : `--time-color: hsl(${hueAmount.value}, 100%,96%); --hue-amount: ${hueAmount.value}`
);

onMounted(() => {
  const now = new Date();
  const minutes = now.getHours() * 60 + now.getMinutes();
  hueAmount.value = (minutes / 1440) * 360 + manualShift;
});
</script>

<style lang="scss">
@import '../components/variables';

html {
  font-family: 'Asap', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: $onyx;
}

.exaptation-banner {
  background: var(--time-color);
  border-bottom: 3px solid hsl(calc(var(--hue-amount) - 45), 90%, 90%);
  color: $onyx;
  text-align: center;
  padding: 0.6em 1em;
  font-size: 0.8rem;
  line-height: 1.4;
  p {
    margin: 0;
  }
  a {
    font-weight: 600;
    text-underline-offset: 0.15em;
  }
}
</style>
