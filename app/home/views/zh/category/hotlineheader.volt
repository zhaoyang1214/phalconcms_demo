<div class="banner">
    <img class="banner-img" src="{{ model.getModel('FormData').getAllByTableName('hotline_banner', ['limit':1])[0].image }}" alt="banner">
    <div class="wrap">
        <div class="leave-message">
            <p>热门线路：{{ model.getModel('Fragment').getOneBySign('hot_city').content|htmlspecialchars_decode|striptags  }}</p>
            <div class="btn">+ 留言反馈</div>
        </div>
    </div>
    <!--表单-->
    <div class="message-pop">
        <div class="con">
            <h2>留言反馈</h2>
            <div class="tip">填写以下信息，方便我们跟您联系</div>
            <form>
                <div class="item">
                    <label for="">昵称：</label>
                    <input class="" id="nickname" maxlength="10" type="text" placeholder="我们怎么称呼您（昵称10个字符以内）">
                    <div class="error"></div>
                </div>

                <div class="item">
                    <label for="">所在城市：</label>
                    <div id="citySelector">
                        <div data-toggle="distpicker">
                            <select class="" id="province"></select><!-- 省 -->
                            <select class="" id="city"></select><!-- 市 -->
                            <select class="" id="district"></select><!-- 区 -->
                        </div>
                    </div>
                    <div class="error"></div>
                    <!--<input type="text" placeholder="希望了解到您所在的城市">-->
                </div>


                <div class="clearfix">
                    <div class="fl phone item">
                        <label for="">联系方式：</label>
                        <input type="text" id="phone" maxlength="11" placeholder="能联系到您的手机号码">
                        <div class="error"></div>
                    </div>
                    <div class="fl code item">
                        <label for="">验证码：</label>
                        <input type="text" id="verify_code" maxlength="4" placeholder="请输入验证码">
                        <span class="change">看不清，换一张</span>
                        <img class="code-img" src="{{ url('form/verify') }}" onclick="this.src=this.src+'/'+Math.random();" alt="验证码图片">
                        <div class="error"></div>
                    </div>
                </div>
                <div class="item">
                    <label for="">留言：</label>
                    <textarea name="" id="message" cols="30" rows="10" maxlength="100" cols="30" rows="10" placeholder="请输入您的咨询问题，我们会尽快给您一个满意的答复。(100字以内)"></textarea>
                    <div class="error"></div>
                </div>
                <div class="item">
					<div id="msg-error" class="error"></div>
				</div>
                <button>立即提交</button>
            </form>
            <div class="close"></div>
        </div>
        <!--提交成功-->
        <div class="common-submit-success">
            <h2>留言反馈</h2>
            <img src="{{ static_url('images/success.png') }}" alt="提交成功">
            <p class="success">提交成功</p>
            <p class="tip">感谢您的留言，工作人员将在3～5个工作日内联系您</p>
            <div class="close"></div>
        </div>
    </div>
</div>
<script>
    $(function () {
    	// 表单显示
        $('.banner .wrap .btn').click(function () {
          $('.banner .message-pop').fadeIn(300)
        });

        // 表单隐藏
        $('.banner .message-pop .close').click(function () {
          $(".con").fadeIn(3000);
          $(".common-submit-success").hide();
          $('.banner .message-pop').fadeOut(300);
        });
      
        $(".change").click(function(){
    	    $(".code-img").attr('src', $(".code-img").attr('src') + '/' + Math.random());
        });
        
        $('#citySelector').distpicker({
            province: "选择省份",
            city: "选择市",
            district: "选择县",
            autoSelect: false
        });
        
        $("form").submit(function(e){
       	    e.preventDefault();
       	    var nickname = $("#nickname").val();
       	    if(nickname.length>10) {
       	    	$("#nickname").next('.error').text('昵称不可超过10个字符');
       	    	$("#nickname").addClass('error-border');
       	    	return false;
       	    }
       	 	$("#nickname").next('.error').text('');
	    	$("#nickname").removeClass('error-border');
	    	
       	    var province = $("#province option:selected").val();
       	    var city = $("#city option:selected").val();
       	    var district = $("#district option:selected").val();
	       	if(province == '') {
	 	    	$("#citySelector").next('.error').text('请选择省');
	 	    	$("#province").addClass('error-border');
	 	    	return false;
	 	    }
	       	$("#province").removeClass('error-border');
	       	if(city == '') {
	 	    	$("#citySelector").next('.error').text('请选择市');
	 	    	$("#city").addClass('error-border');
	 	    	return false;
	 	    }
	       	$("#city").removeClass('error-border');
	       	/* if(district == '') {
	 	    	$("#citySelector").next('.error').text('请选择县');
	 	    	$("#district").addClass('error-border');
	 	    	return false;
	 	    } */
	       	$("#district").removeClass('error-border');
       	    city = province + ' ' + city + ' ' + district;
       	    var phone = $("#phone").val();
       	    if(!(/^1[3|5|6|7|8][0-9]\d{8}$/.test(phone))) {
       	    	$("#phone").next('.error').text('请输入有效的11位手机号码');
       	    	$("#phone").addClass('error-border');
       	    	return false;
       	    }
       	 	$("#phone").next('.error').text('');
       	 	$("#phone").removeClass('error-border');
       	 	
       	 	var verify_code = $("#verify_code").val();
    	    if(!(/^[\da-zA-Z]{4}$/.test(verify_code))) {
    	    	$("#verify_code").nextAll('.error').text('验证码不正确，请重新输入');
    	    	$("#verify_code").addClass('error-border');
    	    	return false;
    	    }
    	    $("#verify_code").nextAll('.error').text('');
    	    $("#verify_code").removeClass('error-border');
    	    
    	    var message =$("#message").val();
       	 	if(message.length>100) {
       	 		$("#message").next('.error').text('留言不可超过100个字符');
       	 		$("#message").addClass('error-border');
    	    	return false;
    	    } else if(message.length == 0){
    	    	$("#message").next('.error').text('留言不可为空');
    	    	$("#message").addClass('error-border');
    	    	return false;
    	    }
       	 	$("#message").next('.error').text('');
       	 	$("#message").removeClass('error-border');
       	 	
       	 	var myDate = new Date();
       	 	msg_time = myDate.getFullYear() + '-' + myDate.getMonth() + '-' + myDate.getDate() + ' ' + myDate.getHours() + ':' + myDate.getMinutes() + ':' + myDate.getSeconds();
       	 	var form = $(this);
       	 	if(form.hasClass('submit')) {
       	 		return false;
       	 	}
       	 	form.addClass('submit');
       	 	
       	 	$.ajax({
    	        type: "POST",
    	        url: "{{ url('form/add') }}",
    	        dataType: "json",
    	        data: {no:"386bc4714d709824cd5d4a19921e33b6",verify_code:verify_code,nickname:nickname,city:city,phone:phone,message:message,msg_time:msg_time},
    	        async:false,
    	        success: function (data) {
    	        	form.removeClass('submit');
    	        	$(".code-img").click();
    	        	console.log(data);
    	            if(data.status==10000) {
    	            	$(".con").hide();
    	            	$(".tip").text(data.message);
    	            	$(".common-submit-success").show();
    	            	form[0].reset();
    	            } else {
    	            	$("#msg-error").text(data.message);
    	            }
    	            
    	        }
    	    });
       	 	return false;
       	  });
    })
</script>
</html>