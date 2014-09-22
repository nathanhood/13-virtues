(function(){
  'use strict';

  $(document).ready(init);

  function init(){
    checkTotalVirtues();
    $('.show-add-virtue').click(showAddVirtueContainer);
    $('.hide-add-virtue').click(hideAddVirtueContainer);
  }

  function checkTotalVirtues(){
    var virtues = $('.add-virtues-wrapper').data('virtues') * 1;

    if (virtues > 0) {
      $('.add-virtues-wrapper').hide();
      $('.show-add-virtue').show();
    } else {
      $('.add-virtues-wrapper').css('visibility', 'visible');
    }
  }

  function showAddVirtueContainer(){
    $('.add-virtues-wrapper').css('visibility', 'visible');
    $('.add-virtues-wrapper').slideToggle();
    $('.show-add-virtue button').hide();
  }

  function hideAddVirtueContainer(event){
    event.preventDefault();
    $('.add-virtues-wrapper').slideToggle(function(){
      $('.show-add-virtue button').show();
    });
  }

})();
