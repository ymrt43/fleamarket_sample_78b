$(function() {

  $("#item_category_id").on('change', function(){
    let parentInput = $("#item_category_id").val();
    if (parentInput.length != 0) {
      $.ajax({
        type: 'GET',
        url: '/items/search',
        data: { parent_id: parentInput },
        dataType: 'json'
      })
      .done(function (data) {

      })
      .fail(function() {

      });
    }

  });
});
