<template>
  <div>
    <Table border :columns="columns" :data="order" size="large" no-data-text="你还有订单，快点去购物吧"></Table>
    <div class="page-size">
      <Page :total="100" show-sizer></Page>
    </div>
  </div>
</template>

<script>
  import store from '@/vuex/store';
  import {mapActions} from 'vuex';

  export default {
    name: 'MyOrder',
    data() {
      return {
        order: [{
          order_id: 1529931938150,
          count: 1,
          package: '无',
          price: 28,
          title: '苹果旗舰店',
          createAt: '2018-06-06 20:06:08',
          orderStatue: '交易成功'
        }],
        columns: [
          {
            title: '订单号',
            key: 'order_id',
            width: 210,
            align: 'center'
          },
          {
            title: '商家',
            key: 'title',
            align: 'center'
          },
          {
            title: '使用优惠政策',
            width: 350,
            key: 'package',
            align: 'center'
          },
          {
            title: '总数',
            key: 'count',
            width: 80,
            align: 'center'
          },
          {
            title: '总价',
            width: 80,
            key: 'price',
            align: 'center'
          },
          {
            title: '购买时间',
            width: 250,
            key: 'createAt',
            align: 'center'
          },
          {
            title: '订单状态',
            width: 250,
            key: 'orderStatue',
            align: 'center'
          }
        ]
      };
    },
    methods: {
      ...mapActions(['loadOrders'])
    },
    mounted() {
      let loginToken = this.$cookies.get('token');
      this.loadOrders(loginToken).then(order => {
        // this.order = order;
      });
    },
    store
  };
</script>

<style scoped>
  .page-size {
    margin: 15px 0px;
    display: flex;
    justify-content: flex-end;
    align-items: center;
  }
</style>
