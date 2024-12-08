<template>
  <div :style="`--time-color: ${timeColor}; --hue-amount: ${hueAmount}`">
    <slot />
  </div>
</template>
<script lang="ts" setup>
const hueAmount = ref(0);

const timeColor = computed(() => {
  const manualShift = 25;
  const today = new Date();
  const minutes = today.getHours() * 60 + today.getMinutes();
  hueAmount.value = (minutes / 1440) * 360 + manualShift;
  return `hsl(${hueAmount.value}, 100%,96%)`;
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
</style>
