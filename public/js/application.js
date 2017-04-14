$(document).ready(function() {
  $('#add_manager').on("click", function(event){
    event.preventDefault();
      $('#show-new-manager').slideToggle("fast")
  })
  $('#add_manager_form_container').on("submit", function(event){
    event.preventDefault();
    newData = $(event.target).serialize()
    $.ajax({
      url: '/managers',
      type: 'post',
      data: newData
    }).done(function(response){
      $('#add_manager_form_container').append(response)
    })
  })
  $('#view_manager').on("click", function(event){
    event.preventDefault();
    $('#view_manager_form').slideToggle("fast")
  })
  
});
