<template>
  <div>
    <div class="order-container" v-for="(item, index) in order" :key="index">
      <div class="order-header">
        <h2>订单号: {{item.orderid}}</h2>
      </div>
      <div>
        <p><span class="order-content-title"> 收 货 人 :</span> {{item.name}}</p>
        <p><span class="order-content-title"> 收货地址 :</span> {{item.address}}</p>
        <p><span class="order-content-title"> 付款总额 :</span> {{item.price}}</p>
        <h3>下面是订单详情</h3>
      </div>
      <div>
        <Collapse accordion>
          <Panel :name="getIndex(index, oIndex)" v-for="(orderDetail, oIndex) in item.orderDetail" :key="oIndex">
              {{orderDetail.goodsName.substring(0, 50) + '...'}}
              <p slot="content"><span class="order-content-title"> 商品名称 :</span>{{orderDetail.goodsName}}</p>
              <p slot="content"><span class="order-content-title"> 商品数量 :</span>{{orderDetail.count}}</p>
              <p slot="content"><span class="order-content-title"> 商品套餐 :</span>{{orderDetail.attrTitle}}</p>
              <p slot="content"><span class="order-content-title"> 商品图片 :</span><img :src="orderDetail.img"></p>
          </Panel>
      </Collapse>
      </div>
    </div>
    <div class="page-size">
      <Page :total="100" show-sizer></Page>
    </div>
  </div>
</template>

<script>
import store from '@/vuex/store';
import { mapState, mapActions } from 'vuex';
export default {
  name: 'MyOrder',
  created () {
    this.getOrder();
  },
  data () {
    return {
      action: 999
    };
  },
  computed: {
    ...mapState(['order'])
  },
  methods: {
    ...mapActions(['getOrder']),
    getIndex (index1, index2) {
      let index = index2;
      for (let i = 0; i < index1; i++) {
        index += this.order[i].orderDetail.length;
      }
      console.log(index);
      return String(index);
    }
  },
  store
};
</script>

<style scoped>
.order-container {
  width: 80%;
  margin: 15px auto;
  padding: 15px;
  border-radius: 8px;
  box-shadow: 0px 0px 5px #ccc;
}
.order-header {
  height: 38px;
}
.order-container p {
  font-size: 14px;
  line-height: 26px;
}
.order-container h3 {
  line-height: 30px;
}
.order-content-title {
  color: #999;
}
.page-size {
  margin: 15px 0px;
  display: flex;
  justify-content: flex-end;
  align-items: center;
}
</style>
