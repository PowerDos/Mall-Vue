<template>
  <div>
    <footer class="footer">
      <div class="clearfix"></div>
      <div class="icon-row">
        <div class="footer-icon">
          <h5 class="footer-icon-child"></h5>
          <span class="footer-icon-text">品类齐全，轻松购物</span>
        </div>
        <div class="footer-icon">
          <h5 class="footer-icon-child footer-icon-child-2"></h5>
          <span class="footer-icon-text">多仓直发，极速配送</span>
        </div>
        <div class="footer-icon">
          <h5 class="footer-icon-child footer-icon-child-3"></h5>
          <span class="footer-icon-text">正品行货，精致服务</span>
        </div>
        <div class="footer-icon">
          <h5 class="footer-icon-child footer-icon-child-4"></h5>
          <span class="footer-icon-text">天天低价，畅选无忧</span>
        </div>
      </div>
      <div class="service-intro">
        <div class="servece-type">
          <div class="servece-type-info">
            <ul>
              <li>购物指南</li>
              <li>购物流程</li>
              <li>会员介绍</li>
              <li>生活旅行</li>
              <li>常见问题</li>
              <li>大家电</li>
              <li>联系客服</li>
            </ul>
          </div>
          <div class="servece-type-info">
            <ul>
              <li>配送方式</li>
              <li>上门自提</li>
              <li>211限时达</li>
              <li>配送服务查询</li>
              <li>收取标准</li>
              <li>海外配送</li>
            </ul>
          </div>
          <div class="servece-type-info">
            <ul>
              <li>支付方式</li>
              <li>货到付款</li>
              <li>在线支付</li>
              <li>分期付款</li>
              <li>邮局汇款</li>
              <li>公司转账</li>
            </ul>
          </div>
          <div class="servece-type-info">
            <ul>
              <li>售后服务</li>
              <li>售后政策</li>
              <li>价格保护</li>
              <li>退款说明</li>
              <li>返修/退换货</li>
              <li>取消订单</li>
            </ul>
          </div>
        </div>
        <div class="clearfix"></div>
        <div class="friend-link">
          <div class="friend-link-item">
            <ul>
              <li>
                <span class="link-item">关于我们</span>
              </li>
              <li>
                <span class="link-item">联系我们</span>
              </li>
              <li>
                <span class="link-item">联系客服</span>
              </li>
              <li>
                <span class="link-item">合作招商</span>
              </li>
              <li>
                <span class="link-item">商家帮助</span>
              </li>
              <li>
                <span class="link-item">营销中心</span>
              </li>
              <li>
                <span class="link-item">销售联盟</span>
              </li>
              <li>
                <span class="link-item">校园社区</span>
              </li>
              <li>
                <span class="link-item">风险监测</span>
              </li>
              <li>
                <span class="link-item link-last-item">隐私政策</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="clearfix"></div>
        <div class="copyright">
          <p>Copyright © 2018 BY Gavin 林智杰</p>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'Footer'
}
</script>

<style scoped>
/*****************************底 部 开 始*****************************/
.footer {
  width: 100%;
  height: 390px;
  margin-top: 30px;
  background-color: #eaeaea;
}
.icon-row {
  margin: 15px auto;
  padding-top: 8px;
  width: 1000px;
  height: 64px;
}
.footer-icon {
  margin-left: 17px;
  margin-right: 17px;
  float: left;
}
.footer-icon-child {
  margin-top: 10px;
  overflow: hidden;
  position: absolute;
  width: 36px;
  height: 42px;
  background-image: url(/static/img/footer/ico_service.png);
  text-indent: -999px;
}
.footer-icon-child-2 {
  background-position: 0 -43px;
}
.footer-icon-child-3 {
  background-position: 0 -86px;
}
.footer-icon-child-4 {
  background-position: 0 -129px;
}
.footer-icon-text {
  margin-left: 45px;
  color: #444444;
  font-size: 18px;
  font-weight: bold;
  line-height: 64px;
}
.service-intro {
  width: 100%;
  border-top: 1px solid #b2dfdb;
}
.servece-type {
  margin: 15px auto;
  height: 200px;
  width: 800px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.servece-type-info {
  color: #666666;
}
.servece-type-info ul {
  list-style: none;
}
.servece-type-info li {
  font-size: 14px;
  cursor: pointer;
  line-height: 26px;
}
.servece-type-info li:first-child {
  font-size: 16px;
  line-height: 28px;
  font-weight: bold;
}
.friend-link {
  width: 908px;
  height: 30px;
  margin: 0px auto;
  color: #666;
  border-top: 1px solid #b2dfdb;
}
.friend-link-item {
  width: 800px;
  margin: 0px auto;
}
.friend-link-item ul {
  list-style: none;
}
.friend-link-item li {
  padding: 5px 0px;
  float: left;
}
.link-item {
  padding: 0px 8px;
  cursor: pointer;
  border-right: 1px solid #ccc;
}
.link-last-item {
  border: none;
}
.copyright {
  width: 100%;
  color: #666;
  line-height: 30px;
  cursor: pointer;
  text-align: center;
}
/*****************************底 部 结 束*****************************/
</style>
