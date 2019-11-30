$(document).on('turbolinks:load', function(){

  var search_list = $('#gear-search-result');

  function appendGear(gear){
    var html = 
              `<li class="list-group-item list-group-item-primary h6 gearname-select">${gear.name}</li>`
              search_list.append(html)
  };

  $('#gear_search').on('keyup', function(e){
    var input = $("#q_gearname_or_maker_or_category_cont").val();

    $.ajax({
        type: 'GET',                 // HTTPメソッドはGETで
        url:  '/',                   // URLでrootを指定
        data: { keyword: input },    // keyword: inputを送信する
        dataType: 'json'             // json形式でリクエスト
    })

    .done(function(gears){                // usersにjson形式のuser変数が代入される。複数形なので配列型で入ってくる

      if (input.length === 0) {         // フォームの文字列長さが0であれば、インクリメンタルサーチ結果を表示しないようにする'a
        $('#gear-search-result').empty();
      }

      else if (input.length !== 0){     // 値が等しくないもしくは型が等しくなければtrueを返す。
        $('#gear-search-result').empty();
        gears.forEach(function(gear){
          appendGear(gear)
        });
      }

      else {
        $('#gear-search-result').empty(); // 機材が見つからなければ「見つからない」を返す。
        appendErrMsgToHTML("一致する機材が見つかりません");
      }
    })

    .fail(function() {
      alert('機材検索に失敗しました');
    })
  });

  $(document).on('click', '.gearname-select', function() {
    var gear_name = $(this).html();
    $("#q_gearname_or_maker_or_category_cont").val(gear_name);
    $('.list-group-item').remove();
  });

});