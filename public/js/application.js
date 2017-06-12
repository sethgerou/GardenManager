$(document).ready(function() {
  $('#add_manager').on("click", function(event){
    event.preventDefault();
      $('#show-new-manager').slideToggle("slow"),
      $('#view_manager').slideToggle("slow"),
      $('#add_manager').slideToggle("slow")
  })

  $('#add_manager_form_container').on("submit", function(event){
    event.preventDefault();
    newData = $(event.target).serialize()
    $.ajax({
      url: '/managers',
      type: 'post',
      data: newData
    }).done(function(response){
      $('#add_manager_form_container').html(response)
    })
  })

  $('#view_manager').on("click", function(event){
    event.preventDefault();
    $('#view_manager_form').slideToggle("slow"),
    $('#view_manager').slideToggle("slow"),
    $('#add_manager').slideToggle("slow")
  })

  $('#view_manager_form').on("submit", function(event){
    event.preventDefault();
    selectManager = $(event.target).serialize()
    $.ajax({
      url: '/managers',
      type: 'get',
      data: selectManager
    }).done(function(response){
      $('#add_manager').hide()
      $('#view_manager').hide()
      $('#view_manager_form').hide()
      $('#edit_manager_settings').toggleClass("hidden")
      $('#add_manager_form_container').html(response)
    })
  })

  $('.edit').on("click", "#edit_manager_settings", function(event){
    event.preventDefault();
    $.ajax({
      url: '/managers/edit',
      type: 'get'
    }).done(function(response){
      $('#add_manager_form_container').html(response)
    })
  })
});
