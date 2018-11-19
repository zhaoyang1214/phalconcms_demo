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
    <link rel="stylesheet" href="{{ static_url('css/third-part/share.min.css') }}">
    <link rel="stylesheet" href="{{ static_url('css/newsInfo.css') }}">
</head>
<body>
<div class="news-info">
    <!--公共头部 S-->
    {% include "public/header.volt" %}
    <!--公共头部 E-->

    <!--新闻详情-->
    <div class="news-detail">
        <div class="wrap">
            <h2>{{ categoryContent.title }}</h2>
            <div class="news-source clearfix">
                <p class="fl"><span>来源：{{ categoryContent.copyfrom }}</span><span>作者：{{ categoryContent.admin_nicename }}</span><span>{{ categoryContent.updatetime }}</span></p>
                <div class="social-share fr" data-sites="wechat,weibo,qq,qzone,tencent"></div>
            </div>
            {{ content }}
        </div>
    </div>

    <!--上一篇下一篇-->
    <div class="siblings">
        <ul class="siblings">
            <li>上一篇：{% if prevCategoryContent %}<a href="{{ prevCategoryContent.url }}">{{ prevCategoryContent.title }}</a>{% else %}没有上一篇了{% endif %}</li>
            <li>下一篇：{% if nextCategoryContent %}<a href="{{ nextCategoryContent.url }}">{{ nextCategoryContent.title }}</a>{% else %}没有下一篇了{% endif %}</li>
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
<script src="{{ static_url('js/third-part/jquery-1.12.4.min.js') }}"></script>
<script src="{{ static_url('js/third-part/jquery.share.min.js') }}"></script>
<script>
  $(function () {

    // 分享参数配置
    // var $config = {
    //   url                 : window.location.href,// 网址，默认使用 window.location.href
    //   source              : '', // 来源（QQ空间会用到）, 默认读取head标签：<meta name="site" content="http://overtrue" />
    //   title               : '', // 标题，默认读取 document.title 或者 <meta name="title" content="share.js" />
    //   description         : '', // 描述, 默认读取head标签：<meta name="description" content="PHP弱类型的实现原理分析" />
    //   image               : '', // 图片, 默认取网页中第一个img标签
    //   sites               : ['qzone', 'qq', 'weibo','wechat'], // 启用的站点
    //   disabled            : ['google', 'facebook', 'twitter'], // 禁用的站点
    //   wechatQrcodeTitle   : '微信扫一扫：分享', // 微信二维码提示文字
    //   wechatQrcodeHelper  : '<p>微信里点“发现”，扫一下</p><p>二维码便可将本文分享至朋友圈。</p>',
    //   target : '_blank' //打开方式
    // };
    // $('.social-share').share($config);
  })
</script>
</html>