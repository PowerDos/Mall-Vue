<template>
  <div>
    <Sreach></Sreach>
    <ShopHeader></ShopHeader>
    <GoodsDetailNav></GoodsDetailNav>
    <div class="shop-item-path">
      <div class="shop-nav-container">
        <p>手机  >  手机配件  >  手机保护套  >  iPhone8磨砂壳</p>
      </div>
    </div>
    <!-- 商品信息展示 -->
    <div class="item-detail-show">
      <div class="item-detail-left">
        <div class="item-detail-big-img">
          <img :src="goodsInfo.goodsImg[0]" alt="">
        </div>
        <div class="item-detail-img-row">
          <div class="item-detail-img-small" v-for="(item, index) in goodsInfo.goodsImg" :key="index">
            <img :src="item" alt="">
          </div>
        </div>
      </div>
      <div class="item-detail-right">
        <div class="item-detail-title">
          <p>
            <span class="item-detail-express">校园配送</span> {{goodsInfo.title}}</p>
        </div>
        <div class="item-detail-tag">
          <p>
            <span v-for="(item,index) in goodsInfo.tags" :key="index">【{{item}}】</span>
          </p>
        </div>
        <div class="item-detail-price-row">
          <div class="item-price-left">
            <div class="item-price-row">
              <p>
                <span class="item-price-title">京 东 价</span>
                <span class="item-price">￥{{goodsInfo.price}}</span>
              </p>
            </div>
            <div class="item-price-row">
              <p>
                <span class="item-price-title">优 惠 价</span>
                <span class="item-price-full-cut" v-for="(item,index) in goodsInfo.discount" :key="index">{{item}}</span>
              </p>
            </div>
            <div class="item-price-row">
              <p>
                <span class="item-price-title">促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</span>
                <span class="item-price-full-cut" v-for="(item,index) in goodsInfo.promotion" :key="index">{{item}}</span>
              </p>
            </div>
          </div>
          <div class="item-price-right">
            <div class="item-remarks-sum">
              <p>累计评价</p>
              <p>
                <span class="item-remarks-num">{{goodsInfo.remarksNum}} 条</span>
              </p>
            </div>
          </div>
        </div>
        <!-- 选择颜色 -->
        <div class="item-select">
          <div class="item-select-title">
            <p>选择颜色</p>
          </div>
          <div class="item-select-column">
            <div class="item-select-row" v-for="(items, index) in goodsInfo.setMeal" :key="index">
              <div class="item-select-box" v-for="(item, index1) in items" :key="index1">
                <div class="item-select-img">
                  <img :src="item.img" alt="">
                </div>
                <div class="item-select-intro">
                  <p>{{item.intro}}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 选择套餐 -->
        <div class="item-select">
          <div class="item-select-title">
            <p>优惠套装</p>
          </div>
          <div class="item-select-row">
            <div class="item-select-class" v-for="(item,index) in goodsInfo.package" :key="index">
              <span>{{item}}</span>
            </div>
          </div>
        </div>
        <!-- 白条分期 -->
        <div class="item-select">
          <div class="item-select-title">
            <p>白条分期</p>
          </div>
          <div class="item-select-row">
            <div class="item-select-class" v-for="(item,index) in goodsInfo.hirePurchase" :key="index">
              <span>{{item}}</span>
            </div>
          </div>
        </div>
        <div class="add-buy-car-box">
          <a href="car.html">
            <button class="btn-add-buy-car btn btn-danger">
              加入购物车
            </button>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Sreach from '@/components/Sreach';
import GoodsDetailNav from '@/components/nav/GoodsDetailNav';
import ShopHeader from '@/components/header/ShopHeader';
export default {
  name: 'GoodsDetail',
  data () {
    return {
      goodsInfo: {
        goodsImg: [
          '/static/img/goodsDetail/item-detail-1.jpg',
          '/static/img/goodsDetail/item-detail-2.jpg',
          '/static/img/goodsDetail/item-detail-3.jpg',
          '/static/img/goodsDetail/item-detail-4.jpg'
        ],
        title: '苹果8/7手机壳iPhone7 Plus保护壳全包防摔磨砂硬外壳',
        tags: [ '满69-20元', '关注产品★送钢化膜', 'BIT配次日达' ],
        price: '28.00',
        discount: [ '满148减10', '满218减20', '满288减30' ],
        promotion: [ '跨店满减', '多买优惠' ],
        remarksNum: 6000,
        setMeal: [
          [
            {
              img: '/static/img/goodsDetail/pack/1.jpg',
              intro: '4.7英寸-深邃蓝'
            },
            {
              img: '/static/img/goodsDetail/pack/2.jpg',
              intro: '4.7英寸-星空黑'
            },
            {
              img: '/static/img/goodsDetail/pack/3.jpg',
              intro: '5.5英寸-香槟金'
            }
          ],
          [
            {
              img: '/static/img/goodsDetail/pack/4.jpg',
              intro: '5.5英寸-玫瑰金'
            },
            {
              img: '/static/img/goodsDetail/pack/5.jpg',
              intro: '5.5英寸-深邃蓝'
            },
            {
              img: '/static/img/goodsDetail/pack/6.jpg',
              intro: '5.5英寸-星空黑'
            }
          ],
          [
            {
              img: '/static/img/goodsDetail/pack/7.jpg',
              intro: '4.7英寸-香槟金'
            },
            {
              img: '/static/img/goodsDetail/pack/8.jpg',
              intro: '4.7英寸-玫瑰金'
            },
            {
              img: '/static/img/goodsDetail/pack/9.jpg',
              intro: '4.7英寸-中国红'
            }
          ]
        ],
        package: [ '优惠套餐一', '优惠套餐二', '优惠套餐三', '优惠套餐四', '优惠套餐五' ],
        hirePurchase: [ '不分期', '￥9.47 x 3期', '￥4.81 x 6期', '￥2.47 x 12期', '￥1.31 x 24期' ]
      }
    };
  },
  components: {
    Sreach,
    ShopHeader,
    GoodsDetailNav
  }
};
</script>

<style scoped>
.shop-item-path {
  height: 38px;
  background-color: rgb(236, 235, 235);
  line-height: 38px;
  color: #2c2c2c;
}

/******************商品图片及购买详情开始******************/
.item-detail-show {
  width: 80%;
  margin: 15px auto;
  display: flex;
  flex-direction: row;
  background-color: #fff;
}
.item-detail-left{
  width: 350px;
  margin-right: 30px;
}
.item-detail-big-img{
  width: 350px;
  height: 350px;
  box-shadow: 0px 0px 8px #ccc;
  cursor: pointer;
}
.item-detail-big-img img{
  width: 100%;
}
.item-detail-img-row {
  margin-top: 15px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.item-detail-img-small{
  width: 68px;
  box-shadow: 0px 0px 8px #ccc;
  cursor: pointer;
}
.item-detail-img-small img{
  width: 100%;
}
/*商品选购详情*/
.item-detail-right{
  display: flex;
  flex-direction: column;
}
.item-detail-title p{
  color: #666;
  font-size: 20px;
}
.item-detail-express{
  font-size: 14px;
  padding: 2px 3px;
  border-radius: 3px;
  background-color: #E4393C;
  color: #fff;
}
/*商品标签*/
.item-detail-tag{
  font-size: 12px;
  color: #e4393c;
}
/*价格详情等*/
.item-detail-price-row{
  padding: 5px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  background-color: #F3F3F3;
}
.item-price-left{
  display: flex;
  flex-direction: column;
}
.item-price-title{
  color: #999999;
  font-size: 14px;
  margin-right: 15px;
}
.item-price-row {
  margin: 5px 0px;
}
.item-price{
  color: #E4393C;
  font-size: 23px;
  cursor: pointer;
}
.item-price-full-cut{
  margin-right: 5px;
  padding: 3px;
  color: #E4393C;
  font-size: 12px;
  background-color: #FFDEDF;
  border: 1px dotted #E4393C;
  cursor: pointer;
}
.item-remarks-sum{
  padding-left: 8px;
  border-left: 1px solid #ccc;
}
.item-remarks-sum p{
  color: #999999;
  font-size: 12px;
  line-height: 10px;
  text-align: center;
}
.item-remarks-num{
  line-height: 18px;
  color: #005EB7;
}
.item-select{
  display: flex;
  flex-direction: row;
  margin-top: 15px;
}
.item-select-title{
  color: #999999;
  font-size: 14px;
  margin-right: 15px;
}
.item-select-column{
  display: flex;
  flex-direction: column;
}
.item-select-row{
  display: flex;
  flex-direction: row;
  margin-bottom: 8px;
}
.item-select-box{
  display: flex;
  flex-direction: row;
  align-items: center;
}
.item-select-img{
  width: 36px;
}
.item-select-box{
  padding: 5px;
  margin-right: 8px;
  background-color: #F7F7F7;
  border: 0.5px solid #ccc;
  cursor: pointer;
}
.item-select-box:hover{
  border: 0.5px solid #e3393c;
}
.item-select-img img{
  width: 100%;
}
.item-select-intro p{
  margin: 0px;
  padding: 5px;
}
.item-select-class{
  padding: 5px;
  margin-right: 8px;
  background-color: #F7F7F7;
  border: 0.5px solid #ccc;
  cursor: pointer;
}
.item-select-class:hover{
  border: 0.5px solid #e3393c;
}
.add-buy-car-box{
  width: 100%;
  margin-top: 15px;
  border-top: 1px solid #ccc;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
}
.btn-add-buy-car{
  margin-top: 8px;
}
/******************商品图片及购买详情结束******************/
</style>
