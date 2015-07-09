$(document).ready(function(){
  $('[data-behaviour~=datepicker]').datepicker({
    "format": "dd/mm/yyyy",
    "weekStart": 1,
    "language": "fr",
    "startDate": "01/01/1900",
    "startView": "year",
    "endDate": "today",
  });
});

$(function(){
  $('input.datetimepicker').datetimepicker({
    minDate: 0,
  });
});


