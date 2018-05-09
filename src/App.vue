<template>
  <div id="app">
    <Header></Header>
    <Sreach></Sreach>
    <router-view/>
  </div>
</template>

<script>
import Header from '@/components/Header'
import Sreach from '@/components/Sreach'
export default {
  name: 'App',
  components: {
    Header,
    Sreach
  }
}
</script>
