<template>
  <div>
    <Sreach></Sreach>
    <GoodsListNav></GoodsListNav>
  </div>
</template>

<script>
import Sreach from '@/components/Sreach';
import GoodsListNav from '@/components/nav/GoodsListNav';
import Footer from '@/components/footer/Footer';
export default {
  name: 'Pay',
  components: {
    Sreach,
    GoodsListNav,
    Footer
  }
};
</script>
