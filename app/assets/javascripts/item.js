$(function(){

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.FormBlock__iSelectsField').on('change', '.FormBlock__iSelection--file', function(e) {
    $('.FormBlock__iSelectsField').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('.FormBlock__iSelectsField').on('click', '.FormBlock__iSelection--remove', funciton(e) {
    $(this).parent().remove();
    if ($('.FormBlock__iSelectsField').length == 0) $('.FormBlock__iSelectsField').append(buildFileField(fileIndex[0]));
  });
});