$(document).on('turbolinks:load', function() {
  const buildFileField = function(index) {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="tweet[images_attributes][${index}][src]"
                    id="tweet_images_attributes_${index}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = function(index, url) {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px" style="box-shadow: -5px 5px gray;">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    $('#post__image').on('change', '.js-file', function(e) {
      const targetIndex = $(this).parent().data('index');
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('src', blobUrl);
      } else { 
        $('#previews').append(buildImg(targetIndex, blobUrl));
      }
        if ($('.js-file_group').length <= 2) $('#post__image').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    });
    
  $('#post__image').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.js-file').length == 0) $('#post__image').append(buildFileField(fileIndex[0]));
  });
});
