<?php
header("Content-Type: text/html; charset=UTF-8");

$key = "S3Otb5s95cNPfNu3q17DyQ";//密钥

$timestamp = time();//时间戳

$nS= $timestamp/30%1000000;//每10秒变一次

$code = md5($key.$nS);

$code_s = substr($code,0,6);

echo "时间戳:".$timestamp."</br>";
echo "密钥:".$key."</br>";
echo "取时间戳:".$nS."</br>";
echo "加密时间戳:".$code."</br>";
echo "取6个字母:".$code_s."</br>";
echo "字母转换成数字:".getalphnum($code_s);

function getalphnum($char){
	$array=array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9');
	$len=strlen($char);
	$sum = 0;
	for($i=0;$i<$len;$i++){
		$index=array_search($char[$i],$array);
		$sum+=($index+1)*pow(36,$len-$i-1);
	}
	return $sum;
}
?>