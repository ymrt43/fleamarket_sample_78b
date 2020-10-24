window.addEventListener('DOMContentLoaded', function(){

  //id名が"token_submit"というボタンが押されたら取得
  let submit = document.getElementById("token_submit");

  Payjp.setPublicKey('pk_test_078da7672220bf7ef2debe94'); //公開鍵の記述

    submit.addEventListener('click', function(e){ //ボタンが押されたらトークン作成開始。

    e.preventDefault(); //ボタンを1度無効化

    let card = { //入力されたカード情報を取得
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
    };

    Payjp.createToken(card, function(status, response) {
        // トークンを生成
      if (status === 200) { //成功した場合(status === 200はリクエストが成功している状況です。)
        //データを自サーバにpostしないようにremoveAttr("name")で削除
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name"); 
        $("#charge-form").append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
        ); //取得したトークンを送信できる状態にします
        document.inputForm.submit();
        alert("登録が完了しました"); //正常処理完了確認用
      } else {
        alert("カード情報が正しくありません。"); //エラー確認用
      }
    });
  });
});