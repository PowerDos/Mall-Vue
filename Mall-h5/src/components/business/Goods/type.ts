export enum GoodType {
  LIST = 'list',
  CARD = 'card'
}

export interface GoodListItem {
  img: string
  title: string
  shops: string
  price: number
  evaluation: string
  highPraise: string
  oldPrice?: number
  tag?: string
  traits?: string[]
}
