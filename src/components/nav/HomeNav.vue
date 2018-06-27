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
          <li @mouseenter="showDetail(0)" @mouseleave="hideDetail()">
            <span class="nav-side-item">3C数码</span> /
            <span class="nav-side-item">家用电器</span>
          </li>
          <li @mouseenter="showDetail(1)" @mouseleave="hideDetail()">
            <span class="nav-side-item">服饰</span> /
            <span class="nav-side-item">鞋类箱包</span>
          </li>
          <li @mouseenter="showDetail(2)" @mouseleave="hideDetail()">
            <span class="nav-side-item">母婴</span> /
            <span class="nav-side-item">居家日用</span>
          </li>
          <li @mouseenter="showDetail(3)" @mouseleave="hideDetail()">
            <span class="nav-side-item">食品</span> /
            <span class="nav-side-item">餐饮美食</span>
          </li>
          <li @mouseenter="showDetail(4)" @mouseleave="hideDetail()">
            <span class="nav-side-item">休闲娱乐</span> /
            <span class="nav-side-item">旅游酒店</span>
          </li>
          <li @mouseenter="showDetail(5)" @mouseleave="hideDetail()">
            <span class="nav-side-item">商务办公</span> /
            <span class="nav-side-item">金融理财</span>
          </li>
          <li @mouseenter="showDetail(6)" @mouseleave="hideDetail()">
            <span class="nav-side-item">学习培训</span> /
            <span class="nav-side-item">文化体育</span>
          </li>
          <li @mouseenter="showDetail(7)" @mouseleave="hideDetail()">
            <span class="nav-side-item">便民生活</span> /
            <span class="nav-side-item">话费通信</span>
          </li>
          <li @mouseenter="showDetail(8)" @mouseleave="hideDetail()">
            <span class="nav-side-item">美妆护肤</span> /
            <span class="nav-side-item">丽人</span>
          </li>
          <li @mouseenter="showDetail(9)" @mouseleave="hideDetail()">
            <span class="nav-side-item">房地产</span> /
            <span class="nav-side-item">汽车/交通</span>
          </li>
          <li @mouseenter="showDetail(10)" @mouseleave="hideDetail()">
            <span class="nav-side-item">珠宝配饰</span> /
            <span class="nav-side-item">古董收藏</span>
          </li>
          <li @mouseenter="showDetail(11)" @mouseleave="hideDetail()">
            <span class="nav-side-item">美妆护肤</span> /
            <span class="nav-side-item">丽人</span>
          </li>
          <li @mouseenter="showDetail(12)" @mouseleave="hideDetail()">
            <span class="nav-side-item">房地产</span> /
            <span class="nav-side-item">汽车/交通</span>
          </li>
          <li @mouseenter="showDetail(13)" @mouseleave="hideDetail()">
            <span class="nav-side-item">珠宝配饰</span> /
            <span class="nav-side-item">古董收藏</span>
          </li>
        </ul>
      </div>
      <div class="nav-content">
        <!-- 幻灯片 -->
        <div>
          <Carousel autoplay loop>
              <CarouselItem  v-for="(item, index) in marketing.CarouselItems" :key="index">
                <router-link :to="{path: '/goodsList', query: { sreachData: '电脑'}}">
                  <img :src="item">
                </router-link>
              </CarouselItem>
          </Carousel>
        </div>
        <div class="nav-show">
          <div class="nav-show-img" v-for="(item, index) in marketing.activity" :key="index">
            <router-link :to="{path: '/goodsList', query: { sreachData: '电脑'}}">
              <img :src="item">
            </router-link>
          </div>
        </div>
      </div>
    </div>
    <!-- 菜单栏 -->
    <transition name="fade" v-for="(item, index) in panelData" :key="index">
      <div class="detail-item-panel" :duration="{ enter: 100, leave: 100 }" v-show="actionNav === index" @mouseenter="showDetail(index)" :ref="index" :style="{left: left + 'px', top: top + 'px'}" @mouseleave="hideDetail(index)">
        <div class="nav-detail-item">
          <span v-for="(item, index) in item.navTags" :key="index">{{item}} > </span>
        </div>
        <ul>
          <li v-for="(items, index) in item.classNav" :key="index" class="detail-item-row">
            <span class="detail-item-title">{{items.title}}
              <span class="glyphicon glyphicon-menu-right"></span>
            </span>
            <router-link :to="{path: '/goodsList', query: { sreachData: item }}" v-for="(item, subIndex) in items.tags" :key="subIndex">
              <span class="detail-item">{{item}}</span>
            </router-link>
          </li>
          <li v-for="(items, index) in item.classNav" :key="index" class="detail-item-row">
            <span class="detail-item-title">{{items.title}}
              <span class="glyphicon glyphicon-menu-right"></span>
            </span>
            <router-link :to="{path: '/goodsList', query: { sreachData: item }}" v-for="(item, subIndex) in items.tags" :key="subIndex">
              <span class="detail-item">{{item}}</span>
            </router-link>
          </li>
          <li v-for="(items, index) in item.classNav" :key="index" class="detail-item-row">
            <span class="detail-item-title">{{items.title}}
              <span class="glyphicon glyphicon-menu-right"></span>
            </span>
            <router-link :to="{path: '/goodsList', query: { sreachData: item }}" v-for="(item, subIndex) in items.tags" :key="subIndex">
              <span class="detail-item">{{item}}</span>
            </router-link>
          </li>
          <li v-for="(items, index) in item.classNav" :key="index" class="detail-item-row">
            <span class="detail-item-title">{{items.title}}
              <span class="glyphicon glyphicon-menu-right"></span>
            </span>
            <router-link :to="{path: '/goodsList', query: { sreachData: item }}" v-for="(item, subIndex) in items.tags" :key="subIndex">
              <span class="detail-item">{{item}}</span>
            </router-link>
          </li>
          <li v-for="(items, index) in item.classNav" :key="index" class="detail-item-row">
            <span class="detail-item-title">{{items.title}}
              <span class="glyphicon glyphicon-menu-right"></span>
            </span>
            <router-link :to="{path: '/goodsList', query: { sreachData: item }}" v-for="(item, subIndex) in items.tags" :key="subIndex">
              <span class="detail-item">{{item}}</span>
            </router-link>
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
      left: 0,
      top: 0,
      actionNav: 99,
      nav: [
        '秒杀',
        '优惠券',
        '闪购',
        '拍卖',
        '服装城',
        '超市',
        '生鲜',
        '全球购',
        '金融'
      ],
      panelData: [
        {
          navTags: [ '手机', '手机配件', '电脑整机', '智能数码' ],
          classNav: [
            {
              title: '3C数码',
              tags: [ '手机', '手机配件', '电脑整机', '智能数码', '摄影摄像', '影音娱乐', '硬件存储', '数码配件', '办公设备' ]
            },
            {
              title: '家用电器',
              tags: [ '电视空调', '冰箱', '洗衣机', '厨房小电', '生活电器', '个护健康', '厨卫大电' ]
            }
          ]
        },
        {
          navTags: [ '男鞋', '女鞋', '潮流女包', '精品男包', '功能箱包' ],
          classNav: [
            {
              title: '服饰',
              tags: [ '服饰配件/皮带/帽子/围巾', '女装', '男装', '女士内衣/男士内衣/家居服', '运动户外' ]
            },
            {
              title: '鞋类箱包',
              tags: [ '男鞋', '女鞋', '潮流女包', '精品男包', '功能箱包' ]
            }
          ]
        },
        {
          navTags: [ '居家日用', '餐具水具', '厨具锅具', '床上用品', '家纺布艺' ],
          classNav: [
            {
              title: '母婴',
              tags: [ '奶粉', '辅食/营养品', '纸尿裤/湿巾', '哺育喂养', '清洁洗护', '童装童鞋', '孕妈专区' ]
            },
            {
              title: '居家日用',
              tags: [ '居家日用', '餐具水具', '厨具锅具', '床上用品', '家纺布艺', '宠物园艺', '收纳洗晒', '家装建材', '家具', '家饰' ]
            }
          ]
        },
        {
          navTags: [ '进口食品', '营养保健', '粮油干货', '冲饮乳品', '酒类' ],
          classNav: [
            {
              title: '食品',
              tags: [ '进口食品', '营养保健', '粮油干货', '冲饮乳品', '酒类', '茶叶', '生鲜水果' ]
            },
            {
              title: '餐饮美食',
              tags: [ '火锅', '自助餐', '日韩料理', '小吃快餐', '西餐', '中式料理', '烧烤', '咖啡酒吧茶馆', '甜点饮品' ]
            }
          ]
        },
        {
          navTags: [ '酒吧夜店', 'KTV', '桑拿足浴', '洗浴汗蒸', '按摩' ],
          classNav: [
            {
              title: '休闲娱乐',
              tags: [ '酒吧夜店', 'KTV', '桑拿足浴', '洗浴汗蒸', '按摩', '电影院', '会馆会所', '文艺演出', '私人影院' ]
            },
            {
              title: '旅游酒店',
              tags: [ '酒店', '度假村/农家乐/客栈', '旅馆旅社', '票务服务', '签证服务', '周边游', '其他游玩' ]
            }
          ]
        },
        {
          navTags: [ '基金证券', '银行服务', '保险产品', '金融投资' ],
          classNav: [
            {
              title: '商务办公',
              tags: [ '法律咨询', '财务会计评估', '广告策划公关', '人力资源', '网站建站', '翻译速记', '咨询顾问', '办公耗材' ]
            },
            {
              title: '金融理财',
              tags: [ '基金证券', '银行服务', '保险产品', '金融投资', '理财产品', '金融理财-其他' ]
            }
          ]
        },
        {
          navTags: [ '职业培训', '考试升学', '留学出国', '婴幼儿教育' ],
          classNav: [
            {
              title: '学习培训',
              tags: [ '职业培训', '考试升学', '留学出国', '婴幼儿教育', '外语培训', '远程教育', '家教' ]
            },
            {
              title: '文化体育',
              tags: [ '比赛/文化活动/展览', '体育户外活动', '文化出版', '体育场馆', '图书馆', '文化体育-其他' ]
            }
          ]
        },
        {
          navTags: [ '家政服务', '婚庆婚纱摄影', '搬家搬运', '维修疏通' ],
          classNav: [
            {
              title: '便民生活',
              tags: [ '家政服务', '搬家搬运', '维修疏通', '鲜花速递', '交友征婚', '摄影摄像', '物流快递', '洗衣店' ]
            },
            {
              title: '话费通信',
              tags: [ '移动/联通/电信充值', '手机号码/套餐/增值业务', '话费通信-其他' ]
            }
          ]
        },
        {
          navTags: [ '美发', '美容/SPA', '美甲美睫', '瘦身纤体' ],
          classNav: [
            {
              title: '美妆护肤',
              tags: [ '美容护肤', '彩妆/香水/美妆工具', '美发/护发/假发', '沐浴/个人清洁', '美体/精油', '口腔护理' ]
            },
            {
              title: '丽人',
              tags: [ '美发', '美容/SPA', '美甲美睫', '瘦身纤体', '瑜伽舞蹈', '纹绣', '产后塑性', '整形', '丽人-其他' ]
            }
          ]
        },
        {
          navTags: [ '商务租赁', '房产中介', '装潢设计', '楼盘销售' ],
          classNav: [
            {
              title: '房地产',
              tags: [ '商务租赁', '房产中介', '装潢设计', '楼盘销售', '建材施工', '房地产-其他' ]
            },
            {
              title: '汽车/交通',
              tags: [ '新车/二手车（品牌商）', '汽车（经销商）', '汽车租赁', '汽车美容/保养/用品', '汽车改装', '汽车陪练' ]
            }
          ]
        },
        {
          navTags: [ '玉器', '古董', '收藏', '字画' ],
          classNav: [
            {
              title: '珠宝配饰',
              tags: [ '珠宝/钻石/翡翠/黄金', '腕表', '时尚饰品', '眼镜', '打火机/瑞士军刀' ]
            },
            {
              title: '古董收藏',
              tags: [ '玉器', '古董', '收藏', '字画' ]
            }
          ]
        },
        {
          navTags: [ '美发', '美容/SPA', '美甲美睫', '瘦身纤体' ],
          classNav: [
            {
              title: '美妆护肤',
              tags: [ '美容护肤', '彩妆/香水/美妆工具', '美发/护发/假发', '沐浴/个人清洁', '美体/精油', '口腔护理' ]
            },
            {
              title: '丽人',
              tags: [ '美发', '美容/SPA', '美甲美睫', '瘦身纤体', '瑜伽舞蹈', '纹绣', '产后塑性', '整形' ]
            }
          ]
        },
        {
          navTags: [ '商务租赁', '房产中介', '装潢设计', '楼盘销售' ],
          classNav: [
            {
              title: '房地产',
              tags: [ '商务租赁', '房产中介', '装潢设计', '楼盘销售', '建材施工', '房地产-其他' ]
            },
            {
              title: '汽车/交通',
              tags: [ '汽车美容/保养/用品', '汽车改装', '汽车陪练', '各类配件', '停车场', '航空公司', '汽车/交通-其他' ]
            }
          ]
        },
        {
          navTags: [ '玉器', '古董', '收藏', '字画' ],
          classNav: [
            {
              title: '珠宝配饰',
              tags: [ '珠宝/钻石/翡翠/黄金', '腕表', '时尚饰品', '眼镜', '打火机/瑞士军刀' ]
            },
            {
              title: '古董收藏',
              tags: [ '玉器', '古董', '收藏', '字画' ]
            }
          ]
        }
      ]
    };
  },
  created () {},
  computed: {
    ...mapState(['marketing'])
  },
  methods: {
    showDetail (index) {
      this.actionNav = index;
    },
    hideDetail () {
      this.actionNav = 99;
    }
  },
  updated () {
    this.left = this.$refs.navSide.offsetLeft + this.$refs.navSide.offsetWidth;
    this.top = this.$refs.navSide.offsetTop;
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
.detail-item-panel {
  width: 815px;
  height: 485px;
  background-color: #fff;
  position: absolute;
  top: 168px;
  left: 389px;
  z-index: 999;
}
.nav-detail-item {
  margin-left: 26px;
  margin-top: 15px;
  margin-bottom: 15px;
  cursor: pointer;
  color: #eee;
}
.nav-detail-item span {
  padding: 6px;
  padding-left: 12px;
  margin-left: 15px;
  font-size: 12px;
  background-color: #6e6568;
}
.nav-detail-item span:hover {
  margin-left: 15px;
  background-color: #f44336;
}
.detail-item-panel ul {
  list-style: none;
}
.detail-item-panel li {
  line-height: 38px;
  margin-left: 40px;
}
.detail-item-title {
  padding-right: 6px;
  font-weight: bold;
  font-size: 12px;
  cursor: pointer;
  color: #555555;
}
.detail-item-title:hover {
  color: #d9534f;
}
.detail-item-row a {
  color: #555555;
}
.detail-item{
  font-size: 14px;
  padding-left: 12px;
  padding-right: 8px;
  cursor: pointer;
  border-left: 1px solid #ccc;
}
.detail-item:hover {
  color: #d9534f;
}
</style>
