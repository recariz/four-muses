const fillHeart = () => {
  const heartButtons = document.querySelectorAll('.fa-heart');
  if (heartButtons) {
    console.log(heartButtons)
    heartButtons.forEach(function(element) {
      console.log(element);
      element.addEventListener('click', (event) => {
        element.classList.toggle('fas');
        element.classList.toggle('fal');
      });
    });
  };
};

export { fillHeart };
