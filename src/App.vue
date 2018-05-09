<template>
  <div id="app">
    <Header></Header>
    <router-view/>
  </div>
</template>

<script>
import Header from '@/components/header/Header'
export default {
  name: 'App',
  components: {
    Header
  }
}
</script>

<style scoped>
#app{
  background-color: #F6F6F6;
}
</style>
