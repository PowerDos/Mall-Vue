import dayjs from 'dayjs'

export function convertMoney(money: number): string {
  if (!money || Number.isNaN(Number(money))) {
    return (0).toFixed(2)
  }
  return (money / 100).toFixed(2)
}

export function parseTime(
  date: number | string,
  format: undefined | string
): string {
  if (!date) return '--'
  const dateStr = dayjs(date).format(format)
  return dateStr === 'Invalid Date' ? '--' : dateStr
}
