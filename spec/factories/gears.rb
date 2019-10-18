FactoryBot.define do
    factory :gear do
      gearname              {'Plumes'}
      category_id           {7}
      maker_id              {9}
      cost_performance      {20}
      sound                 {20}
      design                {20}
      durability            {20}
      dissatisfaction       {20}
      image                 {File.new("#{Rails.root}/spec/files/jisaku.png")}
      title                 {'デラックス版「TS808DX」'}
      review                {'これまでたくさんのオーバードライブを購入しましたが、ここに結論がありました。BOSSらしいと言えばそこまでですが、これがBOSSのひとつの回答だと思います。つまみをどの位置にしても良い音がでます。ブースターとして、クランチとして、軽めのディストーションとして。オールラウンダーです。'}
      user
    end
end
  