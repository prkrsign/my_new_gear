FactoryBot.define do
  factory :user do
    username                 { 'テストマン' }
    email                    { 'testman@yahoo.co.jp' }
    password                 { '1234567' }
    password_confirmation    { '1234567' }
    favorite                 { 'メタリカ' }
    profile                  do
      '私が丸々さんに興味を持ったのは、代表であるAA社長のお父様が、△出身だった、とプロフィールに書かれていたからです。
                               私は、丸々の創業者であるBBさんの本をたくさん読んでいて、凄く共感するところが多かったんです。
                               コレがキッカケで、御社に興味を持ち、信頼できると感じ、申し込ませて頂きました。'
    end
    avatar                   { 'aaaa.jpg' }
    genre_id                 { 2 }
  end
end
