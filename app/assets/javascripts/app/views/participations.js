App.Participations = {
  Show: Backbone.View.extend({
    el: "body",
    events: {
      "ajax:success form.edit_user": "enableCheckoutButton",
      "change #donate_select" : "updateMoipValue",
      "change #donate_checkbox" : "updateMoipValue"
    },
    enableCheckoutButton: function(){
      $("input.moip_checkout").removeAttr('disabled');
    },
    updateMoipValue: function(){
      if($("#donate_checkbox").attr("checked")){
        $("#moip_valor").val(parseInt($("#moip_valor_original").val()) + parseInt($("#donate_select").val()));
        $("#moip_nome").val($("#moip_nome_original").val() + " + doação de " + $("#donate_select option[value=" + $("#donate_select").val() + "]").text());
      } else {
        $("#moip_valor").val($("#moip_valor_original").val());
        $("#moip_nome").val($("#moip_nome_original").val());
      }
    },
    initialize: function() {
      this.updateMoipValue();
    }
  })
}
