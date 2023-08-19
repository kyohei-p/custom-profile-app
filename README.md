## Railsプロジェクトベース

### 環境構築
- Dockerイメージの構築〜DB作成

```
docker compose build --no-cache
docker compose run web rails db:create
```

- （作成されない場合）Railsアプリケーションの作成

```
docker-compose run --rm web rails new /myapp
```

- コンテナの作成と開始

```
docker compose up -d
```

- コンテナに入る

```
docker compose exec web bash
```

- Docker再起動

```
docker compose restart
```

#### docker-composeコマンド概要（Tips）

- https://docs.docker.jp/v1.12/compose/reference/overview.html


#### 以下URLにアクセスしサーバーが立ち上がればOK

- http://localhost:3000


### バージョン情報

name|version
--|--
Ruby | 3.1.3
Ruby on Rails | 7.0.4.2

### 導入済みgem

- [pry-rails](https://github.com/pry/pry-rails)
- [rspec-rails](https://github.com/rspec/rspec-rails)
- [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)

### Rspec初期化〜テスト実行

```
docker compose exec web bash
bundle exec rails generate rspec:install
bundle exec rspec
```

#### 動作確認例
```
## 失敗時（1 failureが0 failuresになればテスト成功）
Failures:

  1) users/index should display top page
     Failure/Error: visit root_path

     NoMethodError:
       undefined method `visit' for #<RSpec::ExampleGroups::UsersIndex "should display top page" (./spec/views/users/index.html.erb_spec.rb:4)>
     # ./spec/views/users/index.html.erb_spec.rb:5:in `block (2 levels) in <top (required)>'

Finished in 0.36097 seconds (files took 15.44 seconds to load)
1 example, 1 failure

## 成功時
root@e22273d19f8e:/myapp# bundle exec rspec
.

Finished in 1.14 seconds (files took 7.51 seconds to load)
1 example, 0 failures
```

#### テスト仕様書（作成中）
- [テスト仕様書](https://docs.google.com/spreadsheets/d/1ncQnjfbpvykaGYqmEvLZtAkxVcaDKArx/edit?usp=sharing&ouid=102379529971654433248&rtpof=true&sd=true)

#### Rspec(Tips)
- [Docker+RailsでRSpec導入〜トップページ表示確認テストの書き方まで](https://qiita.com/memomaruRey/items/a93e03eec2eb6e1a8443)

### railsでtailwindcssを使用する場合（検討中）

```
./bin/bundle add tailwindcss-rails
./bin/rails tailwindcss:install
./bin/rails assets:precompile
```

- [チートシート](https://tailwindcomponents.com/cheatsheet/)

- [公式ドキュメント](https://tailwindcss.com/docs/installation)

### CSSが反映されない時の対処法
- 以下の各ファイルにて設定がされているか確認してください
app/assets/stylesheets/application.css
```
 *= require_tree .
 *= require_self
```
app/assets/config/manifest.js
```
//= link_directory ../stylesheets .css
```
app/views/layouts/application.html.erb
```
<%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>   
```

- ブラウザのキャッシュクリアをしてください
- public直下のassetsフォルダを削除し、Docker再起動してください
```
public/assets
```
https://qiita.com/scivola/items/e3e766b3e672a39b7a8f