# TTS技術検証

Rails 5.2  
Ruby 2.5  
gem 'tts'  
`brew install mpg123` ファイルを保存せず、直接再生する場合必要

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
