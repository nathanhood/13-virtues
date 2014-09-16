(function(){
  'use strict';

  $(document).ready(init);

  function init(){
    $('select.add-virtues-select').combobox();
    checkTotalVirtues();
    $('.show-add-virtue').click(showAddVirtueContainer);
    $('.hide-add-virtue').click(hideAddVirtueContainer);
    $('.find-virtue-input').on('focus', trackValueOfVirtueInput);
    $('.find-virtue-input').on('blur', getValueFromVirtueInput);
    $('.show-final-virtue').on('click', showFinalInput);
  }

  function showFinalInput(event){
    event.preventDefault();
    $('.final-virtue-wrapper').slideToggle();
  }

  var input;

  function trackValueOfVirtueInput(){
    $('.find-virtue-input').on('keyup', function(){
      input = $('.find-virtue-input').val();
    });
  }

  function getValueFromVirtueInput(){
    var inputValue = $('.find-virtue-input').val();
    if (inputValue === '') {
      $('.final-virtue-input').val(input);
    } else {
      $('.final-virtue-input').val(inputValue);
    }
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
