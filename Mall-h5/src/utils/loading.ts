import { createApp, createVNode } from 'vue'
import MallLoading from '@/components/base/Loading/index.vue'
import { Loading } from 'vant'

let instance

export function $loading() {
  if (instance) return
  const loading = createVNode(MallLoading)
  const root = document.createElement('div')
  root.style.width = '100%'
  root.style.height = '100%'
  root.style.position = 'fixed'
  root.style.left = '0'
  root.style.top = '0'
  document.body.appendChild(root)
  const app = createApp(loading)
  instance = app.use(Loading).mount(root)
  return {
    el: instance,
    close: () => {
      app.unmount()
      document.body.removeChild(root)
    }
  }
}
