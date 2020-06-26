const addPost = () => {
  $(document).ready(function(){
    $(".category-choice").click(function(){
      $(this).toggleClass("active");
    });
  });
};

export { addPost };
