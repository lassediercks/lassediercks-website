
function hover(event) {
  ga('send', 'event', {
    eventCategory: 'Link Hover',
    eventAction: 'Hover',
    eventLabel: event.target.href
  });
}



document.addEventListener("DOMContentLoaded", function(event) {

  document.getElementById('footer-contact').addEventListener('mouseover', function(){
    hover(this);
  }, false);

});
