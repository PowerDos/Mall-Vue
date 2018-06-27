<template>
  <div>
    <div class="item-detail-show">
      <div class="item-detail-left">
        <div class="item-detail-big-img">
          <img :src="getGoodsDetailBase.goodsImg[imgIndex]" alt="">
        </div>
        <div class="item-detail-img-row">
          <div class="item-detail-img-small" v-for="(item, index) in getGoodsDetailBase.goodsImg" :key="index" @mouseover="showBigImg(index)">
            <img :src="item" alt="">
          </div>
        </div>
      </div>
      <div class="item-detail-right">
        <div class="item-detail-title">
          <p>
            <span class="item-detail-express">校园配送</span> {{getGoodsDetailBase.title}}</p>
        </div>
        <div class="item-detail-tag">
          <p>
            <span v-for="(item,index) in getGoodsDetailBase.tags" :key="index">【{{item}}】</span>
          </p>
        </div>
        <div class="item-detail-price-row">
          <div class="item-price-left">
            <div class="item-price-row">
              <p>
                <span class="item-price-title">B I T 价</span>
                <span class="item-price">￥{{price.toFixed(2)}}</span>
              </p>
            </div>
            <div class="item-price-row">
              <p>
                <span class="item-price-title">优 惠 价</span>
                <span class="item-price-full-cut" v-for="(item,index) in getGoodsDetailBase.discount" :key="index">{{item}}</span>
              </p>
            </div>
            <div class="item-price-row">
              <p>
                <span class="item-price-title">促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</span>
                <span class="item-price-full-cut" v-for="(item,index) in getGoodsDetailBase.promotion" :key="index">{{item}}</span>
              </p>
            </div>
          </div>
          <div class="item-price-right">
            <div class="item-remarks-sum">
              <p>累计销售</p>
              <p>
                <span class="item-remarks-num">{{getGoodsDetailBase.salesNum}} </span>
              </p>
            </div>
          </div>
        </div>
        <!-- 选择颜色 -->
        <div class="item-select">
          <div class="item-select-title">
            <p>选择颜色</p>
          </div>
          <div class="item-select-container">
            <div class="" v-for="(item, index) in getGoodsDetailBase.setMeal" :key="index">
              <div class="item-select-box" @click="select(index)" :class="{'item-select-box-active': index === selectBoxIndex}">
                <div class="item-select-img">
                  <img :src="item.attrImgUrl" alt="">
                </div>
                <div class="item-select-intro">
                  <p>{{item.attrTitle}}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 白条分期 -->
        <div class="item-select">
          <div class="item-select-title">
            <p>白条分期</p>
          </div>
          <div class="item-select-row">
            <div class="item-select-class" v-for="(item,index) in hirePurchase" :key="index">
              <Tooltip :content="item.tooltip" placement="top-start">
                <span>{{item.type}}</span>
              </Tooltip>
            </div>
          </div>
        </div>
        <br>
        <div class="add-buy-car-box">
          <div class="add-buy-car">
            <InputNumber :min="1" v-model="count" size="large"></InputNumber>
            <Button type="error" size="large" @click="addShoppingCartBtn()">加入购物车</Button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import store from '@/vuex/store';
import { mapState, mapActions, mapGetters } from 'vuex';
export default {
  name: 'ShowGoods',
  data () {
    return {
      price: 0,
      count: 1,
      selectBoxIndex: 0,
      imgIndex: 0
    };
  },
  computed: {
    ...mapState(['goodsInfo']),
    ...mapGetters(['getGoodsDetailBase']),
    hirePurchase () {
      const three = this.price * this.count / 3;
      const sex = this.price * this.count / 6;
      const twelve = this.price * this.count / 12 * 1.0025;
      const twentyFour = this.price * this.count / 24 * 1.005;
      return [
        {
          tooltip: '无手续费',
          type: '不分期'
        },
        {
          tooltip: '无手续费',
          type: `￥${three.toFixed(2)} x 3期`
        },
        {
          tooltip: '无手续费',
          type: `￥${sex.toFixed(2)} x 6期`
        },
        {
          tooltip: '含手续费：费率0.25%起，￥0.1起×12期',
          type: `￥${twelve.toFixed(2)} x 12期`
        },
        {
          tooltip: '含手续费：费率0.5%起，￥0.1起×12期',
          type: `￥${twentyFour.toFixed(2)} x 24期`
        }
      ];
    }
  },
  methods: {
    ...mapActions(['addShoppingCart']),
    select (index) {
      this.selectBoxIndex = index;
      this.price = this.getGoodsDetailBase.setMeal[index].attrPrice;
    },
    showBigImg (index) {
      this.imgIndex = index;
    },
    addShoppingCartBtn () {
      const data = {
        goods_id: this.getGoodsDetailBase.goodsId,
        merchant_id: this.getGoodsDetailBase.merchantId,
        title: this.getGoodsDetailBase.title,
        count: this.count,
        package: this.getGoodsDetailBase.setMeal[this.selectBoxIndex]
      };
      this.addShoppingCart(data).then(data => {
        if (data) {
          this.$Message.success('添加购物车成功');
          this.$router.push('/shoppingCart');
        } else {
          this.$Message.error('添加购物车出错');
        }
      });
    }
  },
  updated () {
    this.price = this.getGoodsDetailBase.price || 0;
  },
  store
};
</script>

<style scoped>
/******************商品图片及购买详情开始******************/
.item-detail-show {
  width: 80%;
  margin: 15px auto;
  display: flex;
  flex-direction: row;
  background-color: #fff;
}
.item-detail-left {
  width: 350px;
  margin-right: 30px;
}
.item-detail-big-img {
  width: 350px;
  height: 350px;
  box-shadow: 0px 0px 8px #ccc;
  cursor: pointer;
}
.item-detail-big-img img {
  width: 100%;
}
.item-detail-img-row {
  margin-top: 15px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.item-detail-img-small {
  width: 68px;
  height: 68px;
  box-shadow: 0px 0px 8px #ccc;
  cursor: pointer;
}
.item-detail-img-small img {
  width: 100%;
}
/*商品选购详情*/
.item-detail-right {
  display: flex;
  flex-direction: column;
}
.item-detail-title p {
  color: #666;
  font-size: 20px;
}
.item-detail-express {
  font-size: 14px;
  padding: 2px 3px;
  border-radius: 3px;
  background-color: #e4393c;
  color: #fff;
}
/*商品标签*/
.item-detail-tag {
  font-size: 12px;
  color: #e4393c;
}
/*价格详情等*/
.item-detail-price-row {
  padding: 5px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  background-color: #f3f3f3;
}
.item-price-left {
  display: flex;
  flex-direction: column;
}
.item-price-title {
  color: #999999;
  font-size: 14px;
  margin-right: 15px;
}
.item-price-row {
  margin: 5px 0px;
}
.item-price {
  color: #e4393c;
  font-size: 23px;
  cursor: pointer;
}
.item-price-full-cut {
  margin-right: 5px;
  padding: 3px;
  color: #e4393c;
  font-size: 12px;
  background-color: #ffdedf;
  border: 1px dotted #e4393c;
  cursor: pointer;
}
.item-remarks-sum {
  padding-left: 8px;
  border-left: 1px solid #ccc;
}
.item-remarks-sum p {
  color: #999999;
  font-size: 12px;
  line-height: 10px;
  text-align: center;
}
.item-remarks-num {
  line-height: 18px;
  color: #005eb7;
}
.item-select {
  display: flex;
  flex-direction: row;
  margin-top: 15px;
}
.item-select-title {
  color: #999999;
  font-size: 14px;
  margin-right: 15px;
}
.item-select-column {
  display: flex;
  flex-direction: column;
}
.item-select-row {
  display: flex;
  flex-direction: row;
  margin-bottom: 8px;
}
.item-select-container {
  display: flex;
  display: row;
  flex-wrap: wrap;
  align-items: center;
}
.item-select-box {
  display: flex;
  flex-direction: row;
  align-items: center;
  padding: 5px;
  margin-right: 8px;
  margin-bottom: 15px;
  background-color: #f7f7f7;
  border: 0.5px solid #ccc;
  cursor: pointer;
}
.item-select-img {
  width: 36px;
}
.item-select-box:hover {
  border: 0.5px solid #e3393c;
}
.item-select-box-active {
  border: 0.5px solid #e3393c;
}
.item-select-img img {
  width: 100%;
}
.item-select-intro p {
  margin: 0px;
  padding: 5px;
}
.item-select-class {
  padding: 5px;
  margin-right: 8px;
  background-color: #f7f7f7;
  border: 0.5px solid #ccc;
  cursor: pointer;
}
.item-select-class:hover {
  border: 0.5px solid #e3393c;
}
.add-buy-car-box {
  width: 100%;
  margin-top: 15px;
  border-top: 1px dotted #ccc;
}
.add-buy-car {
  margin-top: 15px;
}
/******************商品图片及购买详情结束******************/
</style>
