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
    <link rel="stylesheet" href="{{ static_url('css/third-part/share.min.css') }}">
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

    <!--线路文章详情-->
    <div class="article">
        <div class="title clearfix">
            <div class="left fl">
                <h2>{{ categoryContent.title }}</h2>
                <ul class="tag clearfix">
                    <li class="fl">车辆：{{ expandData.car_num }}辆</li>
                    <li class="fl">拼车价格：{{ expandData.carpooling_price }}元</li>
                    <li class="fl">服务里程：{{ expandData.service_range }}公里</li>
                </ul>
            </div>
            <div class="right fr">
                <div class="time">开通时间：{{ expandField.getFieldValue(expandFieldList, 'open_time', expandData.open_time) }}</div>
                <div class="social-share" data-sites="wechat,weibo,qq,qzone,tencent"></div>
            </div>
        </div>
        <article>
        {{ content }}
        </article>
    </div>

    <!--相关资讯-->
    <div class="re-info">
        <h2>相关资讯</h2>
        {% set tags = array_column(model.getModel('Tags').getAllByCategoryContentId(categoryContent.id).toArray(), 'id') %}
        <ul class="info-list clearfix">
        	{% if tags is not empty %}
        		{% for value in model.getModel('CategoryContent').getListByTagsIds(tags, 6, 0, 21, true) %}
        		<li class="fl">
	                <a href="{{ value.url }}" class="go-detail" title="查看详情">
	                    <h3>{{ value.title }}</h3>
	                    <div class="time">{{ date("Y-m-d", value.updatetime|strtotime) }}</div>
	                    <div class="img-wrap"><img src="{{ value.image }}" alt="相关资讯新闻图片"></div>
	                    <p>{{ value.description }}</p>
	                    <div class="read">查看详情 ></div>
	                </a>
	            </li>
        		{% endfor %}
        	{% endif %}
        </ul>
    </div>

    <!--周边路线推荐-->
    <div class="command-lines">
        <h2>周边热门线路推荐</h2>
        <ul class="lines-list clearfix">
        	{% for value in model.getModel('CategoryContent').getListByPositions(1, 10, 0, category.id) %}
            <li class="fl"><a href="{{ value.url }}" title="查看路线">{{ value.title }}</a></li>
            {% endfor %}
        </ul>
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
<script src="{{ static_url('js/third-part/jquery.share.min.js') }}"></script>
<script src="{{ static_url('js/utils.js') }}"></script>
<script>
  $(function () {
    // 分享参数配置
    var $config = {
      url                 : window.location.href,// 网址，默认使用 window.location.href
      source              : '', // 来源（QQ空间会用到）, 默认读取head标签：<meta name="site" content="http://overtrue" />
      title               : '', // 标题，默认读取 document.title 或者 <meta name="title" content="share.js" />
      description         : '', // 描述, 默认读取head标签：<meta name="description" content="PHP弱类型的实现原理分析" />
      image               : '', // 图片, 默认取网页中第一个img标签
      sites               : ['qzone', 'qq', 'weibo','wechat'], // 启用的站点
      disabled            : ['google', 'facebook', 'twitter'], // 禁用的站点
      wechatQrcodeTitle   : '微信扫一扫：分享', // 微信二维码提示文字
      wechatQrcodeHelper  : '<p>微信里点“发现”，扫一下</p><p>二维码便可将本文分享至朋友圈。</p>',
      target : '_blank' //打开方式
    };
    $('.social-share').share($config);

    $('.info-list .go-detail').each(function () {
      overflowHidden($(this).find('h3'), 28)
      overflowHidden($(this).find('p'), 72)
    })
  })
</script>
</html>