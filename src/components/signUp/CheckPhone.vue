<template>
  <div>
    <Form :model="formValidate" :label-width="60" :rules="ruleValidate">
      <FormItem label="手机号" prop="phone">
          <Input v-model="formValidate.phone" placeholder="请输入手机号"></Input>
      </FormItem>
      <FormItem label="验证码" prop="checkNum">
          <Input v-model="formValidate.checkNum" placeholder="请输入验证码">
            <Button slot="append" @click="getcheckNum">获取验证码</Button>
          </Input>
      </FormItem>
      <Button type="primary" size="large" long @click="next">验证手机号</Button>
    </Form>
  </div>
</template>

<script>
export default {
  name: 'CheckPhone',
  data () {
    return {
      formValidate: {
        phone: '',
        checkNum: ''
      },
      ruleValidate: {
        phone: [
          { required: true, message: '手机号不能为空', trigger: 'blur' },
          { type: 'string', pattern: /^1[3|4|5|7|8][0-9]{9}$/, message: '手机号格式出错', trigger: 'blur' }
        ],
        checkNum: [
          { required: true, message: '必须填写验证码', trigger: 'blur' },
          { type: 'string', min: 4, max: 4, message: '验证码长度错误', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    getcheckNum () {
      if (this.formValidate.phone.length === 11) {
        this.$Message.success({
          content: '验证码为: 1234',
          duration: 6,
          closable: true
        })
      } else {
        this.$Message.error({
          content: '请输入正确的手机号',
          duration: 6,
          closable: true
        })
      }
    },
    next () {
      if (this.formValidate.phone.length === 11 && this.formValidate.checkNum === '1234') {
        this.$router.push({ path: '/SignUp/inputInfo' })
      } else {
        this.$Message.error({
          content: '请填写正确的信息',
          duration: 6,
          closable: true
        })
      }
    }
  }
}
</script>
