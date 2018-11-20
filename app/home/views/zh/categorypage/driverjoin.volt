<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ common['title'] }}</title>
    <meta name="keywords" content="{{ common['keywords'] }}">
	<meta name="description" content="{{ common['description'] }}">
	{{ category.seo_content|htmlspecialchars_decode }}
    <link rel="stylesheet" href="{{ static_url('css/reset.css') }}">
    <link rel="stylesheet" href="{{ static_url('css/common.css') }}">
    <link rel="stylesheet" href="{{ static_url('css/aboutUs.css') }}">
</head>

<body>
    <div class="about">
        {% include "category/aboutusheader.volt" %}

        <div class="work-advantage">
            <div class="main-wrap">
                <h2>工作优势</h2>
                <div class="advantage-box">
                    <img src="{{ static_url('images/aboutUs/advantage1.png') }}" alt="">
                    <h3>有保障</h3>
                    <p>专业、合规、工作有长期保障，专车合法运营牌 </br>照数量全国遥遥领先，专车市场第一股。</p>
                </div>
                <div class="advantage-box">
                    <img src="{{ static_url('images/aboutUs/advantage2.png') }}" alt="">
                    <h3>高收入、更轻松</h3>
                    <p>收入高，每单含金量高，同样拉10单，帮邦行赚更多；不用扫街、干的轻松，系统自动指派，轻松接单，另有额外的奖励政策。</p>
                </div>
                <div class="advantage-box">
                    <img src="{{ static_url('images/aboutUs/advantage3.png') }}" alt="">
                    <h3>有保障</h3>
                    <p>工作体面，驾驶中高端车辆，全部15万以上 </br> B级车型，帮邦行让你在城市生活更体面</p>
                </div>
                <div class="advantage-box">
                    <img src="{{ static_url('images/aboutUs/advantage4.png') }}" alt="">
                    <h3>高发展</h3>
                    <p>职业发展，明晰的发展通道 </br> 专业司机 → 车队长 → 运营主管 → 运营经理</p>
                </div>
            </div>
        </div>

        <div class="job-desc main-wrap">
            <div class="desc-text">
                {{ content }}
            </div>
            <img class="join-img" src="{{ static_url('images/aboutUs/join-us.png') }}" alt="">
        </div>

        <div class="recruit-process">
            <div class="main-wrap clearfix">
                <div class="recruit-process_text fl">
                    <h3>招聘流程</h3>
                    <p>持身份证及驾照原件直接到现场报名，并参加面试； </br>
                        面试通过入选，一周内通知办理入职；</br>
                        携带必要资料办理入职手续 </br>
                        公司分配车辆和随车物品，司机上线</p>
                </div>
                <div class="recruit-form_box fr">
                    <div class="recruit-form_title">我要加入</div>
                    <p class="tip">填写以下信息，方便我们跟您联系</p>
                    <form action="" method="post">
                        <div class="input-item">
                            <label for="">姓名：</label>
                            <input class="name-input" id="name" maxlength="15"  style="width:100%" type="text" placeholder="请输入您的姓名">
                            <p class="error-text"></p>
                        </div>
                        <div class="input-item">
                            <label for="">所在城市：</label>
                            <div id="citySelector">
                                <div data-toggle="distpicker">
                                    <select aria-placeholder="选择省" id="province"></select><!-- 省 -->
                                    <select id="city"></select><!-- 市 -->
                                    <select id="district"></select><!-- 区 -->
                                </div>
                            </div>
                        </div>
                        <div class="input-item clearfix">
                            <div class="fl">
                                <label for="">联系方式：</label>
                                <input class="phone-input" id="phone" maxlength="11" style="width:250px" type="text" placeholder="请输入您的手机号码">
                                <p class="error-text"></p>
                            </div>
                            <div class="fr">
                                <label for="">验证码：</label>
                                <input class="code-input" id="verify_code" maxlength="4" style="width:250px" type="text" placeholder="请输入验证码">
                                <p class="error-text"></p>
                                <img class="code-img" src="{{ url('form/verify') }}" onclick="this.src=this.src+'/'+Math.random();" alt="验证码图片">
                            </div>
                        </div>
                        <div class="input-item clearfix">
                            <div class="fl">
                                <p class="error-text" id="msg-error"></p>
                            </div>
                        </div>
                        <button type="submit">立即提交</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- 提交成功 -->
        <div id="mask">
            <div class="common-submit-success">
                <h2>我要加入</h2>
                <img src="{{ static_url('images/success.png') }}" alt="提交成功">
                <p class="success">提交成功</p>
                <p class="tip">感谢您的留言，工作人员将在3～5个工作日内联系您</p>
                <div class="close" onclick="closeMask()"></div>
            </div>
        </div>

        <!--公共尾部 S-->
        {% include "public/footer.volt" %}
    </div>
    <script src="{{ static_url('js/third-part/jquery-1.12.4.min.js') }}"></script>
    <script src="{{ static_url('js/third-part/distpicker/distpicker.data.min.js') }}"></script>
    <script src="{{ static_url('js/third-part/distpicker/distpicker.min.js') }}"></script>
    <script>
    $(function () {
    	$('#citySelector').distpicker({
            province: "选择省份",
            city: "选择市",
            district: "选择县",
            autoSelect: false
        });
    	$(".error-text").show();
    	$("form").submit(function(e){
       	    e.preventDefault();
       	    var name = $("#name").val();
       	 	if(name.length == '') {
    	    	$("#name").next('.error-text').text('姓名不能为空');
    	    	$("#name").addClass('error-border');
    	    	return false;
    	    } else if(name.length>15) {
       	    	$("#name").next('.error-text').text('姓名不可超过15个字符');
       	    	$("#name").addClass('error-border');
       	    	return false;
       	    }
       	 	$("#name").next('.error-text').text('');
	    	$("#name").removeClass('error-border');
	    	
       	    var province = $("#province option:selected").val();
       	    var city = $("#city option:selected").val();
       	    var district = $("#district option:selected").val();
	       	if(province == '') {
	 	    	$("#citySelector").next('.error-text').text('请选择省');
	 	    	$("#province").addClass('error-border');
	 	    	return false;
	 	    }
	       	$("#province").removeClass('error-border');
	       	if(city == '') {
	 	    	$("#citySelector").next('.error-text').text('请选择市');
	 	    	$("#city").addClass('error-border');
	 	    	return false;
	 	    }
	       	$("#city").removeClass('error-border');
	       	/* if(district == '') {
	 	    	$("#citySelector").next('.error-text').text('请选择县');
	 	    	$("#district").addClass('error-border');
	 	    	return false;
	 	    } */
	       	$("#district").removeClass('error-border');
	 	    var join_line = province + ' ' + city + ' ' + district;
       	    var phone = $("#phone").val();
       	    if(!(/^1[3|5|6|7|8][0-9]\d{8}$/.test(phone))) {
       	    	$("#phone").next('.error-text').text('请输入有效的11位手机号码');
       	    	$("#phone").addClass('error-border');
       	    	return false;
       	    }
       	 	$("#phone").next('.error-text').text('');
       	 	$("#phone").removeClass('error-border');
       	 	
       	 	var verify_code = $("#verify_code").val();
    	    if(!(/^[\da-zA-Z]{4}$/.test(verify_code))) {
    	    	$("#verify_code").nextAll('.error-text').text('验证码不正确，请重新输入');
    	    	$("#verify_code").addClass('error-border');
    	    	return false;
    	    }
    	    $("#verify_code").nextAll('.error-text').text('');
    	    $("#verify_code").removeClass('error-border');
    	    
       	 	var myDate = new Date();
       	    var cre_time = myDate.getFullYear() + '-' + myDate.getMonth() + '-' + myDate.getDate() + ' ' + myDate.getHours() + ':' + myDate.getMinutes() + ':' + myDate.getSeconds();
       	 	
       	 	var form = $(this);
       	 	if(form.hasClass('submit')) {
       	 		return false;
       	 	}
       	 	form.addClass('submit');
       	 	
       	 	$.ajax({
    	        type: "POST",
    	        url: "{{ url('form/add') }}",
    	        dataType: "json",
    	        data: {no:"3c94cfc3c5430bd7796e895936aba4fa",verify_code:verify_code,name:name,join_line:join_line,phone:phone,cre_time:cre_time},
    	        async:false,
    	        success: function (data) {
    	        	form.removeClass('submit');
    	        	$(".code-img").click();
    	        	console.log(data);
    	            if(data.status==10000) {
    	            	$(".tip").text(data.message);
    	            	form[0].reset();
    	            	submitSuccess();
    	            } else {
    	            	$("#msg-error").text(data.message);
    	            }
    	        }
    	    });
       	 	return false;
       	  });
        
        
    });
 // 表单提交成功事件
    function submitSuccess(){
        $('#mask').fadeIn(300)
        $('.common-submit-success').fadeIn(300)
    }
    function closeMask() {
        $('#mask').fadeOut(300);
    }
    </script>
</body>

</html>