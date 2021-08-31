# アプリケーション名
  Time Manage

<br><br>

# アプリケーション概要
  「時間」、「仕事内容」、「仕事の実施可能な人」を選択し、詳細内容を入力します。
  内容を登録すると内容に伴った円グラフとそれぞれの内容の合計時間がトップページに表示されます。

<br><br>

# URL
  https://time-manage-1204.herokuapp.com/

<br><br>

# テスト用アカウント
   Basic認証 ID:toshimi , PW:1204
   
   <br><br>

# 制作背景
   アプリケーションによって時間把握と内容把握ができるようになればと思い作成しました。
  前職において、自分が何にどれだけ時間をかけて仕事をしていてるかわからないことが多くありました。
   また、他の人に任せることができる仕事が把握できておらず、仕事を任せることができず、組織の中で課題となっていました。 
  上記の問題を解決するため作成いたしました。

  <br><br>

# 目指した課題解決
  【時間把握と内容把握】

  　グラフと数値を用いて見える化し、時間と内容の把握ができるようにしました。
  
  <br><br>

# 利用方法

  ## 【トップ画面】
  ### ①ログイン前
  [![Image from Gyazo](https://i.gyazo.com/118fc16088fe55b071e3b7f61cf2bed4.png)](https://gyazo.com/118fc16088fe55b071e3b7f61cf2bed4)

  ログイン前のグラフデータは参考画像になっています。アプリケーションの使用には、ユーザー登録をしてログインが必要です。

  ### ②ログイン後
  [![Image from Gyazo](https://i.gyazo.com/5d7741e9c85f26a6983ba697aad3341d.gif)](https://gyazo.com/5d7741e9c85f26a6983ba697aad3341d)

  ログイン後は、ユーザーのデータが表示されます。
  またヘッダーに今日の日付とユーザー名が表示されて「ログインしました」の通知が出ます。
  ※ブラウザを開いた初回時のみ「内容登録し忘れはありませんか」の通知が出ます。

  ### ③ゲストログイン
  [![Image from Gyazo](https://i.gyazo.com/d5ee30eb1f71fa229ac172146f03056e.gif)](https://gyazo.com/d5ee30eb1f71fa229ac172146f03056e)

  ゲストログインボタンを押して頂くと、ユーザーの新規登録無しに、アプリを使用できます。

  <br>

  ## 【ユーザー新規登録】
  [![Image from Gyazo](https://i.gyazo.com/da6177c3a1deb533b7be66460f57afc8.png)](https://gyazo.com/da6177c3a1deb533b7be66460f57afc8)

  ヘッダーの「新規登録」ボタンを押し、各項目を入力しアカウントを作成します。
  
  ※項目全てに入力が必要です。

  <br>

  ## 【内容登録】
  ### ①内容登録画面に遷移
  [![Image from Gyazo](https://i.gyazo.com/afa7f99322262ddbfd203ddff75bc188.gif)](https://gyazo.com/afa7f99322262ddbfd203ddff75bc188)

  ⇩

  ### ①内容登録画面に遷移（時間選択部分変更）
  [![Image from Gyazo](https://i.gyazo.com/4a6f0fdf9b1dd7bbd4c44cecf715d7d9.gif)](https://gyazo.com/4a6f0fdf9b1dd7bbd4c44cecf715d7d9)

   <br>

  ### ②登録実施
  [![Image from Gyazo](https://i.gyazo.com/f5e5cdb3d835b1bd5f0b99cbbad0a3c8.png)](https://gyazo.com/f5e5cdb3d835b1bd5f0b99cbbad0a3c8)
  アカウント作成後もしくはログイン後、トップページの「時間内容新規登録」ボタンを押し、実施した仕事内容等を入力します。

  ⇩

  ### ②登録実施（時間選択部分変更）
 　[![Image from Gyazo](https://i.gyazo.com/92d24d1176793bffe83372463af66a71.png)](https://gyazo.com/92d24d1176793bffe83372463af66a71)
  時間は「6時〜22時」で、分は「0分・15分・30分・45分」と15分刻みで選択できるようにしています。

  ※全ての項目に対して選択もしくは入力が必要です。

  <br>

  ## 【グラフと数値の表示】
  [![Image from Gyazo](https://i.gyazo.com/fa040f179fd3062d627dacb01101f9af.png)](https://gyazo.com/fa040f179fd3062d627dacb01101f9af)
  内容を登録するとトップページに遷移し、入力内容に伴って円グラフと数値が表示されます。

  ※グラフは、当日と当月のデータそして当日と当月の削減可能データの4つがあります。
　 内容登録時に、選択事項の「実施できる人」にて「他の人も可能」を選択すると、削減可能データに表示されます。

  <br>

  ## 【内容の確認】
  [![Image from Gyazo](https://i.gyazo.com/8c3dd2eb59ae1d3bf4679f856faf9960.gif)](https://gyazo.com/8c3dd2eb59ae1d3bf4679f856faf9960)
  カレンダー日付内の仕事内容の項目を押すと、実施時間と内容等が表示される詳細ページに遷移し内容の確認ができます。詳細ページでは内容の編集と削除ができます。

  <br>

  ## 【内容の検索】
  ### ①検索画面への遷移
  [![Image from Gyazo](https://i.gyazo.com/80674432e7a4d382a40115cd239e5e79.gif)](https://gyazo.com/80674432e7a4d382a40115cd239e5e79)

  ### ②検索実施（詳細検索について）
  [![Image from Gyazo](https://i.gyazo.com/ccd45e5100ce5c77ca1cd07327310859.gif)](https://gyazo.com/ccd45e5100ce5c77ca1cd07327310859)

  ・キーワード検索ではキーワードを入力し検索できます。

  ・詳細検索は、詳細検索ボタンを押すと詳細検索ページに遷移し、内容を選択や入力して検索ができます。

  <br><br>

# 工夫した点
  ①各グラフへのデータ反映（内容登録時に、選択項目の「実施できる人」で「他の人も可能」を選択すると、グラフ表示を「削減可能内容と時間」に表示されるようにしました。）

  ②検索機能で期間等細かく条件をつけれるようにしました、。
  <br><br>

# 洗い出した要件
下記URLをご参照ください。

https://docs.google.com/spreadsheets/d/1J3cvIvpgbKKe6BRwGfpPvOU-3VfH1tf2Uere6GjK5GQ/edit#gid=282075926

<br><br>

# 使用技術（開発環境）
バックエンド：Ruby、Ruby on Rails

フロントエンド：HTML、CSS、JavaScript

ソース管理：GitHub、GitHubDesktop

テスト：RSpec

エディタ：VScode

カレンダー：'simple_calendar', '~> 2.0'

グラフ：'chartkick'

<br><br>

# 今後の課題と実装したい機能
  ①内容登録の時間項目を選択ではなく、入力するようにして登録を回数を少なくしていきたいです。⇨実装済み

  ②カレンダーの日付の枠ををクリックすると詳細内容が現れるようにしたいです。

<br><br>


# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| kana_name          | string | null: false               |
| department         | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
|                                                         |

### association

has_many :time_contents

<br>

## time_contents テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| begin_time   | time       | null: false                    |
| finish_time  | time       | null: false
| content_id   | integer    | null: false                    |
| insure_id    | integer    | null: false                    |
| detail       | text       | null: false                    |
| start_time   | date       | null: false                    |
| user         | references | null: false, foreign_key: true |
|                                                            |

### association

belongs_to :user
