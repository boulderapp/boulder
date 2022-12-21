import clsx from 'clsx'
import { MouseEventHandler, SetStateAction } from 'react'
import useToggle from "../../utils/useFunctions/useToggle"

 interface Icolors { 
	[key: string]: string
 }
 const colors: Icolors = { 
	orange: "bg-boulder-orange",
	blue: "bg-boulder-blue",
	pink: "bg-boulder-pink",
	brown: "bg-boulder-orange",
	beige: "bg-boulder-beige"
 }

const BaseButton = ({ onClick = () => {}, color = "bg-boulder-orange", children } : {onClick: () => void, color: string, children: string}

 ) => { 
	const [isToggled, toggleValueTest] = useToggle(false)

	const displayColor = isToggled ? color : 'bg-boulder-blue'
const handleClick: MouseEventHandler= (e) => { 
	e.preventDefault()
	toggleValueTest()
	console.log(isToggled)
	
}
	const buttonStyles: string = clsx(colors[color])
	return ( 
		<button className={`${displayColor} p-1 pl-4 text-xl border-2  text-boulder-brown border-boulder-brown text-start`} onClick={handleClick}>{isToggled ? "pressed" : "not pressed"}</button>
	)	
 }



export default BaseButton