// jQueryのソース
//
$(function(){
	// セレクトを一括取得
	$("select").each(function(){
		// /^test_questions_kind[0-9]*$/ にヒットするものを実行
		$("#" + $(this).attr("id").match(/^test_questions_kind[0-9]*$/)).live("change",function(){
			alert($(this).val());
			// alert(typeof($this));
		});
	});
});
