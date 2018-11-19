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
    <link rel="stylesheet" href="{{ static_url('css/third-part/jquery.bxslider.css') }}">
</head>

<body>
    <div class="about">
        {% include "category/aboutusheader.volt" %}

        <!-- 公司介绍 -->
        <div class="introduce">
            <div class="main-wrap">
            	{{ content }}
                <!-- <h2>公司介绍</h2>
                <h3>“互联网+智慧出行”，为用户提供安全、便捷的出行服务</h3>
                <div class="introduce-desc">
                    <p>“帮邦行”网约出行服务平台隶属于蓝海科技有限责任公司，致力于“互联网+智慧出行”，为用户提供安全、便捷的“城际出行、城内出行、跨城闪送、公务用车”等服务。帮邦行已取得全国网络预约出租汽车线上服务能力认证，拥有工信部授予的全国统一客服号（95170）使用证书。</p>

                    <p>公司目前已在各地设立30个以上分公司，5个客服中心，员工总人数超过500人，技术研发团队超过200人，出行业务覆盖全国300多个市、显、自治区，拥有独立产品设计、技术研发以及市场拓展、互联网营销推广、线路运营和7*24*365在线客服服务。公司始终坚持技术创新，并已获得数十个出行相关软件著作权和设计专利</p>
                </div>
                <img src="../../static/images/aboutUs/company.png" alt=""> -->
            </div>
        </div>
        <!-- 发展历程 -->
        <div class="course main-wrap">
            <h2>发展历程</h2>
            <p class="course-desc">见证我们从初生到懵懂，从懵懂到成熟，从一叶扁舟发展为远行巨航。</p>
            <div class="course-slider">
            	{% for info in model.getModel('FormData').getAllFormat('history') %}
                <div class="slider-item">
                    <p class="course-time">{{ info['time'] }}</p>
                    <p class="course-content">{{ info['event'] }}</p>
                </div>
                {% endfor %}
            </div>
        </div>

        <!-- 打造服务平台 -->
        <div class="service-platform">
            <div class="main-wrap">
                <h2>打造人人信赖的出行服务平台</h2>
                <p class="sub-title">我们的使命</p>
                <div>
                	{% for info in model.getModel('FormData').getAllByTableName('us_mission') %}
                    <div class="platform-item">
                        <img src="{{ info.image }}" alt="">
                        <p class="item-title">{{ info.title }}</p>
                    </div>
                    {% endfor %}
                </div>
            </div>
        </div>
        <!--公共尾部 S-->
        {% include "public/footer.volt" %}
    </div>
    <script src="{{ static_url('js/third-part/jquery-1.12.4.min.js') }}"></script>
    <script src="{{ static_url('js/third-part/jquery.bxslider.min.js') }}"></script>
    <script>
        $(document).ready(function () {
            $('.course-slider').bxSlider({
                infiniteLoop: false,
                slideWidth: 200,
                minSlides: 2,
                maxSlides: 3,
                moveSlides: 1,
                slideMargin: 10
            });
        });
    </script>
</body>

</html>