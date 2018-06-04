<template>
  <div>
    <div class="container">
      <Input v-model="sreachData" size="large" class="sreach">
        <Button slot="append" icon="ios-search"></Button>
      </Input>
      <Tag v-for="(item, index) in promotionTags" :key="index" closable  @on-close="closeTags(index)"><span @click="selectTags(index)">{{item}}</span></Tag>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Sreach',
  data () {
    return {
      sreachData: '',
      promotionTags: ['买2免1', '领200神券', '199减100', '母婴5折抢', '充100送20']
    }
  },
  methods: {
    closeTags (index) {
      this.promotionTags.splice(index, 1)
    },
    selectTags (index) {
      this.sreachData = this.promotionTags[index]
    }
  }
}
</script>

<style scoped>
.container {
  padding-top: 15px;
  margin: 0px auto;
  margin-bottom: 15px;
  width: 460px;
}
.sreach {
  margin: 5px 0px;
}
</style>
