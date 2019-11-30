$(document).on('turbolinks:load', function(){

  var search_list = $('#gear-search-result');

  function appendGear(gear){
    var html = 
              `<li class="list-group-item list-group-item-primary data-gear-id=${gear.id} h6"> ${gear.name} </li>`
              search_list.append(html)
  }

  $('#gear_search').on('keyup', function(e){
  var input = $("#q_gearname_or_maker_or_category_cont").val();

    $.ajax({
        type: 'GET',                 // HTTPメソッドはGETで
        url:  '/',                   // URLでrootを指定
        data: { keyword: input },    // keyword: inputを送信する
        dataType: 'json'             // json形式でリクエスト
    })

    .done(function(gears){                // usersにjson形式のuser変数が代入される。複数形なので配列型で入ってくる

      if (input.length === 0) {         // フォームの文字列長さが0であれば、インクリメンタルサーチ結果を表示しないようにする
        $('#gear-search-result').empty();
      }

      else if (input.length !== 0){     // 値が等しくないもしくは型が等しくなければtrueを返す。
        $('#gear-search-result').empty();
        gears.forEach(function(gear){
          appendGear(gear)
        });
      }

      else {
        console.log('sasisuseso')  
        $('#q_gearname_or_maker_or_category_cont').empty(); // ユーザーが見つからなければ「見つからない」を返す。
        appendErrMsgToHTML("一致するユーザーが見つかりません");
      }
    })

    .fail(function() {
      alert('ユーザー検索に失敗しました');
    });

  });
})