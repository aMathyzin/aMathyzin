document.addEventListener('DOMContentLoaded', function() {
  var countdownText = document.getElementById('countdown-text');
  var countdownTime = 5; // tempo inicial em segundos

  var interval = setInterval(function() {
    countdownText.textContent = countdownTime;
    countdownTime--;
    if (countdownTime < 0) {
      clearInterval(interval);
      document.getElementById('proceed-button').style.display = 'inline-block';
    }
  }, 1000);
});
