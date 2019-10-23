## サイトトップページ画像
* ご覧になる際はURLにアクセスのうえ、下記アカウントでログインください。
  * URL:http://18.179.74.251/    メールアドレス:test@example.com      パスワード:1234567
  
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
  * レビューの投稿機能
  * レビューの編集機能
  * レビューの削除機能
  * 検索機能(gem ransackを使用)
  * ページネーション
  * スクレイピングによる機材データベースの作成 
  * グラフ表示機能(chart.jsを用いたレーダーチャート)
  * 単体テスト(RSpec)
  * 統合テスト(System Spec)
  
* インフラ
  * DBにはMysqlを使用
  * 仮想サーバーEC2(AWS)を使用
  * Capistranoを用いた自動デプロイ

## 追加予定機能

* レビューに対するコメント投稿機能
* いいね機能
* いいね通知機能
* いいねカウント機能
* Dockerの導入
* 独自ドメイン設定
* SSL化
* ユーザーマイページ
* Twitter,Instagramアカウントによるログイン機能
* 単体テスト 随時進めていきます
* 統合テスト 随時進めていきます

## 工夫点
* レスポンシブデザインの実装。多くの人は、レビューサイトを見るときにスマホを利用すると予想されるため。
* グラフ挿入。閲覧者はある程度の目的を持つことを予想して、一目で機材評価と自分のイメージが合っているかを照合するため。レビューの評価を平均値で評価するため。

## 苦労した点
* レスポンシブデザイン。PCスマホ両対応を意識してデザインしたことがなかったため。また、グラフとの親和性が高くないため難しかった。  
