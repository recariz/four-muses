const showComments = () => {
  const seeComments = document.querySelectorAll('.display-comments');
  if (seeComments) {
    seeComments.forEach(function(element) {
      const hiddenComments = element.querySelector('.hidden-comments');
      const commentsLink = element.querySelector('.display-comments-link');
      const hideLink = element.querySelector('.hide-comments-link');
      element.addEventListener('click', (event) => {
        hiddenComments.classList.toggle('active');
        commentsLink.classList.toggle('active');
        hideLink.classList.toggle('active');
      });
    });
  };
};

export { showComments };
