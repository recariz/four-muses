const seeComments = document.querySelectorAll('.display-comments');

console.log(seeComments);

const hiddenComments = document.querySelectorAll('.hidden-comments');
console.log(hiddenComments);

const showComments = () => {
  if (seeComments) {
    seeComments.addEventListener('click', (event) => {
      hiddenComments.classList.toggle('active');
      if (seeComments.innerHTML === "Hide Comments") {
        seeComments.innerHTML = "See all <%= post.comments.count %> comments...";
      } else {
        seeComments.innerHTML = "Hide Comments";
      }
    });
  };
};

export { showComments };
