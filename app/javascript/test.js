$(document).ready(function() {
  const s_rounds = document.querySelectorAll('.s_round');
  s_rounds.forEach((s_round) => {
    $(s_round).click(function() {
      $('.flip_box').toggleClass('flipped');
      $(this).addClass('s_round_click');
      $('.s_arrow').toggleClass('s_arrow_rotate');
      return false;
    });
  });

  const correctButton = document.getElementById('correct')
  const incorrectButton = document.getElementById('incorrect')
  correctButton.addEventListener('mouseover', () => {
    correctButton.setAttribute('style', 'background-color:#b5e7bc;')
  });
  correctButton.addEventListener('mouseout', () => {
    correctButton.removeAttribute('style', 'background-color:#b5e7bc;')
  });
  
  incorrectButton.addEventListener('mouseover', () => {
    incorrectButton.setAttribute('style', 'background-color:#FFBEDA;')
  });
  incorrectButton.addEventListener('mouseout', () => {
    incorrectButton.removeAttribute('style', 'background-color:#FFBEDA;')
  });
});