// const fillHeart = () => {
//   const heartButtons = document.querySelectorAll('.fa-heart');
//   if (heartButtons) {
//     heartButtons.forEach(function(element) {
//       element.addEventListener('click', (event) => {
//         element.classList.toggle('fas');
//         element.classList.toggle('fal');
//       });
//     });
//   };
// };

const fillHeart = () => {
  const counters = document.querySelectorAll('.post-reactions');
  if (counters) {
    console.log(counters);
    counters.forEach(function(element) {
      const heart = element.querySelector('.fa-heart');
      const like = element.querySelector('.like-count');
      console.log(heart);
      console.log(like);
      heart.addEventListener('click', (event) => {
        var count = data.count
        console.log(count);
        heart.classList.toggle('fas');
        heart.classList.toggle('fal');
        like.insertAdjacentHtml('beforeend','<%=@new_count%>');

        });
      });
    };
};

export { fillHeart };



