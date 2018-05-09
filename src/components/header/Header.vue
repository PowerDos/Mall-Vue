<template>
  <div class="box">
    <div class="nav">
      <ul class="location">
        <li>
          <Dropdown  placement="bottom-start">
            <a href="javascript:void(0)">
              <Icon type="ios-location" class="icon"></Icon> {{city}}
            </a>
            <DropdownMenu slot="list">
              <div class="city">
                <p v-for="(items, index) in cityArr" :key="index">
                  <span v-for="(item, index) in items"  class="city-item" :key="index" @click="changeCity(item)">{{item}}</span>
                </p>
              </div>
            </DropdownMenu>
          </Dropdown>
        </li>
      </ul>
      <ul class="detail">
        <li class="first">你好，请<a href="login.html">登录 </a>|<span class="text-color-red"><a href="signup.html">免费注册</a></span></li>
        <li><a href="#">购物车</a> <span class="glyphicon glyphicon-menu-down"></span></li>
        <li><a href="#">手机商城</a></li>
        <li><a href="#">网站导航</a></li>
        <li><a href="help.html">客户服务</a></li>
        <li><a href="#">企业采购</a></li>
        <li><a href="#">商城会员</a></li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'M-Header',
  data () {
    return {
      city: '珠海',
      cityArr: [
        ['北京', '上海', '天津', '重庆', '广州'],
        ['深圳', '河南', '辽宁', '吉林', '江苏'],
        ['江西', '四川', '海南', '贵州', '云南'],
        ['西藏', '陕西', '甘肃', '青海', '珠海']
      ]
    }
  },
  methods: {
    changeCity (city) {
      this.city = city
    }
  }
}
</script>

<style scoped>
.box {
  width: 100%;
  height: 35px;
  background-color: #e3e4e5;
}
.nav {
  margin: 0% auto;
  width: 90%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.nav ul {
  list-style: none;
}
.nav li {
  float: left;
  font-size: 14px;
  line-height: 35px;
  margin-right: 15px;
  font-weight: bold;
}
.nav a {
  text-decoration: none;
  color: #999999;
  padding-left: 15px;
  border-left: 1px solid #ccc;
  cursor: pointer;
}
.location a {
  border-left: none;
}
.nav a:hover {
  color: #d9534f;
}
.location {
  color: #999999;
}
.icon {
  color: #d9534f;
}
.first {
  color: #999999;
}
.first a:first-child {
  padding-left: 3px;
  border-left: none;
}
.city {
  padding: 10px 15px;
}
.city-item {
  font-weight: bold;
  cursor: pointer;
  padding: 5px;
}
.city-item:hover {
  color: #d9534f;
}
</style>
