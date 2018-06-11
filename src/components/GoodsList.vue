<template>
  <div>
    <Sreach></Sreach>
    <GoodsListNav></GoodsListNav>
    <div class="container">
      <div class="bread-crumb">
        <Breadcrumb>
          <BreadcrumbItem to="/">
            <Icon type="ios-home-outline"></Icon> 首页
          </BreadcrumbItem>
          <BreadcrumbItem to="/goodsList?sreachData=">
            <Icon type="bag"></Icon> {{sreachItem}}
          </BreadcrumbItem>
        </Breadcrumb>
      </div>
      <!-- 商品标签导航 -->
      <GoodsClassNav></GoodsClassNav>
      <!-- 商品展示容器 -->
      <div class="goods-box">
        <div class="as-box">
          <div class="item-as-title">
            <span>商品精选</span>
            <span>广告</span>
          </div>
          <div class="item-as" v-for="(item,index) in asItems" :key="index">
            <div class="item-as-img">
              <img :src="item.img" alt="">
            </div>
            <div class="item-as-price">
              <span>
                <Icon type="social-yen text-danger"></Icon>
                <span class="seckill-price text-danger">{{item.price}}</span>
              </span>
            </div>
            <div class="item-as-intro">
              <span>{{item.intro}}</span>
            </div>
            <div class="item-as-selled">
              已有<span>{{item.num}}</span>人评价
            </div>
          </div>
        </div>
        <div class="goods-list-box">
          <div class="goods-list-tool">
            <ul>
              <li v-for="(item,index) in goodsTool" :key="index"><span>{{item}} <Icon type="arrow-down-a"></Icon></span></li>
            </ul>
          </div>
          <div class="goods-list">
            <div class="goods-show-info" v-for="(item, index) in goodsList" :key="index">
              <div class="goods-show-img">
                <img :src="item.img"/>
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
                已有<span>{{item.sale}}</span>人评价
              </div>
              <div class="goods-show-seller">
                <span>{{item.shopName}}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="goods-page">
        <Page :total="100" show-sizer></Page>
      </div>
      <Spin size="large" fix v-if="false"></Spin>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
import Sreach from '@/components/Sreach';
import GoodsListNav from '@/components/nav/GoodsListNav';
import GoodsClassNav from '@/components/nav/GoodsClassNav';
import Footer from '@/components/footer/Footer';
export default {
  name: 'GoodsList',
  data () {
    return {
      sreachItem: '',
      asItems: [
        {
          img: 'static/img/goodsList/item-as-img-1.jpg',
          price: 39.9,
          intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬',
          num: 3140
        },
        {
          img: 'static/img/goodsList/item-as-img-2.jpg',
          price: 36.6,
          intro: '狮普 苹果7/7 Plus手机壳 电镀 超薄 全包 防摔 保护外',
          num: 6160
        },
        {
          img: 'static/img/goodsList/item-as-img-1.jpg',
          price: 38.6,
          intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬',
          num: 9160
        },
        {
          img: 'static/img/goodsList/item-as-img-2.jpg',
          price: 35.6,
          intro: '狮普 苹果7/7 Plus手机壳 电镀 超薄 全包 防摔 保护外',
          num: 6160
        },
        {
          img: 'static/img/goodsList/item-as-img-1.jpg',
          price: 38.6,
          intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬',
          num: 9160
        },
        {
          img: 'static/img/goodsList/item-as-img-2.jpg',
          price: 35.6,
          intro: '狮普 苹果7/7 Plus手机壳 电镀 超薄 全包 防摔 保护外',
          num: 6160
        }
      ],
      goodsTool: [ '综合', '销量', '评论数', '新品', '价格' ],
      goodsList: [
        {
          img: 'static/img/goodsList/item-show-1.jpg',
          price: 36.60,
          intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬壳男女磨砂防摔 火影红(苹',
          sale: 6160,
          shopName: '元亨利配件专营店'
        },
        {
          img: 'static/img/goodsList/item-show-2.jpg',
          price: 28.00,
          intro: '蒙奇奇 苹果6s手机壳磨砂防摔保护套 适用于iphone6/6s/6sPlus/6plus 6/6s 4.7英',
          sale: 3000,
          shopName: 'monqiqi旗舰店'
        },
        {
          img: 'static/img/goodsList/item-show-3.jpg',
          price: 15.00,
          intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
          sale: 2800,
          shopName: 'BIAZE官方旗舰店'
        },
        {
          img: 'static/img/goodsList/item-show-4.jpg',
          price: 29.90,
          intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
          sale: 9000,
          shopName: '歌乐力手配专营店'
        },
        {
          img: 'static/img/goodsList/item-show-5.jpg',
          price: 15.00,
          intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
          sale: 6160,
          shopName: 'BIAZE官方旗舰店'
        },
        {
          img: 'static/img/goodsList/item-show-6.jpg',
          price: 28.00,
          intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
          sale: 9006,
          shopName: '歌乐力手配专营店'
        },
        {
          img: 'static/img/goodsList/item-show-7.jpg',
          price: 15.00,
          intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
          sale: 8666,
          shopName: 'BIAZE官方旗舰店'
        },
        {
          img: 'static/img/goodsList/item-show-8.jpg',
          price: 29.90,
          intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
          sale: 6080,
          shopName: '歌乐力手配专营店'
        },
        {
          img: 'static/img/goodsList/item-show-1.jpg',
          price: 36.60,
          intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬壳男女磨砂防摔 火影红(苹',
          sale: 6160,
          shopName: '元亨利配件专营店'
        },
        {
          img: 'static/img/goodsList/item-show-2.jpg',
          price: 28.00,
          intro: '蒙奇奇 苹果6s手机壳磨砂防摔保护套 适用于iphone6/6s/6sPlus/6plus 6/6s 4.7英',
          sale: 3000,
          shopName: 'monqiqi旗舰店'
        },
        {
          img: 'static/img/goodsList/item-show-3.jpg',
          price: 15.00,
          intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
          sale: 2800,
          shopName: 'BIAZE官方旗舰店'
        },
        {
          img: 'static/img/goodsList/item-show-4.jpg',
          price: 29.90,
          intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
          sale: 9000,
          shopName: '歌乐力手配专营店'
        },
        {
          img: 'static/img/goodsList/item-show-5.jpg',
          price: 15.00,
          intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
          sale: 6160,
          shopName: 'BIAZE官方旗舰店'
        },
        {
          img: 'static/img/goodsList/item-show-6.jpg',
          price: 28.00,
          intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
          sale: 9006,
          shopName: '歌乐力手配专营店'
        },
        {
          img: 'static/img/goodsList/item-show-7.jpg',
          price: 15.00,
          intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
          sale: 8666,
          shopName: 'BIAZE官方旗舰店'
        },
        {
          img: 'static/img/goodsList/item-show-8.jpg',
          price: 29.90,
          intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
          sale: 6080,
          shopName: '歌乐力手配专营店'
        }
      ]
    };
  },
  mounted () {
    this.sreachItem = this.$route.query.sreachData;
  },
  components: {
    Sreach,
    GoodsListNav,
    GoodsClassNav,
    Footer
  }
};
</script>

<style scoped>
.container {
  margin: 15px auto;
  width: 80%;
  min-width: 1000px;
}
.text-danger {
  color: #A94442;
}
.seckill-price{
  margin-right: 5px;
  font-size: 25px;
  font-weight: bold;
}
.goods-box {
  display: flex;
}
/* ---------------侧边广告栏开始------------------- */
.as-box {
  width: 200px;
  border: 1px solid #ccc;
}
.item-as-title{
  width: 100%;
  height: 36px;
  color: #B1191A;
  line-height: 36px;
  font-size: 18px;
}
.item-as-title span:first-child{
  margin-left: 20px;
}
.item-as-title span:last-child{
  float: right;
  margin-right: 15px;
  font-size: 10px;
  color: #ccc;
}
.item-as{
  width: 160px;
  margin: 18px auto;
}
.item-as-img{
  width: 160px;
  height: 160px;
  margin: 0px auto;
}
.item-as-price span{
  font-size: 18px;
}
.item-as-intro{
  margin-top: 5px;
  font-size: 12px;
}
.item-as-selled{
  margin-top: 5px;
  font-size: 12px;
}
.item-as-selled span{
  color: #005AA0;
}
/* ---------------侧边广告栏结束------------------- */

/* ---------------商品栏开始------------------- */
.goods-list-box {
  margin-left: 15px;
  width: calc(100% - 215px);
}
.goods-list-tool{
  width: 100%;
  height: 38px;
  border: 1px solid #ccc;
  background-color: #F1F1F1;
}
.goods-list-tool ul{
  padding-left: 15px;
  list-style: none;
}
.goods-list-tool li{
  cursor: pointer;
  float: left;
}
.goods-list-tool span{
  padding: 5px 8px;
  border: 1px solid #ccc;
  border-left: none;
  line-height: 36px;
  background-color: #fff;
}
.goods-list-tool span:hover{
  border: 1px solid #E4393C;
}
.goods-list-tool i:hover{
  color: #E4393C;
}
.goods-list-tool li:first-child>span{
  color: #fff;
  border-left: 1px solid #ccc;
  background-color: #E4393C;
}

.goods-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.goods-show-info{
  width: 240px;
  padding: 10px;
  margin: 15px;
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
/* ---------------商品栏结束------------------- */
</style>
