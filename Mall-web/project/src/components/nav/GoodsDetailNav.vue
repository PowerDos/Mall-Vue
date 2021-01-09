<template>
  <div class="shop-nav-box">
    <div class="shop-nav-container">
      <ul>
        <li v-for="(item, index) in shopNav" :key="index">
          <router-link to="/merchant">{{item}}</router-link>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'GoodsDetailNav',
  data () {
    return {
      shopNav: [ '首页', 'iPhoneX', 'iPhone8', 'OnePlus', '坚果Pro', 'Note8' ]
    };
  }
};
</script>

<style scoped>
.shop-nav-box {
  height: 38px;
  background-color: #333333 !important;
}

.shop-nav-container {
  width: 80%;
  height: 100%;
  margin: 0px auto;
}

.shop-nav-container ul {
  padding: 0px;
  margin: 0px;
  list-style: none;
}

.shop-nav-container li {
  float: left;
  margin-right: 30px;
  line-height: 35px;
}

.shop-nav-container a {
  text-decoration: none;
  color: rgb(233, 224, 224);
  font-weight: bold;
}
</style>
