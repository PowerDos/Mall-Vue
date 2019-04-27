<template>
  <div>
    <ShopHeader></ShopHeader>
    <div class="goods-container">
      <div class="goods-list">
        <div class="goods-show-info" v-for="(item, index) in orderGoodsList" :key="index">
          <div class="goods-show-img">
            <router-link to="/goodsDetail"><img :src="item.img"/></router-link>
          </div>
          <div class="goods-show-price">
            <span>
              <Icon type="social-yen text-danger"></Icon>
              <span class="seckill-price text-danger">{{item.price}}</span>
            </span>
          </div>
          <div class="goods-show-detail">
            <span>{{item.intro}}</span>
          </div>
          <div class="goods-show-num">
            已有<span>{{item.remarks}}</span>人评价
          </div>
        </div>
      </div>
      <div class="goods-page">
        <Page :total="100" show-sizer></Page>
      </div>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
import ShopHeader from '@/components/header/ShopHeader';
import Footer from '@/components/footer/Footer';
import store from '@/vuex/store';
import { mapGetters, mapActions } from 'vuex';
export default {
  name: 'Merchant',
  created () {
    this.loadGoodsList();
  },
  computed: {
    ...mapGetters(['orderGoodsList'])
  },
  methods: {
    ...mapActions(['loadGoodsList'])
  },
  components: {
    ShopHeader,
    Footer
  },
  store
};
</script>

<style scoped>
.text-danger {
  color: #A94442;
}
.seckill-price{
  margin-right: 5px;
  font-size: 25px;
  font-weight: bold;
}
.goods-container {
  margin: 15px auto;
  width: 80%;
}
.goods-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.goods-show-info{
  width: 240px;
  padding: 10px;
  margin: 15px 0px;
  border: 1px solid #fff;
  cursor: pointer;
}
.goods-show-info:hover{
  border: 1px solid #ccc;
  box-shadow: 0px 0px 15px #ccc;
}
.goods-show-price{
  margin-top: 6px;
}
.goods-show-detail{
  font-size: 12px;
  margin: 6px 0px;
}
.goods-show-num{
  font-size: 12px;
  margin-bottom: 6px;
  color: #009688;
}
.goods-show-num span{
  color: #005AA0;
  font-weight: bold;
}
.goods-show-seller{
  font-size: 12px;
  color:#E4393C;
}
.goods-page {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}
</style>
