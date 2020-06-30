const formCategories = () => {
    const categoryPills = document.querySelectorAll(".category-choice")
    categoryPills.forEach(pill => {
        pill.addEventListener('click', () => {
            pill.classList.toggle('active')
        })
    })
}

export { formCategories }