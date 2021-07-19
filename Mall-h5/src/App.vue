<template>
  <div class="container">
    <router-view />
  </div>
</template>

<script lang="ts">
  export default {
    name: 'App'
  }
</script>

<style lang="scss" scoped>
  .container {
    height: 100%;
    width: 100%;
  }
</style>
