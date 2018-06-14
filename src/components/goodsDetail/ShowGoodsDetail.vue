<template>
  <div>
    <div class="item-intro-show">
      <div class="item-intro-recommend">
        <div class="item-recommend-title">
          <p>店铺热销</p>
        </div>
        <div class="item-intro-recommend-column">
          <div class="item-recommend-column" v-for="(item, index) in goodsInfo.hot" :key="index">
            <div class="item-recommend-img">
              <img :src="item.img" alt="">
            </div>
            <div class="item-recommend-intro">
              <span>
                <span class="item-recommend-top-num">{{index + 1}}</span> 热销{{item.sale}}件</span>
              <span class="item-recommend-price">￥{{item.price.toFixed(2)}}</span>
            </div>
          </div>
        </div>
      </div>
      <div class="item-intro-detail" ref="itemIntroDetail">
        <div class="item-intro-nav item-tabs">
          <Tabs>
            <TabPane label="商品介绍">
              <div class="remarks-title">
                <span>商品介绍</span>
              </div>
              <div class="item-intro-img" ref="itemIntroGoods">
                <img :src="item" alt="" v-for="(item,index) in goodsInfo.goodsDetail" :key="index">
              </div>
            </TabPane>
            <TabPane label="规格参数">
              <div class="remarks-title">
                <span>规格参数</span>
              </div>
              <div class="item-param-container">
                <span class="item-param-box" v-for="(item,index) in goodsInfo.param" :key="index">
                  <span class="item-param-title">{{item.title}}: </span>
                  <span class="item-param-content">{{item.content}}</span>
                </span>
              </div>
            </TabPane>
            <TabPane label="售后保障">
              <div class="remarks-title">
                <span>售后保障</span>
              </div>
              <div class="item-protect-container">
                <div class="item-protect-box">
                  <p class="item-protect-title-box">
                    <Avatar style="background-color: #e4393c" icon="ribbon-a" />
                    <span class="item-protect-title">卖家服务</span>
                  </p>
                  <p class="item-protect-detail">
                    高品质敢承诺：7天无理由退货，30天免费换新，质量问题商家承担来回运费换新；如需发票，请在确认收货无误后联系商家开出。（注*发票不随货品一同发出）
                  </p>
                </div>
                <div class="item-protect-box">
                  <p class="item-protect-title-box">
                    <Avatar style="background-color: #e4393c" icon="cash" />
                    <span class="item-protect-title">平台承诺</span>
                  </p>
                  <p class="item-protect-detail">
                    平台卖家销售并发货的商品，由平台卖家提供发票和相应的售后服务。请您放心购买！<br> 注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
                  </p>
                </div>
                <div class="item-protect-box">
                  <p class="item-protect-title-box">
                    <Avatar style="background-color: #e4393c" icon="locked" />
                    <span class="item-protect-title">正品行货</span>
                  </p>
                  <p class="item-protect-detail">
                    BIT商城向您保证所售商品均为正品行货，BIT自营商品开具机打发票或电子发票。
                  </p>
                </div>
                <div class="item-protect-box">
                  <p class="item-protect-title-box">
                    <Avatar style="background-color: #e4393c" icon="settings" />
                    <span class="item-protect-title">全国联保</span>
                  </p>
                  <p class="item-protect-detail">
                    凭质保证书及BIT商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由BIT联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。BIT商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！<br><br> 注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
                  </p>
                </div>
              </div>
            </TabPane>
            <TabPane label="商品评价">
              <div class="remarks-container">
                <div class="remarks-title">
                  <span>商品评价</span>
                </div>
                <div class="remarks-analyse-box">
                  <div class="remarks-analyse-goods">
                    <i-circle :percent="goodsInfo.remarks.goodAnalyse" stroke-color="#e4393c">
                      <span class="remarks-analyse-num">{{goodsInfo.remarks.goodAnalyse}}%</span>
                      <p class="remarks-analyse-title">好评率</p>
                    </i-circle>
                  </div>
                  <div class="remarks-analyse-tags">
                    <Tag checkable :color="tagsColor[index % 4]" v-for="(item,index) in goodsInfo.remarks.remarksTags" :key="index">{{item}}</Tag>
                  </div>
                </div>
                <div class="remarks-bar">
                  <span>追评({{goodsInfo.remarks.remarksNumDetail[0]}})</span>
                  <span>好评({{goodsInfo.remarks.remarksNumDetail[1]}})</span>
                  <span>中评({{goodsInfo.remarks.remarksNumDetail[2]}})</span>
                  <span>差评({{goodsInfo.remarks.remarksNumDetail[3]}})</span>
                </div>
                <div class="remarks-box" v-for="(item,index) in goodsInfo.remarks.detail" :key="index">
                  <div class="remarks-user">
                    <Avatar icon="person" />
                    <span class="remarks-user-name">{{item.username}}</span>
                  </div>
                  <div class="remarks-content-box">
                    <p>
                      <Rate disabled :value="item.values" allow-half class="remarks-star"></Rate>
                    </p>
                    <p class="remarks-content">{{item.content}}</p>
                    <p class="remarks-sub">
                      <span class="remarks-item">{{item.goods}}</span>
                      <span class="remarks-time">{{item.time}}</span>
                    </p>
                  </div>
                </div>
                <div class="remarks-page">
                  <Page :total="40" size="small" show-elevator show-sizer></Page>
                </div>
              </div>
            </TabPane>
          </Tabs>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import store from '@/vuex/store';
import { mapState } from 'vuex';
export default {
  name: 'ShowGoodsDetail',
  data () {
    return {
      tagsColor: [ 'blue', 'green', 'red', 'yellow' ]
    };
  },
  computed: {
    ...mapState(['goodsInfo'])
  },
  updated () {
    this.$nextTick(() => {
      const father = this;
      setTimeout(() => {
        let heightCss = window.getComputedStyle(father.$refs.itemIntroGoods).height;
        console.log(heightCss);
        heightCss = parseInt(heightCss.substr(0, heightCss.length - 2)) + 89;
        father.$refs.itemIntroDetail.style.height = heightCss + 'px';
      }, 100);
    });
  },
  store
};
</script>

<style scoped>
/***************商品详情介绍和推荐侧边栏开始***************/
.item-intro-show{
  width: 80%;
  margin: 15px auto;
  display: flex;
  flex-direction: row;
  background-color: #fff;
}
.item-intro-recommend{
  width: 200px;
  display: flex;
  flex-direction: column;
}
.item-intro-recommend-column{
  display: flex;
  flex-direction: column;
  box-shadow: 0px 0px 5px #999;
}
.item-recommend-title{
  width: 100%;
  height: 38px;
  font-size: 16px;
  line-height: 38px;
  color: #fff;
  background-color: #E4393C;
  box-shadow: 0px 0px 5px #E4393C;
  text-align: center;
}
.item-recommend-column{
  margin-top: 15px;
}
.item-recommend-intro{
  padding: 5px 15px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  font-size: 12px;
  color: #999;
  cursor: pointer;
}
.item-recommend-img{
  width: 80%;
  margin: 0px auto;
  cursor: pointer;
}
.item-recommend-img img{
  width: 100%;
}
.item-recommend-top-num{
  color: #fff;
  margin: 0px 2px;
  padding: 1px 5px;
  border-radius: 12px;
  background-color: #E4393C;
}
.item-recommend-price{
  color: #E4393C;
  font-weight: bolder;
}
.item-intro-detail{
  margin-left: 30px;
  width: calc(80vw - 300px);
}
.item-intro-nav{
  width: 100%;
  height: 38px;
  background-color: #F7F7F7;
  border-bottom: 1px solid #E4393C;
}
.item-intro-nav ul{
  margin: 0px;
  padding: 0px;
  list-style: none;
}
.item-intro-nav li{
  float: left;
  height: 100%;
  width: 120px;
  line-height: 38px;
  text-align: center;
  color: #E4393C;
}
.item-intro-nav li:first-child{
  background-color: #E4393C;
  color: #fff;
}
.item-intro-img{
  width: 100%;
}
.item-intro-img img{
  width: 100%;
}
/************* 商品参数 *************/
.item-param-container {
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  justify-content: space-between;
}
.item-param-box {
  padding: 5px;
  padding-left: 30px;
  width: 240px;
  height: 36px;
  font-size: 14px;
  /* text-align: center; */
  /* background-color: #ccc; */
}
.item-param-title {
  color: #232323;
}
.item-param-content {
  color: #999;
}
.item-protect-container {
  padding: 15px;
}
.item-protect-box {
  margin-bottom: 30px;
}
.item-protect-title-box {
  display: flex;
  align-items: center;
}
.item-protect-title {
  padding-left: 15px;
  font-size: 20px;
  font-weight: bolder;
  color: #e4393c;
}
.item-protect-detail {
  padding-top: 5px;
  padding-left: 46px;
  font-size: 14px;
  color: #999;
}
.remarks-title {
  padding-left: 15px;
  height: 36px;
  font-size: 16px;
  font-weight: bolder;
  line-height: 36px;
  color: #666666;
  background-color: #F7F7F7;
}
.remarks-analyse-box {
  padding: 15px;
  display: flex;
  align-items: center;
}
.remarks-analyse-goods {
  margin-left: 15px;
  margin-right: 15px;
}
.remarks-analyse-num {
  font-size: 26px;
}
.remarks-analyse-title {
  font-size: 12px;
  line-height: 20px;
}
.remarks-bar {
  padding-left: 15px;
  height: 36px;
  line-height: 36px;
  color: #666666;
  background-color: #F7F7F7;
}
.remarks-bar span {
  margin-right: 15px;
}
.remarks-box {
  padding: 15px;
  display: flex;
  flex-direction: row;
  border-bottom: 1px #ccc dotted;
}
.remarks-user {
  width: 180px;
}
.remarks-user-name {
  padding-left: 15px;
}
.remarks-content-box {
  width: calc(100% - 180px);
}
.remarks-star {
  background-color: #fff;
}
.remarks-content {
  font-size: 14px;
  color: #232323;
  line-height: 28px;
}
.remarks-sub {
  margin-top: 15px;
  color: #ccc;
}
.remarks-time {
  margin-left: 15px;
}
.remarks-page {
  margin: 15px;
  display: flex;
  justify-content:flex-end;
}
/***************商品详情介绍和推荐侧边栏结束***************/
</style>

<style>
/* 改变便签页样式 */
.ivu-tabs-ink-bar {
  background-color: #E4393C !important;
}
.item-tabs > .ivu-tabs > .ivu-tabs-bar .ivu-tabs-tab{
  border-radius: 0px;
  color: #999;
  height: 38px;
  background: #F7F7F7;
}
.item-tabs > .ivu-tabs > .ivu-tabs-bar .ivu-tabs-tab-active{
  color: #fff;
  background-color: #E4393C;
}
.item-tabs > .ivu-tabs > .ivu-tabs-bar .ivu-tabs-tab-active:before{
  content: '';
  display: block;
  width: 100%;
  height: 1px;
  color: #fff;
  background: #F7F7F7;
  position: absolute;
  top: 0;
  left: 0;
}
.ivu-rate-star-full:before, .ivu-rate-star-half .ivu-rate-star-content:before {
  color: #E4393C;
}
</style>
