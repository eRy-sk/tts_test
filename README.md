# TTS技術検証

Rails 5.2
Ruby 2.5
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
