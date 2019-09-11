/**
 리스트에 ID 값에 숫자 붙이기  
 */

function gfn_getParam(url,key){
   var parameters = [];
   var rtn_param = "";
	
   parameters = url.split("&");
   
   for ( var k =0; k < parameters.length; k++ ){
       if (parameters[k].split("=")[1].length > 0 ){
       	var val = parameters[k].split("=")[0];
       	var param = parameters[k].split("=")[1];
       	
       	if(key == val){
       		rtn_param = param;
       	}
       }
   }
   
   return rtn_param == "" ? "" : rtn_param;
}


//숫자 앞에 0이없을경우
function gfn_leadingZeros(data, num) {
	 var zero = '';
	 data = gfn_null(data).toString();
	
	 if (data.length < num) {
	  for (var i = 0; i < num - data.length; i++)
	   zero += '0';
	 }
	 return zero + data;
}














