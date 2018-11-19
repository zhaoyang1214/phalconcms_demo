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
		{% set list = list.toArray() %}
        <div class="certificate">
            <div class="certificate-content main-wrap">
                <h2 class="certificate-title">{{ category.name }}</h2>
                <div class="license-wrap">
                	{% set first = array_shift(list) %}
                    <div class="license-wrap_lf">
                        <div class="license-box">
                            <img src="{{ first['image'] }}" alt="{{ first['title'] }}">
                            <p>{{ first['title'] }}</p>
                        </div>
                    </div>
                    {% set list1 = array_slice(list, 0, 4) %}
                    <div class="license-wrap_rg">
                    	{% for info in list1 %}
                        <div class="license-box">
                            <img src="{{ info['image'] }}" alt="{{ info['title'] }}">
                            <p>{{ info['title'] }}</p>
                        </div>
                        {% endfor %}
                    </div>
                    {% set list2 = array_slice(list, 4) %}
                    <div class="license-bx-sm">
                    	{% for info in list2 %}
                        <div class="license-box">
                            <img src="{{ info['image'] }}" alt="{{ info['title'] }}">
                            <p>{{ info['title'] }}</p>
                        </div>
                        {% endfor %}
                    </div>

                </div>
            </div>
            <div class="page-wrap" style="padding:50px 0;">
                <div class="m-style" id="M-box">{{ paginator.show() }}</div>
            </div>
        </div>

        <!--公共尾部 S-->
        {% include "public/footer.volt" %}
    </div>
    <script src="{{ static_url('js/third-part/jquery-1.12.4.min.js') }}"></script>
</body>

</html>