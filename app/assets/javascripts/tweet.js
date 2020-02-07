$(document).on('turbolinks:load', function() {
  // console.log(targetIndex)
  // 画像用のinputを生成する関数
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

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    $('#post__image').on('change', '.js-file', function(e) {
      const targetIndex = $(this).parent().data('index');
      // ファイルのブラウザ上でのURLを取得する
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
      // 新たに作成したimgタグのdata-indexにnew.html.hamlのimages.indexを取得して代入している。そしてその要素の[0]つまり値が入っているかを確認し、ある場合はsrcを変更することで画像の切り替えを行なっている（一つのリンクに被らないため）
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('src', blobUrl);
      } else {  // 新規画像追加の処理
        $('#previews').append(buildImg(targetIndex, blobUrl));
      }
      // fileIndexの先頭の数字を使ってinputを作る
        if ($('.js-file_group').length <= 2) $('#post__image').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        // // 末尾の数に1足した数を追加する
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    });
    
  $('#post__image').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#post__image').append(buildFileField(fileIndex[0]));
  });
});
