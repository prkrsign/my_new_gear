FactoryBot.define do
  factory :review do
    title                 { 'Bluetoothとワイヤレスシステムを唯一搭載している' }
    detail                { 'タイトルの通り、Bluetoothスピーカーとワイヤレスシステムを搭載している現在のところ唯一のアンプだと思いましたので購入しました。電源コードひとつでギター演奏と外部音源を鳴らせるのは部屋がすっきりして良いです。フロントパネルの見た目は好きではないので、フロント部分を下方向に向け、コントロールツマミ部分を正面に向け、アルミラックの上段に置いて使用しています。' }
    cost_performance      { 1 }
    sound                 { 2 }
    design                { 3 }
    durability            { 4 }
    satisfaction_level    { 5 }
    user
    gear
  end
end
