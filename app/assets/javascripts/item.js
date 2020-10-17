$(function(){
  function buildFileField(num) {
    const html = `<div data-index="${num}" class="ImageBox__fileGroup">
                    <input class="ImageBox__file" type="file"
                    name="item[images_attributes][${num}][src]"
                    id="item_images_attributes_${num}_src"><br>
                  </div>`;
    return html;
  }

  function buildImg(index, url) {
    const html = `<div class="ImageBox__preview">
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <div class="ImageBox__remove">削除</div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.ImageBox__fileGroup:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#ImageBox').on('change', '.ImageBox__file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').prepend(buildImg(targetIndex, blobUrl));
      $('.ImageBox__hidden').append(buildFileField(fileIndex[0]));
      $('.ImageBox__inputLabel').attr({id: `label-box-${fileIndex[0]}`,for: `item_images_attributes_${fileIndex[0]}_src`});
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
    var count = $('.ImageBox__preview').length;
    if (count >= 10) {
      $('.ImageBox__inputLabel').hide();
    }
  });

  $('#ImageBox').on('click', '.ImageBox__remove', function() {
    const targetIndex = $(this).parent().data('index');
    console.log(targetIndex)
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    var count = $('.ImageBox__preview').length;
    if (count <= 9) {
      $('.ImageBox__inputLabel').show();
    }

    if ($('.ImageBox__file').length == 0) $('#ImageBox').append(buildFileField(fileIndex[0]));
  });

  $('#item_description').on('keyup', function() {
    var count = $(this).val().length;
    $('.counter').text(count)
  })
});