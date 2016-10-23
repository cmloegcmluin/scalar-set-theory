const arraysEqual = (arr1, arr2) => arr1.every((el, i) => {
	return Array.isArray(el) ? arraysEqual(el, arr2[i]) : el === arr2[i]
})

export default arraysEqual