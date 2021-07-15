export function getTranslateValue(dom: any) {
  const transform = dom.style.transform
  return transform
    ? transform
        .replace(/[ ()(px)(translate)]/g, '')
        .split(',')
        .map((i: string) => (i ? Number(i) : 0))
    : [0, 0]
}

export function setTranslateX(dom: any, val: number) {
  const [_, y] = getTranslateValue(dom)
  dom.style.transform = `translate(${val}px, ${y}px)`
}

export function setTranslateY(dom: any, val: number) {
  const [x, _] = getTranslateValue(dom)
  dom.style.transform = `translate(${x}px, ${val}px)`
}

export function setTranslate(dom: any, val: number[]) {
  dom.style.transform = `translate(${val[0]}px, ${val[1]}px)`
}

export function $(domName: string) {
  return document.querySelector(domName)
}
