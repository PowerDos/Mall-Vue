<template>
  <div>
    <Sreach></Sreach>
    <GoodsListNav></GoodsListNav>
  </div>
</template>

<script>
import Sreach from '@/components/Sreach';
import GoodsListNav from '@/components/nav/GoodsListNav';
export default {
  name: 'GoodsList',
  components: {
    Sreach,
    GoodsListNav
  }
};
</script>

<style scoped>

</style>
