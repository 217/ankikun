function changeForm(){
	var select = document.getElementById("test_testquestions_kind").value;

	if(select === "N択問題"){
		document.createElement("")
	}else if(select === "○×問題"){

	}else if(select === "一問一答"){
	
	}else if(select === "穴埋め"){
	
	}
}	

$(function(){
	$("#test_testquestions_kind").change(
		function(){
			/*
			else if($(this).text === "○×問題"){
	
			}else if($(this).text === "一問一答"){
			
			}else if($(this).text === "穴埋め"){

			}
			*/
			$("#test_testquestions_kind").after("hoge");
	})
});
