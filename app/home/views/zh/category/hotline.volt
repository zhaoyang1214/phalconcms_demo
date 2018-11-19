<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{ common['title'] }}</title>
    <meta name="keywords" content="{{ common['keywords'] }}">
	<meta name="description" content="{{ common['description'] }}">
	{{ category.seo_content|htmlspecialchars_decode }}
    <link rel="stylesheet" href="{{ static_url('css/reset.css') }}">
    <link rel="stylesheet" href="{{ static_url('css/common.css') }}">
    <link rel="stylesheet" href="{{ static_url('css/hotLines.css') }}">
    <script src="{{ static_url('js/third-part/jquery-1.12.4.min.js') }}"></script>
    <script src="{{ static_url('js/third-part/distpicker/distpicker.data.min.js') }}"></script>
	<script src="{{ static_url('js/third-part/distpicker/distpicker.min.js') }}"></script>
</head>
<body>
<div class="hot-lines">
    <!--公共头部 S-->
    {% include "public/header.volt" %}
    <!--公共头部 E-->

    <!--热门路线页面共用banner S-->
    {% include "category/hotlineheader.volt" %}
    <!--热门路线页面共用banner E-->

    <!--城市列表-->
    <div class="city-list">
        <h2>按省份首字母选择</h2>
        <div class="content-box clearfix">
            {% for list1 in model.getModel('Category').categoryGroup(category.id, 3) %}
            <div class="content-letter">
                <span class="content-letter-panel">{{ list1['name'] }}</span>
                {% for list2 in list1['child'] %}
                <div class="content-province">
                    <span class="content-province-triangle"></span>
                    <div class="content-province-title">{{ list2['name'] }}</div>
                    <div class="content-cities">
                    	{% for list3 in list2['child'] %}
                        <a href="{{ list3['url'] }}" class="content-city">{{ list3['name'] }}</a>
                        {% elsefor %}
                        <a class="content-city"></a>
                        {% endfor %}
                    </div>
                </div>
                {% endfor %}
            </div>
            {% endfor %}
        </div>
    </div>

    <!--公共尾部 S-->
    {% include "public/footer.volt" %}
    <!--公共尾部 E-->
</div>
</body>
<!--[if IE]>
　　<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.js"></script>
　　<script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<![endif]-->
<script>
    $(function () {
      // 动态设置城市样式高度
      $('.content-letter .content-province-title').each(function () {
        $(this).height($(this).siblings('.content-cities').outerHeight(true))
      });
      $('.content-letter').each(function () {
        var h = 0;
        $(this).find('.content-province').each(function () {
            h += $(this).outerHeight(true)
        });
        $(this).find('.content-letter-panel').css({
          height: h + 'px',
          lineHeight: h + 'px'
        })
      });
    })
</script>
</html>