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
        <span v-for="(item, subIndex) in items.tags" :key="subIndex" @click="select(item.id,$event)">{{ item.attributeValue }}</span>
      </i-col>
    </Row>
  </div>
</template>

<script>
import {mapActions} from 'vuex';

export default {
  name: 'GoodsClassNav',
  data () {
    return {
      tagsInfo: [
        {
          tagName: '正在加载...',
          tags: ['正在加载...']
        }
      ],
      selectedAttribute: new Set()
    };
  },
  methods: {
    ...mapActions(['loadAttributes']),
    select (attributeId, event) {
      let isChose = event.target.style.color === 'red';
      if (isChose) {
        console.log(attributeId + '取消选择');
        event.target.style.color = '#005aa0';
        this.selectedAttribute.delete(attributeId);
      } else {
        console.log(attributeId + '选择');
        event.target.style.color = 'red';
        this.selectedAttribute.add(attributeId);
      }
      console.log(this.selectedAttribute);
    }
  },
  mounted () {
    if (this.$route.query.categoryId !== undefined) {
      this.loadAttributes(this.$route.query.categoryId).then(attributes => {
        this.tagsInfo = attributes;
      });
    } else if (this.$route.query.sreachData !== undefined) {
      this.tagsInfo = [
        {
          tagName: this.$route.query.sreachData,
          tags: ['一下是根据您输入的关键字筛选的结果']
        }
      ];
      // this.loadAttributes(this.$route.query.categoryId).then(attributes => {
      //   this.tagsInfo = attributes;
      // });
    }
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
