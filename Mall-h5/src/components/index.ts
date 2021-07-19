import { App } from '@vue/runtime-dom'

//基础组件
import Hr from './base/Hr/index.vue'
import Price from './base/Price/index.vue'
import Search from './base/Search/index.vue'
import Loading from './base/Loading/index.vue'
import PullRefresh from './base/PullRefresh/index.vue'

//业务组件
import Header from './business/Header/index.vue'
import Footer from './business//Footer/index.vue'
import Goods from './business/Goods/index.vue'

const components = {
  //基础组件
  Hr,
  Price,
  Search,
  Loading,
  PullRefresh,
  //业务组件
  Goods,
  Header,
  Footer
}

const install = (Vue: App): void => {
  Object.values(components).forEach((component) => {
    Vue.component(component.name, component)
  })
}

export default { install, ...components }
