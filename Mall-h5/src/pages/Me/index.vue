<template>
  <mall-footer class="absolute left-0 bottom-0 right-0" />
</template>

<script>
  import { useRouter } from 'vue-router'
  export default {
    setup() {
      const router = useRouter()
      router.push('/login')
    }
  }
</script>

<style></style>
