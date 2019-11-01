## サイトトップページ画像
* ご覧になる際はURLにアクセスのうえ、下記アカウントでログインください。
  * URL:https://mynewgear-portfolio.com/ メールアドレス:test@example.com      パスワード:1234567  
  * アクセス不具合対応済みです。 19/11/1
  
|PCサイズ|iPadサイズ|iPhoneサイズ|
|---|---|---|
|<img width="1100" src="https://i.gyazo.com/11582041f79f97be303cf36647b7b703.jpg">|<img width="600"  src="https://i.gyazo.com/db4948a05ea895277af0a0a822169aff.png">|<img width="400" src="https://i.gyazo.com/e4d4f890ac69e57e097b505952c0e597.png">

## 概要  
第三者のユーザー同士が、音楽機材のレビューを通して意見交流、情報交換を行うアプリケーションを目指しています。

## 制作背景
音楽機材のレビューを第三者が投稿するアプリケーションが少ないと感じていたため制作しました。

実情として、音楽の機材のレビューが投稿されるサイトの種類は下記の通りです。  
・ECサイト  
・個人ブログ  
・メーカーサイト  
いずれも情報の信用性に疑いが生じる、もしくは主観的意見であるため肯定的意見しか見られない、または偏った見識である場合が多く、結果として閲覧者は正確な情報取得ができないと感じています。


## 機能一覧及び使用技術
* フロントエンド
  * Haml/Sassによるマークアップ
  * Bootstrapとメディアクエリを使用し、レスポンシブデザイン化
  
* サーバーサイド
  * ユーザー登録機能(gem deviseを使用)
  * スクレイピングによる機材データベースの作成(gem mechanizeを使用)
  * 機材一覧表示
  * レビューの投稿機能
  * レビューの編集機能
  * レビューの削除機能
  * 検索機能(gem ransackを使用)
  * ページネーション(gem kaminariを使用)
  * グラフ表示機能(chart.jsを用いたレーダーチャート)
  * 単体テスト(RSpec)
  * 統合テスト(System Spec) (gem simplecovによるカバレッジ計測87%)
  
* インフラ  
  * Docker、docker-composeによる開発環境構築
  * DBにAmazonRDS(MySQL)
  * 仮想サーバーEC2(AWS)を使用
  * Capistranoを用いた自動デプロイ
  * CircleCIによる自動テスト(rspec及びrubocopに対応)
  * Route53(AWS)を使用した独自ドメインの取得
  * ELB(AWS)をエンドポイントとして常時SSL化

## 追加予定機能
* ECS(AWS)による本番環境コンテナ駆動
* circleCIによる自動デプロイ
* レビューに対するコメント投稿機能
* いいね機能(一時実装したが一旦削除)
* いいね通知機能
* いいねカウント機能(一時実装したが一旦削除)
* ユーザーマイページ
* Twitter,Instagramアカウントによるログイン機能
* 単体テスト 随時進めていきます
* 統合テスト 随時進めていきます
* Chart.jsのバグ(?)修正

## 工夫点
* レスポンシブデザインの実装。多くの人は、レビューサイトを見るときにスマホを利用すると予想されるため。
* グラフ挿入。閲覧者はある程度の目的を持つことを予想して、一目で機材評価と自分のイメージが合っているかを照合するため。レビューの評価を平均値で評価するため。

## 苦労した点
* レスポンシブデザイン。PCスマホ両対応を意識してデザインしたことがなかったため。
* chart.jsの使い方。railsのviewファイルにjavascriptを埋め込み、変数を渡すことを実践したことがなかったため。
* モデルメソッドの流用。まだまだrubyについて理解していないと感じた。
* Dockerの環境構築。カリキュラム外の技術であり、概要把握、エラー対処が難しかった。
