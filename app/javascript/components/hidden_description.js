const showDescription = () => {
  const seeDescription = document.querySelectorAll('.post-description-toggle');
  if (seeDescription) {
    seeDescription.forEach(function(element) {
      const shortDescription = element.querySelector('.short-description');
      const fullDescription = element.querySelector('.full-description');
      const showDescriptionLink = element.querySelector('.show-description-link');
      const hideDescriptionLink = element.querySelector('.hide-description-link');
      element.addEventListener('click', (event) => {
        shortDescription.classList.toggle('active');
        fullDescription.classList.toggle('active');
        showDescriptionLink.classList.toggle('active');
        hideDescriptionLink.classList.toggle('active');
      });
    });
  };
};

export { showDescription };
