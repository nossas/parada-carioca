$(function(){
  $("#create_event").hide();
  $('a[rel*=facebox]').facebox();
  $(document).bind('reveal.facebox', function() {
    $('.datepicker').datetimepicker({dateFormat: "dd/mm/yy", minDate: new Date()});
    $("#event_price").maskMoney({allowZero: true});
    $("#new_event").validate({
      messages: {
        "event[date]": {required: "escolha uma data para a realização do evento"}
      }
    });
  });
});
