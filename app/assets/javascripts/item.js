$(function(){
  function buildFileField(index) {
    const html = `<div data-index="${index} "class="FormBlock__iSelection">
                    <input required="required" class="FormBlock__iSelection--file" type="file" name="item[images_attributes][${index}][src]" id="item_images_attributes_${index}_src">
                    <i class="fas fa-camera FormBlock__iSelection--icon"></i>
                    <p class="FormBlock__iSelection--hwToUp">
                    ドラッグアンドドロップ
                    <br>
                    またはクリックしてファイルをアップロード
                    </p>
                    <span class="FormBlock__iSelection--remove">削除</span>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.FormBlock__iSelectsField').on('change', '.FormBlock__iSelection--file', function(e) {
    $('.FormBlock__iSelectsField').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('.FormBlock__iSelectsField').on('click', '.FormBlock__iSelection--remove', function(e) {
    $(this).parent().remove();
    if ($('.FormBlock__iSelectsField').length == 0) $('.FormBlock__iSelectsField').append(buildFileField(fileIndex[0]));
  });
});