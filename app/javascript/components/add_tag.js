
const addTag = () => {
  const tags = document.querySelectorAll(".js-checkbox")
  tags.forEach((tag) => {
    tag.addEventListener('click', () => {
      tag.classList.toggle("active")
      const input = tag.querySelector("input")

      input.checked = !input.checked;
    })
  })
}

export { addTag };
