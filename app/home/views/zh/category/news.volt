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
    <link rel="stylesheet" href="{{ static_url('css/index.css') }}">
    <link rel="stylesheet" href="{{ static_url('css/third-part/pagination.css') }}">
    <link rel="stylesheet" href="{{ static_url('css/newsInfo.css') }}">
</head>
<body>
<div class="news-info">

    {% include "category/newsheader.volt" %}

    <!--tab-->
    <div class="tab-tit">
        <ul class="clearfix">
            <li class="fl active"><a href="{{ category.url }}">全部</a></li>
            {% for info in model.getModel('Category').categoryGroup(category.id, 1) %}
            <li class="fl"><a href="{{ info['url'] }}">{{ info['name'] }}</a></li>
            {% endfor %}
        </ul>
    </div>

    <div class="news-list">
        <ul class="clearfix">
        	{% for info in list %}
            <li class="fl">
                <a href="{{ info.url }}" class="link" title="查看详情">
                    <h3>{{ info.title }}</h3>
                    <p class="time">{{ date("Y-m-d", info.updatetime|strtotime) }}</p>
                    <div class="img-wrap"><img src="{{ info.image }}" alt="新闻图片"></div>
                    <p class="con">{{ info.description }}</p>
                    <p class="more">查看详情 ></p>
                </a>
            </li>
            {% endfor %}
        </ul>
        <!--分页-->
        <div class="page-wrap">
            <div class="m-style" id="M-box">{{ paginator.show() }}</div>
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
<script src="{{ static_url('js/third-part/jquery-1.12.4.min.js') }}"></script>
<script src="{{ static_url('js/utils.js') }}"></script>
<script type="text/javascript">
    // 超出省略号
    $('.news-list li').each(function () {
      overflowHidden($(this).find('h3'), 28)
      overflowHidden($(this).find('.con'), 72)
    });

</script>
</html>