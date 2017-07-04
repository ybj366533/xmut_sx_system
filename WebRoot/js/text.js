//初始化全局变量成绩
var grade=0;
window.onload=function(){
    	var tit=document.getElementById("text-nav").getElementsByTagName("input"),
    	con=document.getElementsByClassName("text-num");
    	for (var i = 0;i<tit.length;i++) {
       			tit[i].id=i;
       			tit[i].onmouseover=function(){
            	tit[this.id].style.cursor="pointer";
      	 		}
      	 con[0].style.dispaly="block";		
       	tit[i].onclick=function(){
       				for(var j=0;j<con.length;j++)
         			{
         			con[j].style.display="none";
         			
         			}
         			con[this.id].style.display="block";
        		}  
    }	
}

$(document).ready(function(){
	var text;
	$.ajax(
			{url:"test.action?opt=gettests",async:false,success: function(data, textStatus){
		        text=data;
		      },dataType:"json"}			
	);	

		for(var j=0;j<text.length;j++){
			var answers="";
			var nav='<input type="button" value="'+(j+1)+'" class="num"/>';
			$('#text-nav').append(nav);
				for(var i=0;i<text[j]['answers'].length;i++){
					answers+='<li><div class="icheckbox_div "><input type="radio" name="check" value="'+text[j]['answers'][i]['id']+'"><label style="cursor: pointer;">'+text[j]['answers'][i]['content']+'</label></div></li>'
				//	answers+='<input type="radio" name="check"/>'+'&nbsp'+text[j]['answers'][i]['content']+'<br/>';
				}
			var testnumstart='<div class="text-num" style="display:none" id="'+j+'"><li>';
			var testnumend='</div>';
			$(".text-right").append(testnumstart+(j+1)+'、'+text[j]['content']+'</li>'+'<ol type="A">'+answers+'</ol>'+testnumend);
			if(j==0){
				$(".text-num").css('display','block');
			}
		}
		
		var btnstart='<div class="btn">';
		var back='<input type="button"  value="上一题" class="back-num" />';
		var next='<input type="button"  value="下一题" class="next-num" />';
		var sub='<input type="button"  value="交卷" class="sub"/>';
		var btnend='</div>';
		$(".text-right").append(btnstart+back+next+sub+btnend);
		//下一道题单击事件
		$('.next-num').click(function(){
			$(".text-num").each(function (index){
				//alert($(this).css('display'));
				if(index<text.length-1){
				if($(this).css('display')=='block'){
					$(".text-num").eq(index+1).css('display','block');
					$(".text-num").eq(index).css("display","none");
					var ti=index;
					//找到哪个选项被单击了,并对这道题判断对错
					$(".text-right #"+index+" input").each(function (index){
						if($(this).attr("checked") == "checked"){
							var option=$(this).attr("value");
							var answerid=text[ti]['answerid'];
							//alert(answerid);
							//alert(option);
							//如果这道题做过了，先减2分再判断对错。
							if($('#text-nav input#'+ti).hasClass("finish")){
								grade-=2;
								//判断对错，对了加2分，错了不减分
								if(answerid==option){
									grade+=2;
								}																
							}else{
								//判断对错，对了加2分，错了不减分
								if(answerid==option){
									grade+=2;
								}
							}
						}
					});
					//做了这道题增加一个已做的class
					var tiid=$(this).attr('id');
					$('#text-nav input#'+tiid).addClass('finish');
					if($('#text-nav input#'+(tiid+1)).hasClass("finish")){
						$('#text-nav input#'+(tiid+1)).removeClass('finish');
					}
					return false;
					}
				}
				else{
					$(".next-num").css('background-color','#E8E9EE');
				}
				});
			
			})
		//上一道题按钮单击事件
		$('.back-num').click(function(){
			$(".text-num").each(function (index){
				if(index!=0){
					if($(this).css('display')=='block'){
					$(".text-num").eq(index-1).css('display','block');
					$(".text-num").eq(index).css("display","none");	
					$(".next-num").css('background-color','#0058B4');
					var ti=index;
					//找到哪个选项被单击了,并对这道题判断对错
					$(".text-right #"+index+" input").each(function (index){
						if($(this).attr("checked") == "checked"){
							var option=$(this).attr("value");
							var answerid=text[ti]['answerid'];
							//如果这道题做过了，先减2分再判断对错。
							if($('#text-nav input#'+ti).hasClass("finish")){
								grade-=2;
								//判断对错，对了加2分，错了不减分
								if(answerid==option){
									grade+=2;
								}																
							}else{
								//判断对错，对了加2分，错了不减分
								if(answerid==option){
									grade+=2;
								}
							}
						}
					});
					//做了这道题增加一个已做的class
					var tiid=$(this).attr('id');
					$('#text-nav input#'+index).addClass('finish');		
					if($('#text-nav input#'+(index-1)).hasClass("finish")){
						$('#text-nav input#'+(index-1)).removeClass('finish');
					}
					return false;
					}
				}
				
				});
			})
		//提交试卷单击事件
		$('.sub').click(function(){
			$('#text-nav input').each(function(index){
				if(!$(this).hasClass("finish")){
					layer.open({
	        		    content: '还有题没有做完，确认提交？',
	        		    btn: ['确认', '取消'],
	        		    shadeClose: false,
	        		    yes: function(){
	        		    	$.post("test.action?opt=postgrade",
	        				        {
	        						  grade: grade,
	        				        },
	        				        function(data,status){			           
	        				        	if(data=="true")
	        				            {
	        				        		layer.msg("提交成绩成功");
	        				            	top.location='stu/stu-index.jsp';
	        				            }
	        				            else{
	        				            	layer.msg("提交成绩失败");
	        				            }
	        				        },"html");
	        		    }, no: function(){	
	        		    	
	        		    }
	        		});
				}
			});
			
		})
})

 var SysSecond; 
 var InterValObj;  
 $(document).ready(function() { 
  SysSecond = parseInt(5400); //这里获取倒计时的起始时间 
  InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行 
 }); 
 //将时间减去1秒，计算天、时、分、秒 
 function SetRemainTime() { 
  if (SysSecond > 0) { 
   SysSecond = SysSecond - 1; 
   var second = Math.floor(SysSecond % 60);             // 计算秒     
   var minite = Math.floor(SysSecond / 60);      //计算分 
      //计算小时 
          //计算天 
 
   $("#remainTime").html(  minite + "分" + second + "秒"); 
  } else {//剩余时间小于或等于0的时候，就停止间隔函数 
	  //时间到了让它去单击一次成绩提交按钮
	  $(".sub").click();
	  window.clearInterval(InterValObj); 
   
   //这里可以添加倒计时时间为0后需要执行的事件 
  } 
 } 
