$(function(){
  $("#create_event").hide();
  $('a[rel*=facebox]').facebox();
  $(document).bind('reveal.facebox', function() {
    $('.datepicker').datetimepicker({dateFormat: "dd/mm/yy", minDate: new Date()});
    $("#event_price").maskMoney({allowZero: true});
  });
});
