$(document).on('turbolinks:load', function() {
	totalPoint();

	$(function() {
		$(document).on('keyup', '.point_input', function() {
			totalPoint();
    });
  });
  
	function totalPoint() {
        let inputArray = [];
        let sum = 0;
        let inputCost = parseInt($('#cost_point').val());
        let inputSound = parseInt($('#sound_point').val());
        let inputDesign = parseInt($('#design_point').val());
        let inputDurability = parseInt($('#durability_point').val());
        let inputDissatisfaction = parseInt($('#dissatisfaction_point').val());
        inputArray.push(inputCost, inputSound, inputDesign, inputDurability, inputDissatisfaction)
        inputArray.forEach(function(point){
            if ( isNaN(point) ){
                point = 0
                sum += point
            }else{
                sum += point
            }
        })

        $(".gears-new-contents__box__point-container__list__result__point").text( sum +'point');
	};
 });
 