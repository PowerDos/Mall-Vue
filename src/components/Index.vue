<template>
  <div class="container">
    <Sreach></Sreach>
    <HomeNav></HomeNav>
  </div>
</template>

<script>
import Sreach from '@/components/Sreach'
import HomeNav from '@/components/nav/HomeNav'
export default {
  name: 'Index',
  components: {
    Sreach,
    HomeNav
  }
}
</script>

<style scoped>

</style>
