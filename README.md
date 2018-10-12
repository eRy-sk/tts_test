# TTS技術検証

Rails 5.2  
Ruby 2.5  
gem 'tts'  
`brew install mpg123` ファイルを保存せず、直接再生する場合必要

## やること
ユーザー名をサーバー側で音声再生する  
ファイルは保存しない、毎回一時ファイルを作成する

## お試し
ユーザー登録  
`http://localhost:3000/users/new`  
再生
`http://localhost:3000/`

## 再生
`'こんにちは'.play 'ja'`

## 保存
`'こんにちは'.to_file 'ja'`

# 定期実行
１分ごとに`:count`の少ない順にユーザー名が２人ずつ掃除当番に呼ばれる

`gem 'whenever', require: false`  
`$ wheneverize .`で`config/schedule.rb`を作成

## 注意点
ActiveRecordをいじるため以下が必要  
[`=> :environment do`](https://github.com/eRy-sk/tts_test/blob/master/lib/tasks/speak.rake#L3)  
それを環境ごとに定期実行で正常に動かすために設定が必要  
[`set :environment, rails_env`](https://github.com/eRy-sk/tts_test/blob/master/config/schedule.rb#L10)

# 音声の確認
[ルーティング](https://github.com/eRy-sk/tts_test/blob/master/config/routes.rb#L2)
```routes.rb
resources :users do
  member do
    get 'sound_for'
  end
end
```
[コントローラ](https://github.com/eRy-sk/tts_test/blob/master/app/controllers/users_controller.rb#L64)
```users_controller.rb
def sound_for
  Tempfile.open(['instant_file', '.mp3']) do |instant_file| # 一時ファイルの作成
    @user.name.to_file('en', instant_file.path) # 作成した一時ファイルに音声を書き込み
    send_file(instant_file) # 一時音声ファイルを送る
  end
end
```
[ビュー](<%= audio_tag sound_for_user_path(@user), controls: true %>)
```show.html.erb
<%= audio_tag sound_for_user_path(@user), controls: true %> <!-- 送った一時音声ファイルを受け取って再生できる -->
```
