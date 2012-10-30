var Timer1; //タイマーを格納する変数（タイマーID）の宣言

//カウントダウン関数を1000ミリ秒毎に呼び出す関数
window.onload = function Start(){
  // document.timer.elements[2].disabled = true;
  Timer1 = setInterval("CountDown()",1000);
}

/*
//タイマー停止関数
function Stop(){
  document.timer.elements[2].disabled = false;
  clearInterval(Timer1);
}
*/						

//カウントダウン関数
function CountDown(){
	try{
	  var min = document.timer.elements[0].value;
  	var sec = document.timer.elements[1].value;
	}catch(e){
  	return;
	}

  
	if (min == "") min = 0;
  min = parseInt(min);
    
  if (sec == "") sec = 0;
  sec = parseInt(sec);
    
  TMWrite(min * 60 + sec - 1);
}

//残り時間を書き出す関数
function TMWrite(int)
{
  int = parseInt(int);
  
  if (int <= 0){
    document.getElementById("testForm").submit();
  }else{
    //残り分数はintを60で割って切り捨てる
    document.timer.elements[0].value = Math.floor(int/60);
    //残り秒数はintを60で割った余り
    document.timer.elements[1].value=int % 60;
  }
}
