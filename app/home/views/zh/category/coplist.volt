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
    <link rel="stylesheet" href="{{ static_url('css/third-part/pagination.css') }}">
</head>

<body>
    <div class="about">
        {% include "category/aboutusheader2.volt" %}

        <div class="certificate">
            <div class="certificate-content main-wrap">
                <h2 class="certificate-title">{{ category.name }}</h2>
                <div class="copyright-wrap">
                	{% for info in list %}
                    <div class="copyright-box">
                        <img src="{{ info.image }}" alt="">
                        <p>{{ info.title }}</p>
                    </div>
                    {% endfor %}
                </div>
            </div>
            <div class="page-wrap" style="padding:50px 0;">
                <div class="m-style" id="M-box">{{ paginator.show() }}</div>
                <!--<div id="pager" class="pager clearfix"></div>-->
            </div>
        </div>

        <!--公共尾部 S-->
        {% include "public/footer.volt" %}
    </div>
    <script src="{{ static_url('js/third-part/jquery-1.12.4.min.js') }}"></script>
</body>

</html>