App.Participations = {
  Show: Backbone.View.extend({
    el: "body",
    events: {
      "ajax:success form.edit_user": "enableCheckoutButton"
    },
    enableCheckoutButton: function(){
      $("input.moip_checkout").removeAttr('disabled');
    }
  })
}
