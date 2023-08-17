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

### railsでtailwindcssを使用する場合（検討中）

```
./bin/bundle add tailwindcss-rails
./bin/rails tailwindcss:install
./bin/rails assets:precompile
```

- [チートシート](https://tailwindcomponents.com/cheatsheet/)

- [公式ドキュメント](https://tailwindcss.com/docs/installation)