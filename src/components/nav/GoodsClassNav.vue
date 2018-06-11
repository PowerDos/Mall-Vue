/*
 * @Author: Gavin
 * @Date: 2018-06-11 11:27:10
 * @Last Modified by: Gavin
 * @Last Modified time: 2018-06-11 12:23:40
 * @Describe: 搜索商品导航标签
 */
<template>
  <div class="item-class-show">
    <Row class="item-class-group" v-for="(items, index) in tagsInfo" :key="index">
      <i-col class="item-class-name" span="3">{{ items.tagName }} : </i-col>
      <i-col class="item-class-select" span="21">
        <span v-for="(item, subIndex) in items.tags" :key="subIndex">{{ item }}</span>
      </i-col>
    </Row>
  </div>
</template>

<script>
export default {
  name: 'GoodsClassNav',
  data () {
    return {
      tagsInfo: [
        {
          tagName: '品牌',
          tags: [ '华为(HUAWEI)', '三星(SAMSUNG)', 'MATE', '摩斯维(msvii)', 'OPPO', '莫凡(Mofi)', '耐尔金(NILLKIN)', '洛克(ROCK)', '亿色(ESR)', 'Apple', '优加' ]
        },
        {
          tagName: '手机配件',
          tags: [ '手机保护套', '苹果周边', '手机贴膜', '移动电源', '创意配件', '手机耳机', '手机支架' ]
        },
        {
          tagName: '款式',
          tags: [ '软壳', '硬壳', '翻盖式', '边框', '运动臂包', '钱包式', '定制', '防水袋', '布袋', '其他' ]
        },
        {
          tagName: '材质',
          tags: [ '塑料/PC', '硅胶', '金属', '电镀', '真皮', '树脂', '木质', '镶钻', '液态硅胶', 'TPU' ]
        }
      ]
    };
  }
};
</script>

<style scoped>
.item-class-show {
  margin: 15px auto;
  width: 100%;
}
.item-class-group {
  margin-top: 1px;
  height: 45px;
  border-bottom: 1px solid #ccc;
}
.item-class-group:first-child {
  border-top: 1px solid #ccc;
}
.item-class-name {
  padding-left: 15px;
  line-height: 44px;
  color: #666;
  font-weight: bold;
  background-color: #f3f3f3;
}
.item-class-name:first-child {
  line-height: 43px;
}
.item-class-select span {
  margin-left: 15px;
  width: 160px;
  color: #005aa0;
  line-height: 45px;
  cursor: pointer;
}
</style>
