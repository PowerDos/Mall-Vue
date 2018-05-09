<template>
  <div>
    <div class="container">
      <Input v-model="sreachData" size="large">
        <Button slot="append" icon="ios-search"></Button>
      </Input>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Sreach',
  data () {
    return {
      sreachData: ''
    }
  }
}
</script>

<style scoped>
.container {
  margin: 15px auto;
  width: 460px;
}
</style>
