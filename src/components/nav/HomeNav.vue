<template>
  <div>
    <div class="nav-item">
      <ul>
        <li v-for="(item,index) in nav" :key="index">
          <a href="#">{{item}}</a>
        </li>
      </ul>
    </div>
    <div class="nav-body">
      <!-- 侧边导航 -->
      <div class="nav-side" ref="navSide">
        <ul>
          <li @mouseenter="showDetail(1)" @mouseleave="hideDetail(1)">
            <span class="nav-side-item">家用电器</span>
          </li>
          <li @mouseenter="showDetail(2)" @mouseleave="hideDetail(2)">
            <span class="nav-side-item">手机</span> /
            <span class="nav-side-item">运营商</span> /
            <span class="nav-side-item">数码</span>
          </li>
          <li @mouseenter="showDetail(1)" @mouseleave="hideDetail(1)">
            <span class="nav-side-item">电脑</span> /
            <span class="nav-side-item">办公</span>
          </li>
          <li @mouseenter="showDetail(2)" @mouseleave="hideDetail(2)">
            <span class="nav-side-item">家居</span> /
            <span class="nav-side-item">家具</span> /
            <span class="nav-side-item">家装</span> /
            <span class="nav-side-item">厨具</span>
          </li>
          <li @mouseenter="showDetail(1)" @mouseleave="hideDetail(1)">
            <span class="nav-side-item">男装</span> /
            <span class="nav-side-item">女装</span> /
            <span class="nav-side-item">童装</span> /
            <span class="nav-side-item">内衣</span>
          </li>
          <li @mouseenter="showDetail(2)" @mouseleave="hideDetail(2)">
            <span class="nav-side-item">美妆个护</span> /
            <span class="nav-side-item">宠物</span>
          </li>
          <li @mouseenter="showDetail(1)" @mouseleave="hideDetail(1)">
            <span class="nav-side-item">女鞋</span> /
            <span class="nav-side-item">箱包</span> /
            <span class="nav-side-item">钟表</span> /
            <span class="nav-side-item">珠宝</span>
          </li>
          <li @mouseenter="showDetail(2)" @mouseleave="hideDetail(2)">
            <span class="nav-side-item">男鞋</span> /
            <span class="nav-side-item">运动</span> /
            <span class="nav-side-item">户外</span>
          </li>
          <li @mouseenter="showDetail(1)" @mouseleave="hideDetail(1)">
            <span class="nav-side-item">汽车</span> /
            <span class="nav-side-item">汽车用品</span>
          </li>
          <li @mouseenter="showDetail(2)" @mouseleave="hideDetail(2)">
            <span class="nav-side-item">母婴</span> /
            <span class="nav-side-item">玩具乐器</span>
          </li>
          <li @mouseenter="showDetail(1)" @mouseleave="hideDetail(1)">
            <span class="nav-side-item">食品</span> /
            <span class="nav-side-item">酒类</span> /
            <span class="nav-side-item">生鲜</span> /
            <span class="nav-side-item">特产</span>
          </li>
          <li @mouseenter="showDetail(2)" @mouseleave="hideDetail(2)">
            <span class="nav-side-item">礼品鲜花</span> /
            <span class="nav-side-item">农资绿植</span>
          </li>
          <li @mouseenter="showDetail(1)" @mouseleave="hideDetail(1)">
            <span class="nav-side-item">医药保健</span> /
            <span class="nav-side-item">计生情趣</span>
          </li>
          <li @mouseenter="showDetail(2)" @mouseleave="hideDetail(2)">
            <span class="nav-side-item">图书</span> /
            <span class="nav-side-item">音像</span> /
            <span class="nav-side-item">电子书</span>
          </li>
        </ul>
      </div>
      <div class="nav-content">
        <!-- 幻灯片 -->
        <div>
          <Carousel autoplay loop>
            <CarouselItem v-for="(item, index) in marketing.CarouselItems" :key="index">
              <img :src="item" alt="">
            </CarouselItem>
          </Carousel>
        </div>
        <div class="nav-show">
          <div class="nav-show-img" v-for="(item, index) in marketing.activity" :key="index">
            <img :src="item">
          </div>
        </div>
      </div>
    </div>
    <transition name="fade">
      <div class="detail-item-panel panel-1" :duration="{ enter: 100, leave: 100 }" v-show="panel1"  @mouseenter="showDetail(1)" ref="itemPanel1" @mouseleave="hideDetail(1)">
        <div class="nav-detail-item">
          <span>清洁用品 > </span>
          <span>美妆商城 > </span>
          <span>美妆馆 > </span>
          <span>妆比社 > </span>
          <span>全球购美妆 > </span>
          <span>宠物馆 > </span>
        </div>
        <ul>
          <li>
            <span class="detail-item-title">面部护肤 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">补水保湿</span>
              <span class="detail-item">卸妆</span>
              <span class="detail-item">洁面</span>
              <span class="detail-item">爽肤水</span>
              <span class="detail-item">乳液面霜</span>
              <span class="detail-item">精华</span>
              <span class="detail-item">眼霜</span>
              <span class="detail-item">防晒</span>
              <span class="detail-item">面膜</span>
              <span class="detail-item">剃须</span>
              <span class="detail-item">套装</span>
            </li>
            <li>
              <span class="detail-item-title">洗发护发 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">洗发</span>
              <span class="detail-item">护发</span>
              <span class="detail-item">染发</span>
              <span class="detail-item">造型</span>
              <span class="detail-item">假发</span>
              <span class="detail-item">美发工具</span>
              <span class="detail-item">套装</span>
            </li>
            <li>
              <span class="detail-item-title">身体护理 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">补水保湿</span>
              <span class="detail-item">沐浴</span>
              <span class="detail-item">润肤</span>
              <span class="detail-item">精油</span>
              <span class="detail-item">颈部</span>
              <span class="detail-item">手足</span>
              <span class="detail-item">纤体塑形</span>
              <span class="detail-item">美胸</span>
              <span class="detail-item">套装</span>
            </li>
            <li>
              <span class="detail-item-title">口腔护理 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">牙膏/牙粉</span>
              <span class="detail-item">牙刷/牙线</span>
              <span class="detail-item">漱口水</span>
              <span class="detail-item">套装</span>
            </li>
            <li>
              <span class="detail-item-title">女性护理 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">卫生巾</span>
              <span class="detail-item">卫生护垫</span>
              <span class="detail-item">私密护理</span>
              <span class="detail-item">脱毛膏</span>
            </li>
            <li>
              <span class="detail-item-title">香水彩妆 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">BB霜</span>
              <span class="detail-item">化妆棉</span>
              <span class="detail-item">女士香水</span>
              <span class="detail-item">男士香水</span>
              <span class="detail-item">底妆</span>
              <span class="detail-item">眉笔</span>
              <span class="detail-item">睫毛膏</span>
              <span class="detail-item">眼线</span>
              <span class="detail-item">眼影</span>
              <span class="detail-item">唇膏/彩</span>
            </li>
            <li>
              <span class="detail-item-title">清洁用品 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">纸品湿巾</span>
              <span class="detail-item">衣物清洁</span>
              <span class="detail-item">清洁工具</span>
              <span class="detail-item">家庭清洁</span>
              <span class="detail-item">一次性用品</span>
              <span class="detail-item">驱虫用品</span>
              <span class="detail-item">皮具护理</span>
            </li>
            <li>
              <span class="detail-item-title">宠物生活 <span class="glyphicon glyphicon-menu-right"> </span></span>
              <span class="detail-item">水族世界</span>
              <span class="detail-item">狗粮</span>
              <span class="detail-item">猫粮</span>
              <span class="detail-item">猫狗罐头</span>
              <span class="detail-item">狗零食</span>
              <span class="detail-item">猫零食</span>
              <span class="detail-item">医疗保健</span>
              <span class="detail-item">宠物玩具</span>
              <span class="detail-item">宠物服饰</span>
            </li>
            <li>
              <span class="detail-item-title">香水彩妆 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">BB霜</span>
              <span class="detail-item">化妆棉</span>
              <span class="detail-item">女士香水</span>
              <span class="detail-item">男士香水</span>
              <span class="detail-item">底妆</span>
              <span class="detail-item">眉笔</span>
              <span class="detail-item">睫毛膏</span>
              <span class="detail-item">眼线</span>
              <span class="detail-item">眼影</span>
              <span class="detail-item">唇膏/彩</span>
            </li>
            <li>
              <span class="detail-item-title">清洁用品 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">纸品湿巾</span>
              <span class="detail-item">衣物清洁</span>
              <span class="detail-item">清洁工具</span>
              <span class="detail-item">家庭清洁</span>
              <span class="detail-item">一次性用品</span>
              <span class="detail-item">驱虫用品</span>
              <span class="detail-item">皮具护理</span>
            </li>
            <li>
              <span class="detail-item-title">宠物生活 <span class="glyphicon glyphicon-menu-right"> </span></span>
              <span class="detail-item">水族世界</span>
              <span class="detail-item">狗粮</span>
              <span class="detail-item">猫粮</span>
              <span class="detail-item">猫狗罐头</span>
              <span class="detail-item">狗零食</span>
              <span class="detail-item">猫零食</span>
              <span class="detail-item">医疗保健</span>
              <span class="detail-item">宠物玩具</span>
              <span class="detail-item">宠物服饰</span>
            </li>
          </ul>
      </div>
    </transition>
    <transition name="fade">
      <div class="detail-item-panel panel-2" :duration="{ enter: 100, leave: 100 }" v-show="panel2" @mouseenter="showDetail(2)" ref="itemPanel2" @mouseleave="hideDetail(2)">
        <div class="nav-detail-item">
          <span>赛事 > </span>
          <span>运动城 > </span>
          <span>户外馆 > </span>
          <span>健身房 > </span>
          <span>骑行馆 > </span>
          <span>钟表城 > </span>
        </div>
        <ul>
          <li>
            <span class="detail-item-title">2017新品 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">休闲鞋</span>
              <span class="detail-item">商务休闲鞋</span>
              <span class="detail-item">正装鞋</span>
              <span class="detail-item">帆布鞋</span>
              <span class="detail-item">凉鞋</span>
              <span class="detail-item">拖鞋</span>
              <span class="detail-item">功能鞋</span>
              <span class="detail-item">增高鞋</span>
              <span class="detail-item">工装鞋</span>
              <span class="detail-item">雨鞋</span>
            </li>
            <li>
              <span class="detail-item-title">运动鞋包 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">跑步鞋</span>
              <span class="detail-item">休闲鞋</span>
              <span class="detail-item">篮球鞋</span>
              <span class="detail-item">帆布鞋</span>
              <span class="detail-item">板鞋</span>
              <span class="detail-item">拖鞋</span>
              <span class="detail-item">运动包</span>
            </li>
            <li>
              <span class="detail-item-title">健身训练 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">跑步机</span>
              <span class="detail-item">健身车/动感单车</span>
              <span class="detail-item">椭圆机</span>
              <span class="detail-item">综合训练器</span>
              <span class="detail-item">划船机</span>
              <span class="detail-item">甩脂机</span>
              <span class="detail-item">倒立机</span>
              <span class="detail-item">武术搏击</span>
            </li>
            <li>
              <span class="detail-item-title">骑行运动 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">山地车</span>
              <span class="detail-item">公路车</span>
              <span class="detail-item">折叠车</span>
              <span class="detail-item">骑行服</span>
              <span class="detail-item">电动车</span>
              <span class="detail-item">电动滑板车</span>
              <span class="detail-item">城市自行车</span>
              <span class="detail-item">平衡车</span>
            </li>
            <li>
              <span class="detail-item-title">体育用品 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">乒乓球</span>
              <span class="detail-item">羽毛球</span>
              <span class="detail-item">篮球</span>
              <span class="detail-item">足球</span>
              <span class="detail-item">轮滑滑板</span>
              <span class="detail-item">网球</span>
              <span class="detail-item">高尔夫</span>
              <span class="detail-item">台球</span>
              <span class="detail-item">排球</span>
            </li>
            <li>
              <span class="detail-item-title">户外鞋服 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">户外风衣</span>
              <span class="detail-item">徒步鞋</span>
              <span class="detail-item">T恤</span>
              <span class="detail-item">冲锋衣裤</span>
              <span class="detail-item">速干衣裤</span>
              <span class="detail-item">越野跑鞋</span>
              <span class="detail-item">滑雪服</span>
              <span class="detail-item">羽绒服/棉服</span>
              <span class="detail-item">休闲衣裤</span>
            </li>
            <li>
              <span class="detail-item-title">户外装备 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">背包</span>
              <span class="detail-item">帐篷/垫子</span>
              <span class="detail-item">望远镜</span>
              <span class="detail-item">烧烤用具</span>
              <span class="detail-item">便携桌椅床</span>
              <span class="detail-item">户外配饰</span>
              <span class="detail-item">军迷用品</span>
              <span class="detail-item">野餐用品</span>
            </li>
            <li>
              <span class="detail-item-title">垂钓用品 <span class="glyphicon glyphicon-menu-right"> </span></span>
              <span class="detail-item">钓竿</span>
              <span class="detail-item">鱼线</span>
              <span class="detail-item">浮漂</span>
              <span class="detail-item">鱼饵</span>
              <span class="detail-item">钓鱼配件</span>
              <span class="detail-item">渔具包</span>
              <span class="detail-item">钓箱钓椅</span>
              <span class="detail-item">鱼线轮</span>
              <span class="detail-item">钓鱼灯</span>
            </li>
            <li>
              <span class="detail-item-title">游泳用品 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">女士泳衣</span>
              <span class="detail-item">比基尼</span>
              <span class="detail-item">男士泳衣</span>
              <span class="detail-item">泳镜</span>
              <span class="detail-item">游泳圈</span>
              <span class="detail-item">游泳包防水包</span>
              <span class="detail-item">泳帽</span>
              <span class="detail-item">游泳配件</span>
            </li>
            <li>
              <span class="detail-item-title">垂钓用品 <span class="glyphicon glyphicon-menu-right"> </span></span>
              <span class="detail-item">钓竿</span>
              <span class="detail-item">鱼线</span>
              <span class="detail-item">浮漂</span>
              <span class="detail-item">鱼饵</span>
              <span class="detail-item">钓鱼配件</span>
              <span class="detail-item">渔具包</span>
              <span class="detail-item">钓箱钓椅</span>
              <span class="detail-item">鱼线轮</span>
            </li>
            <li>
              <span class="detail-item-title">游泳用品 <span class="glyphicon glyphicon-menu-right"></span></span>
              <span class="detail-item">女士泳衣</span>
              <span class="detail-item">比基尼</span>
              <span class="detail-item">男士泳衣</span>
              <span class="detail-item">泳镜</span>
              <span class="detail-item">游泳圈</span>
              <span class="detail-item">游泳包防水包</span>
              <span class="detail-item">泳帽</span>
              <span class="detail-item">游泳配件</span>
            </li>
          </ul>
      </div>
    </transition>
  </div>
</template>

<script>
import store from '@/vuex/store';
import { mapState } from 'vuex';
export default {
  name: 'HomeNav',
  data () {
    return {
      panel1: false,
      panel2: false,
      nav: [ '秒杀', '优惠券', '闪购', '拍卖', '服装城', '超市', '生鲜', '全球购', '金融' ]
    };
  },
  created () {

  },
  computed: {
    ...mapState([ 'marketing' ])
  },
  methods: {
    showDetail (index) {
      index === 1 ? this.panel1 = true : this.panel2 = true;
    },
    hideDetail (index) {
      index === 1 ? this.panel1 = false : this.panel2 = false;
    }
  },
  mounted () {
    this.$refs.itemPanel1.style.left = (this.$refs.navSide.offsetLeft + this.$refs.navSide.offsetWidth) + 'px';
    this.$refs.itemPanel2.style.left = (this.$refs.navSide.offsetLeft + this.$refs.navSide.offsetWidth) + 'px';
  },
  store
};
</script>

<style scoped>
.nav-item {
  width: 680px;
  height: 36px;
  margin: 0px auto;
}
.nav-item ul {
  list-style: none;
  margin-left: 15px;
}
.nav-item li {
  float: left;
  font-size: 16px;
  font-weight: bold;

  margin-left: 30px;
}
.nav-item a {
  text-decoration: none;
  color: #555555;
}
.nav-item a:hover {
  color: #d9534f;
}
/*大的导航信息，包含导航，幻灯片等*/
.nav-body {
  width: 1020px;
  height: 485px;
  margin: 0px auto;
}
.nav-side {
  width: 200px;
  height: 100%;
  padding: 0px;
  color: #fff;
  float: left;
  background-color: #6e6568;
}
.nav-side ul {
  width: 100%;
  padding: 0px;
  padding-top: 15px;
  list-style: none;
}
.nav-side li {
  padding: 7.5px;
  padding-left: 15px;
  font-size: 14px;
  line-height: 18px;
}
.nav-side li:hover {
  background: #999395;
}
.nav-side-item:hover {
  cursor: pointer;
  color: #c81623;
}

/*导航内容*/
.nav-content {
  width: 792px;
  margin-left: 15px;
  overflow: hidden;
  float: left;
}
/*导航图片*/
.nav-show-img {
  margin-top: 10px;
  float: left;
}
.nav-show-img:nth-child(2) {
  margin-left: 12px;
}
/*显示商品*/
.content {
  width: 100%;
}
/*显示商品详细信息*/
.detail-item-panel{
  width:815px;
  height: 485px;
  background-color: #fff;
  position: absolute;
  top: 168px;
  left: 389px;
  z-index: 999;
}
.nav-detail-item{
  margin-left: 26px;
  margin-top: 15px;
  margin-bottom: 15px;
  cursor: pointer;
  color: #eee;
}
.nav-detail-item span{
  padding: 6px;
  padding-left: 12px;
  margin-left: 15px;
  font-size: 12px;
  background-color: #6E6568;
}
.nav-detail-item span:hover{
  margin-left: 15px;
  background-color: #F44336;
}
.detail-item-panel ul{
  list-style: none;
}
.detail-item-panel li{
  line-height: 38px;
  margin-left: 40px;
}
.detail-item-title{
  padding-right: 6px;
  font-weight: bold;
  font-size: 12px;
  cursor: pointer;
  color: #555555;
}
.detail-item-title:hover{
  color: #D9534F;
}
.detail-item{
  font-size: 14px;
  padding-left: 12px;
  padding-right: 8px;
  cursor: pointer;
  border-left: 1px solid #ccc;
}
.detail-item:hover{
  color: #D9534F;
}
</style>
