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
        {% include "category/aboutusheader.volt" %}

        <div class="partner-wrap">
            <div class="main-wrap">
            	{% for info in list %}
                <div class="partner-box">
                    <div class="partner-logo">
                        <img src="{{ info.image }}" alt="">
                    </div>
                    <p>{{ info.description }}</p>
                </div>
                {% endfor %}
            </div>
            <div class="page-wrap">
                <div class="m-style" id="M-box">{{ paginator.show() }}</div>
                <!--<div id="pager" class="pager clearfix"></div>-->
            </div>
        </div>

        {% include "public/footer.volt" %}
    </div>
    <script src="{{ static_url('js/third-part/jquery-1.12.4.min.js') }}"></script>
</body>

</html>