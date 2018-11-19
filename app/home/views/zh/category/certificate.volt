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
		{% set categoryList = model.getModel('Category').categoryGroup(category.id, 1) %}
        <div class="certificate">
            <div class="certificate-content main-wrap">
            	{% if categoryList[0] is defined %}
                <h2 class="certificate-title">{{ categoryList[0]['name'] }}<a href="{{ categoryList[0]['url'] }}">查看更多</a></h2>
                {% set licenseList = model.getModel('CategoryContent').getListByCategoryId(categoryList[0]['id'], 5).toArray() %}
                {% set firstLicense = array_shift(licenseList) %}
                <div class="license-wrap">
                    <div class="license-wrap_lf">
                        <div class="license-box">
                            <img src="{{ firstLicense['image'] }}" alt="">
                            <p>{{ firstLicense['title'] }}</p>
                        </div>
                    </div>
                    <div class="license-wrap_rg">
                    	{% for info in licenseList %}
                        <div class="license-box">
                            <img src="{{ info['image'] }}" alt="">
                            <p>{{ info['title'] }}</p>
                        </div>
                        {% endfor %}
                    </div>
                </div>
                {% endif %}
                {% if categoryList[1] is defined %}
                <h2 class="certificate-title">{{ categoryList[1]['name'] }}<a href="{{ categoryList[1]['url'] }}">查看更多</a></h2>
                <div class="copyright-wrap">
                	{% for info in model.getModel('CategoryContent').getListByCategoryId(categoryList[1]['id'], 8) %}
                    <div class="copyright-box">
                        <img src="{{ info.image }}" alt="">
                        <p>{{ info.title }}</p>
                    </div>
                    {% endfor %}
                </div>
                {% endif %}
                {% if categoryList[2] is defined %}
                <h2 class="certificate-title">{{ categoryList[2]['name'] }}<a href="{{ categoryList[2]['url'] }}">查看更多</a></h2>
                <div class="trademark-wrap">
                	{% for info in model.getModel('CategoryContent').getListByCategoryId(categoryList[2]['id'], 4) %}
                    <div class="copyright-box">
                        <img src="{{ info.image }}" alt="">
                        <p>{{ info.title }}</p>
                    </div>
                    {% endfor %}
                </div>
                {% endif %}
            </div>
        </div>

        <!--公共尾部 S-->
        {% include "public/footer.volt" %}
    </div>

</body>

</html>