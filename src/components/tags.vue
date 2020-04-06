<template>
  <div class="tags">
    <span class="tag" v-for="tag in tags" :key="tag">{{ tag }}</span>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';

@Component
export default class Tags extends Vue {
  @Prop() tags!: Array<['name']>;
}
</script>

<style>
.tags {
  font-size: 0.8rem;
  margin: 0 -0.2rem;
  display: flex;
  flex-flow: row wrap;
}
.tag {
  padding: 0.3rem 0.4rem;
  margin: 0.2rem;
  background: whitesmoke;
}
</style>
