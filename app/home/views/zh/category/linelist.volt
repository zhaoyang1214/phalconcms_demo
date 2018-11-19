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
    <link rel="stylesheet" href="{{ static_url('css/third-part/pagination.css') }}">
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

    <!--线路列表-->
    <div class="line-list">
        <table id="lineList">
            <caption>{{ category.name }}地区相关线路</caption>
            <thead>
                <tr>
                    <th class="border"></th>
                    <th class="border">线路</th>
                    <th>开通时间</th>
                    <th>车辆总数</th>
                    <th>车型</th>
                    <th>服务里程</th>
                </tr>
            </thead>
            <tbody>
                {% for info in list %}
                <tr onclick="location.href='{{ info.url }}'">
                    <td class="border">{{ loop.index }}</td>
                    <td class="border">{{ info.title }}</td>
                    <td>{{ expandField.getFieldValue(expandFieldList, 'open_time', info.open_time) }}</td>
                    <td>{{ info.car_num }}辆</td>
                    <td>{{ implode('、', expandField.getFieldValue(expandFieldList, 'car_type', info.car_type)) }}</td>
                    <td>{{ info.service_range }}公里</td>
                </tr>
                {% endfor %}
            </tbody>
        </table>
        <div class="page-wrap">
            <div class="m-style" id="M-box">{{ paginator.show() }}</div>
            <!--<div id="pager" class="pager clearfix"></div>-->
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

</html>