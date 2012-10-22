// jQueryのソース
//
$(function(){
	$("select").each(function(){
		$(this).match(/ test_questions_kind[0-9]* /).live("change",function(){
			alert("hoge");
		});
	});
});
