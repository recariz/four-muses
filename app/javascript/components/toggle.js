const toggle = document.getElementById('toggle-section');
const feedGeneral = document.getElementById('feed-general');
const feedFollows = document.getElementById('feed-follows');
const toggleBall = document.getElementById('ball');

const toggleSwitch = () => {
  if (toggle) {
    toggle.addEventListener('click', (event) => {
      feedFollows.classList.toggle('active');
      feedGeneral.classList.toggle('active');
      toggleBall.classList.toggle('active');
      window.scrollTo(0,0);
      // $(window).load(function(){
      //  $(window).scrollTop(0);
      // });
    });
  };
};

export { toggleSwitch };
