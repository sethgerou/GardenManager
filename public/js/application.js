$(document).ready(function() {
  $('#add_manager').on("click", function(event){
    event.preventDefault();
    $.ajax({
      url: '/managers/new',
      type: 'get'
    }).done(function(response){
      $('#add_manager_form_container').html(response)
    })
  })

});
