import { useState } from 'react'

export const useToggle = (initValue: boolean = false) => {
  const [value, setValue] = useState<boolean>(initValue)
  const toggleValue = () => setValue((x) => !x)
  return [ value, toggleValue] as const
}

export default useToggle
