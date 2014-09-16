(function(){
  'use strict';

  $(document).ready(init);

  function init(){
    $('select.add-virtues-select').combobox();
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
      $('.add-virtues-wrapper').show();
    }
  }

  function showAddVirtueContainer(){
    $('.add-virtues-wrapper').slideToggle();
    $('.show-add-virtue').hide();
  }

  function hideAddVirtueContainer(event){
    event.preventDefault();
    $('.add-virtues-wrapper').slideToggle(function(){
      $('.show-add-virtue').show();
    });
  }

})();
