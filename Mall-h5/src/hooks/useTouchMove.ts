import {
  $,
  getTranslateValue,
  setTranslate,
  setTranslateX,
  setTranslateY
} from '@/utils/dom'
import { onBeforeUnmount, onMounted, ref } from 'vue'

export enum TouchMoveType {
  x = 0,
  y,
  all
}
/**
 *用于给元素添加滑动特效
 * @param domName 拖动元素querySelector的name
 * @param boxName 父盒子querySelector的name
 * @param type 拖动方式 0：横向 1：纵向 2：所有方向
 * @param offset 拖动临界点的偏移量  小于0为无限  大于0为offset值
 */
export default function (
  domName: string,
  boxName: string,
  type: TouchMoveType = TouchMoveType.x,
  offset = -1
) {
  const dom = ref()
  const isMove = ref(false)
  const offsetX = ref(-1)
  const offsetY = ref(-1)
  const beginX = ref(-1)
  const beginY = ref(-1)
  const beginTranslateX = ref(-1)
  const beginTranslateY = ref(-1)
  const handleTouchStart = (e: TouchEvent) => {
    const target = e.targetTouches[0]
    const [translateX, translateY] = getTranslateValue(dom.value)
    beginTranslateX.value = translateX
    beginTranslateY.value = translateY
    isMove.value = true
    beginX.value = target.pageX
    beginY.value = target.pageY
  }
  const handleTouchEnd = () => {
    const [translateX, translateY] = getTranslateValue(dom.value)

    if (translateX > 0) {
      setTranslateX(dom.value, 0)
    } else if (offsetX.value + translateX < 0) {
      setTranslateX(dom.value, offsetX.value)
    }

    if (translateY > 0) {
      setTranslateY(dom.value, 0)
    } else if (offsetY.value + translateY < 0) {
      setTranslateY(dom.value, -offsetY.value)
    }

    isMove.value = false
    beginX.value = -1
    beginY.value = -1
    beginTranslateX.value = -1
    beginTranslateY.value = -1
  }

  const handleTouchMove = (e: any) => {
    if (!isMove.value) return

    const target = e.targetTouches[0]
    const scrollX = target.pageX - beginX.value + beginTranslateX.value
    const scrollY = target.pageY - beginY.value + beginTranslateY.value
    const maxScrollX =
      scrollX > offset
        ? offset
        : scrollX + offset + offsetX.value < 0
        ? -offsetX.value - offset
        : scrollX
    const maxScrollY =
      scrollY > offset
        ? offset
        : scrollY + offset + offsetY.value < 0
        ? -offsetY.value - offset
        : scrollY
    switch (type) {
      case TouchMoveType.x:
        if (offset < 0) setTranslateX(dom.value, scrollX)
        else setTranslateX(dom.value, maxScrollX)
        break
      case TouchMoveType.y:
        if (offset < 0) setTranslateY(dom.value, scrollY)
        else setTranslateY(dom.value, maxScrollY)
        break
      case TouchMoveType.all:
        if (offset < 0) setTranslate(dom.value, [scrollX, scrollY])
        else setTranslate(dom.value, [maxScrollX, maxScrollY])
        break
    }
  }
  onMounted(() => {
    dom.value = $(domName) as any
    const boxDom = $(boxName) as any
    if (dom.value) {
      offsetY.value =
        dom.value.offsetHeight - boxDom.offsetHeight > 0
          ? dom.value.offsetHeight - boxDom.offsetHeight
          : 0
      offsetX.value =
        dom.value.offsetWidth - boxDom.offsetWidth > 0
          ? dom.value.offsetWidth - boxDom.offsetWidth
          : 0
      dom.value.style.transition = 'transform 0.3s ease'
      dom.value.addEventListener('touchstart', handleTouchStart)
      dom.value.addEventListener('touchend', handleTouchEnd)
      dom.value.addEventListener('touchmove', handleTouchMove)
    }
  })
  onBeforeUnmount(() => {
    if (dom.value) {
      dom.value.removeEventListener('touchstart', handleTouchStart)
      dom.value.removeEventListener('touchend', handleTouchEnd)
      dom.value.removeEventListener('touchmove', handleTouchMove)
      dom.value = null
    }
  })
}
