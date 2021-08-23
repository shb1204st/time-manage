window.addEventListener('DOMContentLoaded', function(){

  // (1)パスワード入力欄とボタンのHTMLを取得
  let btn_passview_conf = document.getElementById("btn_passview_conf");
  let input_pass_conf = document.getElementById("user_password_confirmation");
  // (2)ボタンのイベントリスナーを設定
  btn_passview_conf.addEventListener("click", (e)=>{

    // (3)ボタンの通常の動作をキャンセル（フォーム送信をキャンセル）
    e.preventDefault();

    // (4)パスワード入力欄のtype属性を確認
    if( input_pass_conf.type === 'password' ) {

      // (5)パスワードを表示する
      input_pass_conf.type = 'text';
      btn_passview_conf.textContent = '非表示';

    } else {

      // (6)パスワードを非表示にする
      input_pass_conf.type = 'password';
      btn_passview_conf.textContent = '表示';
    }
  });
});