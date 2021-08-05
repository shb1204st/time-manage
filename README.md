# アプリケーション名
  Time Manage

# アプリケーション概要
  何時にどのような仕事をしているかを入力し、詳細内容を記載する。
  また、コメントを残し注意点や重要なことなどを書き残していく。

# URL
  https://time-manage-1204.herokuapp.com/

# テスト用アカウント
   Basic認証 ID:toshimi, PW:1204
   
   ログイン   ID:       ,PW:

# 利用方法
  新規登録を行い、アカウントを作成します。
  アカウント作成後、トップページより「時間情報登録」ボタンを押し実施した仕事内容等を入力します。
  入力内容が円グラフとなって現れて、どの仕事にそれだけ時間を使っているかを表してくれます。
  トップページのカレンダーの日を押すと、その日の1日の情報が表示され、また編集や削除ができます。

# 目指した課題解決
  朝から晩まで仕事をしても仕事が終わらない人に対して、時間を創出できるようにし仕事を終わらせることができるようにつなげる。
  まず、何にどれだけの時間の使っているかを把握を行います。入力している時間に、自分だけにしかできないことかや仕事のやり方について
  工夫できることを考えコメントを残し、そのコメントを会社の人たちと共有できるようにして、誰でもできる仕事は時間がある人ができるようにする。

# 洗い出した要件



# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| kana_name          | string | null: false               |
| department         | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### association

has_many :times
has_many :comments

## times テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| time_id     | integer    | null: false                    |
| content_id  | integer    | null: false                    |
| detail      | text       | null: false                    |
| start_time  | date       | null: false                    |
| user        | references | null: false, foreign_key: true |

### association

belongs_to :user
has_many   :comments

## comments テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       |                   |
| user    | references | foreign_key: true |
| room    | references | foreign_key: true |

### association

belongs_to :user
belongs_to :time
