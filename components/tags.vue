<template>
  <div class="tags">
    <span class="tag" v-for="tag in tags" :key="tag">{{ tag }}</span>
  </div>
</template>

<script>
export default {
  props: { tags: Array }
}
</script>

<style lang="scss">
@import './variables';

.tags {
  font-size: 0.8rem;
  margin: 0 -0.2rem;
  display: flex;
  flex-flow: row wrap;
}
.tag {
  padding: 0.3rem 0.4rem;
  margin: 0.2rem;
  background: rgba($grey, 0.2);
}
</style>
