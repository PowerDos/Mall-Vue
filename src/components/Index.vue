<template>
  <div class="container">
    <Sreach></Sreach>
    <HomeNav></HomeNav>
    <!-- 商品显示区域 -->
    <div class="content">
      <!-- 秒杀 -->
      <div class="seckill">
        <!-- 头部 -->
        <div class="seckill-head">
          <div class="seckill-icon">
            <img src="/static/img/index/clock.png">
          </div>
          <div class="seckill-text">
            <span class="seckill-title">限时秒杀</span>
            <span class="seckill-remarks">总有你想不到的低价</span>
          </div>
          <div class="count-down">
            <span class="count-down-text">当前场次</span>
            <span class="count-down-num count-down-hour">00</span>
            <span class="count-down-point">:</span>
            <span class="count-down-num count-down-minute">56</span>
            <span class="count-down-point">:</span>
            <span class="count-down-num count-down-seconds">00</span>
            <span class="count-down-text">后结束抢购</span>
          </div>
        </div>
        <!-- 内容 -->
        <div class="seckill-content">
          <div class="seckill-item">
            <div class="seckill-item-img">
              <img src="/static/img/index/seckill/seckill-item1.jpg">
            </div>
            <div class="seckill-item-info">
              <p>【赠小风扇】维他 柠檬茶250ml*32盒 礼品装 整箱</p>
              <p>
                <i class="fa fa-rmb text-danger"></i>
                <span class="seckill-price text-danger">71.9</span>
                <i class="fa fa-rmb"></i>
                <span class="seckill-old-price"></span>
                <s>89.6</s>
              </p>
            </div>
          </div>
          <div class="seckill-item">
            <div class="seckill-item-img">
              <img src="/static/img/index/seckill/seckill-item2.jpg">
            </div>
            <div class="seckill-item-info">
              <p>Kindle Paperwhite 全新升级版6英寸护眼非反光电子墨水</p>
              <p>
                <i class="fa fa-rmb text-danger"></i>
                <span class="seckill-price text-danger">989.0</span>
                <i class="fa fa-rmb"></i>
                <span class="seckill-old-price"></span>
                <s>1299.0</s>
              </p>
            </div>
          </div>
          <div class="seckill-item">
            <div class="seckill-item-img">
              <img src="/static/img/index/seckill/seckill-item3.jpg">
            </div>
            <div class="seckill-item-info">
              <p>粮悦 大吃兄糯米锅巴 安徽特产锅巴糯米原味400g*2盒</p>
              <p>
                <i class="fa fa-rmb text-danger"></i>
                <span class="seckill-price text-danger">21.8</span>
                <i class="fa fa-rmb"></i>
                <span class="seckill-old-price"></span>
                <s>49.0</s>
              </p>
            </div>
          </div>
          <div class="seckill-item">
            <div class="seckill-item-img">
              <img src="/static/img/index/seckill/seckill-item4.jpg">
            </div>
            <div class="seckill-item-info">
              <p>【京东超市】清风（APP）抽纸 原木纯品金装系列 3层</p>
              <p>
                <i class="fa fa-rmb text-danger"></i>
                <span class="seckill-price text-danger">49.9</span>
                <i class="fa fa-rmb"></i>
                <span class="seckill-old-price"></span>
                <s>109.0</s>
              </p>
            </div>
          </div>
          <div class="seckill-item">
            <div class="seckill-item-img">
              <img src="/static/img/index/seckill/seckill-item5.jpg">
            </div>
            <div class="seckill-item-info">
              <p>NIKE耐克 男子休闲鞋 AIR MAX 90 ESSENTIAL 气垫</p>
              <p>
                <i class="fa fa-rmb text-danger"></i>
                <span class="seckill-price text-danger">559</span>
                <i class="fa fa-rmb"></i>
                <span class="seckill-old-price"></span>
                <s>798.0</s>
              </p>
            </div>
          </div>
        </div>
      </div>
      <!-- 电脑专场 -->
      <div class="item-class">
        <div class="item-class-head">
          <span class="item-class-title">电脑数码</span>
          <ul>
            <li>
              <a href="#">电脑馆</a>
            </li>
            <li>
              <a href="#">游戏极品</a>
            </li>
            <li>
              <a href="#">装机大师</a>
            </li>
            <li>
              <a href="#">职场焕新</a>
            </li>
            <li>
              <a href="#">女神频道</a>
            </li>
            <li>
              <a href="#">虚拟现实</a>
            </li>
            <li>
              <a href="#">二合一平板</a>
            </li>
            <li>
              <a href="#">电子教育</a>
            </li>
            <li>
              <a href="#">万物周刊</a>
            </li>
          </ul>
        </div>
        <div class="item-class-content">
          <div class="item-content-top">
            <div class="item-big-img">
              <img src="/static/img/index/computer/item-computer-1.jpg" alt="">
            </div>
            <div class="item-four-img">
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit">电脑馆</p>
                  <p class="pt_bi_promo">笔记本999元限量秒！</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/computer/item-computer-2.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit">外设装备</p>
                  <p class="pt_bi_promo">1000减618</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/computer/item-computer-1-3.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit">电脑配件</p>
                  <p class="pt_bi_promo">联合满减<br>最高省618</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/computer/item-computer-1-4.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit">办公生活</p>
                  <p class="pt_bi_promo">5折神券 精品文具</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/computer/item-computer-1-5.jpg" alt="">
                </div>
              </div>
            </div>
          </div>
          <div class="item-content-bottom">
            <div class="item-content-bottom-img">
              <img src="/static/img/index/computer/item-computer-1-6.jpg">
            </div>
            <div class="item-content-bottom-img">
              <img src="/static/img/index/computer/item-computer-1-7.jpg">
            </div>
            <div class="item-content-bottom-img">
              <img src="/static/img/index/computer/item-computer-1-8.jpg">
            </div>
          </div>
        </div>
        <div class="item-class-content">
          <div class="item-content-top">
            <div class="item-big-img">
              <img src="/static/img/index/computer/item-computer-2-1.jpg" alt="">
            </div>
            <div class="item-four-img">
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit">平板电脑</p>
                  <p class="pt_bi_promo">爆款平板12期免息</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/computer/item-computer-2-2.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit">智能酷玩</p>
                  <p class="pt_bi_promo">抢999减666神券</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/computer/item-computer-2-3.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit">娱乐影音</p>
                  <p class="pt_bi_promo">大牌耳机低至5折</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/computer/item-computer-2-4.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit">摄影摄像</p>
                  <p class="pt_bi_promo">大牌相机5折抢</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/computer/item-computer-2-5.jpg" alt="">
                </div>
              </div>
            </div>
          </div>
          <div class="item-content-bottom">
            <div class="item-content-bottom-img">
              <img src="/static/img/index/computer/item-computer-2-6.jpg">
            </div>
            <div class="item-content-bottom-img">
              <img src="/static/img/index/computer/item-computer-2-7.jpg">
            </div>
            <div class="item-content-bottom-img">
              <img src="/static/img/index/computer/item-computer-2-8.jpg">
            </div>
          </div>
        </div>
      </div>
      <!-- 爱吃专场 -->
      <div class="item-class">
        <div class="item-class-head item-class-eat-head">
          <span class="item-class-title">爱吃</span>
          <ul>
            <li>
              <a href="#">休闲零食</a>
            </li>
            <li>
              <a href="#">坚果</a>
            </li>
            <li>
              <a href="#">牛奶</a>
            </li>
            <li>
              <a href="#">饮料冲调</a>
            </li>
            <li>
              <a href="#">食用油</a>
            </li>
            <li>
              <a href="#">大米</a>
            </li>
            <li>
              <a href="#">白酒</a>
            </li>
            <li>
              <a href="#">红酒</a>
            </li>
            <li>
              <a href="#">烧烤食材</a>
            </li>
            <li>
              <a href="#">牛排</a>
            </li>
            <li>
              <a href="#">樱桃</a>
            </li>

          </ul>
        </div>
        <div class="item-class-content">
          <div class="item-content-top">
            <div class="item-big-img">
              <img src="/static/img/index/eat/item-eat-1-1.jpg" alt="">
            </div>
            <div class="item-four-img">
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit pt_bi_tit-eat">粮油调味</p>
                  <p class="pt_bi_promo">买2免1</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/eat/item-eat-1-2.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit pt_bi_tit-eat">饮料冲调</p>
                  <p class="pt_bi_promo">第二件半价</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/eat/item-eat-1-3.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit pt_bi_tit-eat">休闲零食</p>
                  <p class="pt_bi_promo"> 满99减40</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/eat/item-eat-1-4.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit pt_bi_tit-eat">中外名酒</p>
                  <p class="pt_bi_promo">满199减100</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/eat/item-eat-1-5.jpg" alt="">
                </div>
              </div>
            </div>
          </div>
          <div class="item-content-bottom">
            <div class="item-content-bottom-img">
              <img src="/static/img/index/eat/item-eat-1-6.jpg">
            </div>
            <div class="item-content-bottom-img">
              <img src="/static/img/index/eat/item-eat-1-7.jpg">
            </div>
            <div class="item-content-bottom-img">
              <img src="/static/img/index/eat/item-eat-1-8.jpg">
            </div>
          </div>
        </div>
        <div class="item-class-content">
          <div class="item-content-top">
            <div class="item-big-img">
              <img src="/static/img/index/eat/item-eat-2-1.jpg" alt="">
            </div>
            <div class="item-four-img">
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit pt_bi_tit-eat">东家菜</p>
                  <p class="pt_bi_promo">丰富好味</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/eat/item-eat-2-2.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit pt_bi_tit-eat">东家菜</p>
                  <p class="pt_bi_promo">丰富好味</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/eat/item-eat-2-2.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit pt_bi_tit-eat">东家菜</p>
                  <p class="pt_bi_promo">丰富好味</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/eat/item-eat-2-2.jpg" alt="">
                </div>
              </div>
              <div class="item-four-detail">
                <div class="item-four-detail-text">
                  <p class="pt_bi_tit pt_bi_tit-eat">东家菜</p>
                  <p class="pt_bi_promo">丰富好味</p>
                </div>
                <div class="item-four-detail-img">
                  <img src="/static/img/index/eat/item-eat-2-2.jpg" alt="">
                </div>
              </div>
            </div>
          </div>
          <div class="item-content-bottom">
            <div class="item-content-bottom-img">
              <img src="/static/img/index/eat/item-eat-2-6.jpg">
            </div>
            <div class="item-content-bottom-img">
              <img src="/static/img/index/eat/item-eat-2-7.jpg">
            </div>
            <div class="item-content-bottom-img">
              <img src="/static/img/index/eat/item-eat-2-8.jpg">
            </div>
          </div>
        </div>
      </div>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
import Sreach from '@/components/Sreach'
import HomeNav from '@/components/nav/HomeNav'
import Footer from '@/components/footer/Footer'
export default {
  name: 'Index',
  components: {
    Sreach,
    HomeNav,
    Footer
  }
}
</script>

<style scoped>
.content {
  width: 1008px;
  margin: 0px auto;
}
/*****************************秒杀专栏开始*****************************/
/*秒杀专栏*/
.seckill {
  width: 100%;
  height: 330px;
  margin: 15px auto;
  background-color: #fff;
}
.seckill-head {
  width: 100%;
  height: 50px;
  background-color: #e01222;
}
.seckill-icon {
  width: 68px;
  height: 100%;
  float: left;
}
.seckill-icon img {
  width: 35px;
  height: 35px;
  margin-top: 6px;
  margin-left: 15px;
  animation-name: shake-clock;
  animation-duration: 0.3s;
  animation-iteration-count: infinite; /*设置无线循环*/
}
/*定义闹钟震动动画关键帧*/
@keyframes shake-clock {
  0% {
    transform: rotate(-8deg);
  }
  50% {
    transform: rotate(8deg);
  }
  100% {
    transform: rotate(-8deg);
  }
}
.seckill-text {
  width: 300px;
  height: 100%;
  float: left;
}
.seckill-text .seckill-title {
  font-size: 22px;
  line-height: 50px;
  color: #fff;
}
.seckill-text .seckill-remarks {
  margin-left: 5px;
  font-size: 10px;
  color: #fff;
}
/*倒计时*/
.count-down {
  height: 100%;
  margin-right: 30px;
  line-height: 50px;
  float: right;
}
.count-down-text {
  color: #fff;
}
.count-down-num {
  padding: 3px;
  border-radius: 5px;
  background-color: #440106;
  font-size: 26px;
  font-weight: bold;
  color: #f90013;
}
.count-down-point {
  font-size: 26px;
  font-weight: bold;
  color: #440106;
}

.seckill-content {
  width: 100%;
  height: 280px;
}
.seckill-item {
  width: 183px;
  height: 250px;
  margin-top: 15px;
  margin-left: 15px;
  box-shadow: 0px 0px 8px #ccc;
  float: left;
}
.seckill-item-img {
  width: 160px;
  height: 160px;
  margin: 0px auto;
  overflow: hidden;
  border-bottom: 1px solid #ccc;
  background-color: #fff;
}
.seckill-item-img img {
  width: 130px;
  height: 130px;
  margin-left: 15px;
  margin-top: 15px;
}
.seckill-item-info {
  padding: 5px;
  padding-left: 15px;
  padding-right: 15px;
  font-size: 12px;
  color: #009688;
}
.seckill-item-info i:first-child {
  font-size: 14px;
}
.seckill-price {
  margin-right: 5px;
  font-size: 25px;
  font-weight: bold;
}
/*****************************秒杀专栏结束*****************************/

/*****************************商品专栏开始*****************************/
.item-class {
  width: 100%;
  height: 470px;
  margin-top: 15px;
  background-color: #fff;
}
.item-class-head {
  width: 100%;
  height: 50px;
  background-color: #4488a7;
}
.item-class-eat-head {
  background-color: #ecb226;
}
.item-class-head ul {
  list-style: none;
  float: right;
  margin-right: 30px;
  line-height: 50px;
}
.item-class-head a {
  padding: 6px;
  margin-left: 15px;
  font-size: 12px;
  background-color: #6da6be;
  border: 1px solid #6da6be;
  text-decoration: none;
  color: #fff;
}
.item-class-eat-head a {
  background-color: #eeb955;
  border: 1px solid #eeb955;
}
.item-class-head a:hover {
  border: 1px solid #fff;
}
.item-class-head li {
  float: left;
}
.item-class-title {
  font-size: 25px;
  line-height: 50px;
  color: #fff;
  margin-left: 15px;
}
.item-class-content {
  width: 49%;
  cursor: pointer;
  border-right: 1px solid #ccc;
  margin-left: 0.9%;
  /*background-color: #cff;*/
  float: left;
}
.item-class-content:nth-child(odd) {
  border: none;
}
.item-content-top {
  width: 100%;
  height: 260px;
}
.item-big-img {
  width: 180px;
  height: 260px;
  overflow: hidden;
  float: left;
}
.item-four-img {
  width: 303px;
  margin-left: 8px;
  float: left;
}
.item-four-detail {
  width: 152px;
  height: 130px;
  margin-left: -1px;
  float: left;
}
.item-four-detail:first-child {
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
.item-four-detail:last-child {
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;
}
.item-four-detail-text {
  width: 50px;
  margin-left: 5px;
  margin-top: 15px;
  float: left;
}
.item-four-detail-img {
  width: 96px;
  margin-top: 15px;
  overflow: hidden;
  float: left;
}
.item-four-detail-img img {
  margin-left: 5px;
  width: 90px;
}
.pt_bi_tit {
  font-weight: bold;
  font-size: 12px;
  color: #4488a7;
}
.pt_bi_tit-eat {
  color: #ecb127;
}
.pt_bi_promo {
  color: #00695c;
}
.item-content-bottom {
  width: 100%;
  margin-top: 8px;
}
.item-content-bottom-img {
  width: 156px;
  margin-right: 8px;
  overflow: hidden;
  float: left;
}
/*****************************商品专栏结束*****************************/
</style>
