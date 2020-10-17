$(function() {
  function build_childSelect() {
    let child_select = `<select class="FormBox__select--child" required="required" name="item[category_id]" id="item_category_id">
                          <option value="">選択してください</option>
                        </select>`
    return child_select;
  }

  function build_gcSelect() {
    let gc_select = `<select class="FormBox__select--gc" required="required" name="item[category_id]"id="item_category_id">
                      <option value="">選択してください</option>
                    </select>`
    return gc_select;
  }

  function build_option(child) {
    let option_html = `<option value=${child.id}>${child.name}</option>`
    return option_html;
  }

  $(".FormBox__select--inner").on('change', function(){
    let parentInput = $(".FormBox__select--inner").val();
    if (parentInput.length != 0) {
      $.ajax({
        type: 'GET',
        url: '/items/search',
        data: { parent_id: parentInput },
        dataType: 'json'
      })
      .done(function(data) {
        $('.FormBox__select--child').remove();
        $('.FormBox__select--gc').remove();
        let child_select = build_childSelect
        $('#CategoryFormField').append(child_select);
        data.forEach(function(d) {
          let option_html = build_option(d);
          $(".FormBox__select--child").append(option_html);
        })
      })
      .fail(function() {
        alert("通信エラーです！");
      });
    }
  });



  $("#CategoryFormField").on('change','.FormBox__select--child', function(){
    let childInput = $(".FormBox__select--child").val();
    $('.FormBox__select--gc').remove();
    if (childInput.length != 0) {
      $.ajax({
        type: 'GET',
        url: '/items/search',
        data: { child_id: childInput },
        dataType: 'json'
      })
      .done(function(gc_data) {
        let gc_select = build_gcSelect
        $('#CategoryFormField').append(gc_select);
        gc_data.forEach(function(gc_d) {
          let option_html = build_option(gc_d);
          $('.FormBox__select--gc').append(option_html);
        });
      })
      .fail(function() {
        alert("通信エラーです！");
      });
    }
  })
});
