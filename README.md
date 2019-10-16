## サイトトップページ画像

|PCサイズ|iPadサイズ|iPhoneサイズ|
|---|---|---|
|<img width="1100" alt="スクリーンショット 2019-10-16 13 42 05" src="https://user-images.githubusercontent.com/52661994/66889761-96ba7d00-f01e-11e9-9f7b-7bd87167385a.png">|<img width="600" alt="スクリーンショット 2019-10-16 13 47 31" src="https://user-images.githubusercontent.com/52661994/66889762-96ba7d00-f01e-11e9-8ddf-b04fcf9a549e.png">|<img width="400" alt="スクリーンショット 2019-10-16 13 47 57" src="https://user-images.githubusercontent.com/52661994/66889763-96ba7d00-f01e-11e9-8dd6-8babdb174e77.png">

## 概要  
第三者という立場のユーザー同士が、音楽機材のレビューを通して意見交流、情報交換を行うアプリケーションを目指しています。

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
  * 画像投稿機能(gem carrierwaveを使用)
  * ページネーション
  * いいね機能の実装
  * グラフ表示機能(gem chartkickを使用 ⇨　chart.jsを用いたレーダーチャートへの変更を検討中です。)
  * 単体テスト(RSpec)
  * 統合テスト(System Spec)
  
* インフラ
  * DBにはMysqlを使用
  * 仮想サーバーEC2(AWS)を使用
  * ストレージS3(AWS)を用いた画像の保存 
  * Capistranoを用いた自動デプロイ

## 追加予定機能
* 検索機能
* コメント投稿機能
* いいね通知機能
* いいねカウント機能
* ユーザーマイページ
* Twitter,Instagramアカウントによるログイン機能
* PV機能
* 単体テスト 随時進めていきます
* 統合テスト 随時進めていきます

## 工夫点
* レスポンシブデザインの実装。多くの人は、レビューサイトを見るときにスマホを利用すると予想されるため。
* トップページへのグラフ挿入。閲覧者はある程度の目的を持つことを予想して、一目で機材評価と自分のイメージが合っているかを照合するため。

## 苦労した点
* レスポンシブデザイン。PCスマホ両対応を意識してデザインしたことがなかったため。また、グラフとの親和性が高くないため難しかった。  
