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
            </div>
        </div>
        <!-- 发展历程 -->
        <div class="course main-wrap">
            <h2>发展历程</h2>
            <p class="course-desc">见证我们从初生到懵懂，从懵懂到成熟，从一叶扁舟发展为远行巨航。</p>
            <div class="course-slider">
            	{% for info in model.getModel('FormData').getAllFormat('history') %}
                {% if loop.index % 2 %}
                <div class="slider-item">
                    <div class="slider-content">
                        <p class="course-time">{{ info['time'] }}</p>
                        <p class="course-content">{{ info['event'] }}</p>
                    </div>
                </div>
                {% else %}
                <div class="slider-item">
                    <div class="slider-content">
                        <p class="course-content">{{ info['event'] }}</p>
                        <p class="course-time">{{ info['time'] }}</p>
                    </div>
                </div>
                {% endif %}
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
                slideWidth: 222,
                minSlides: 2,
                maxSlides: 3,
                moveSlides: 1,
                hideControlOnEnd: true
                // shrinkItems: true
            });
        });
    </script>
</body>

</html>