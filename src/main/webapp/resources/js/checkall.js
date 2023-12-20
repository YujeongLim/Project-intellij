function checkAll(c){
    var arr=document.getElementsByName("chk");
    if(c){
    for(var i=0;i<arr.length;i++){
        arr[i].checked=true;
      }
    }else{
        for(var i=0;i<arr.length;i++){
            arr[i].checked=false;
    }
}
}