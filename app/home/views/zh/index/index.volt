<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{ common['title'] }}</title>
    <meta name="keywords" content="{{ common['keywords'] }}">
	<meta name="description" content="{{ common['description'] }}">
    <link rel="stylesheet" href="{{ static_url('css/reset.css') }}">
    <link rel="stylesheet" href="{{ static_url('css/common.css') }}">
    <link rel="stylesheet" href="{{ static_url('css/third-part/jquery.bxslider.css') }}">
    <link rel="stylesheet" href="{{ static_url('css/index.css') }}">
</head>
<body>
    <div class="index">
        <!--公共头部 S-->
        {% include "public/header.volt" %}
        <!--公共头部 E-->

        <!--banner-->
        <div class="banner">
            <ul class="bxslider">
                {% for banner in model.getModel('FormData').getAllByTableName('index_banner') %}
                <li><a href="{{ banner.url }}"><img src="{{ banner.image }}" alt="{{ banner.title }}"/></a></li>
                {% endfor%}
            </ul>
            <!--数据-->
            <ul class="data">
                <li class="fl">
                    <p><strong>{{ model.getModel('Fragment').getOneBySign('license_plate_number').content|htmlspecialchars_decode|striptags|number_format  }}</strong><span>张</span><img src="{{ static_url('images/license_icon.png') }}" alt="已获得牌照"></p>
                    <h3>已获得牌照</h3>
                    <sub>LICENSE PLATE</sub>
                </li>
                <li class="fl">
                    <p><strong>{{ model.getModel('Fragment').getOneBySign('service_range').content|htmlspecialchars_decode|striptags|number_format  }}</strong><span>km</span><img src="{{ static_url('images/service_icon.png') }}" alt="服务里程"></p>
                    <h3>服务里程</h3>
                    <sub>SERVICE MILEAGE</sub>
                </li>
                <li class="fl">
                    <p><strong>{{ model.getModel('Fragment').getOneBySign('in_areas').content|htmlspecialchars_decode|striptags|number_format  }}</strong><span>地区</span><img src="{{ static_url('images/resident_icon.png') }}" alt="已入驻地区"></p>
                    <h3>已入驻地区</h3>
                    <sub>RESIDENT AREA</sub>
                </li>
            </ul>
        </div>

        <!--新闻-->
        <div class="news">
            <div class="top-title clearfix">
                <div class="left fl">
                    <h2>企业新闻</h2>
                    <sub>NEWS</sub>
                </div>
                <div class="right fr">
                    <a href="{{ model.getModel('Category').getOne(21).url }}" title="查看更多" class="more">MORE</a>
                </div>
            </div>
            <div class="news-list clearfix">
                <ul class="news-block fl">
                	{% for firstNews in model.getModel('CategoryContent').getListByPositions(2, 1, 0, 21, true) %}
                    <li>
                        <a class="link" href="{{ firstNews.url }}" title="{{ firstNews.title }}"><img src="{{ firstNews.image }}" alt="{{ firstNews.title }}"></a>
                        <div class="title clearfix">
                            <h3 class="fl text-overflow"><a href="{{ firstNews.url }}" title="{{ firstNews.title }}">{{ firstNews.title }}</a></h3>
                            <span class="fr">{{ date("Y-m-d", firstNews.updatetime|strtotime) }}</span>
                        </div>
                        <p><a href="{{ firstNews.url }}" title="{{ firstNews.title }}">{{ firstNews.description }}</a></p>
                    </li>
                    {% endfor %}
                </ul>
                <ul class="list fr">
                	{% for news in model.getModel('CategoryContent').getListByPositions(2, 4, 1, 21, true) %}
                    <li class="clearfix">
                        <a class="link" href="{{ news.url }}" title="{{ news.title }}">
                            <div class="time fl"><strong>{{ date("d", news.updatetime|strtotime) }}</strong><span>{{ date("Y-m", news.updatetime|strtotime) }}</span></div>
                            <div class="news-summary fr">
                                <h3 class="text-overflow">{{ news.title }}</h3>
                                <p>{{ news.description }}</p>
                            </div>
                        </a>
                    </li>
                    {% endfor %}
                </ul>
            </div>
        </div>

        <!--业务-->
        <div class="business">
            <div class="wrap">
                <h2>自在出行，一触即发</h2>
                <sub class="sub">24小时门对门接送 安全直达目的地</sub>
                <ul class="business-list">
                    <li class="fl">
                        <div class="right fr">
                            <h3>城际出行</h3>
                            <sub>INTERCITY TRAVEL</sub>
                        </div>
                        <img class="fr" src="{{ static_url('images/intercity.png') }}" alt="城际出行">
                    </li>
                    <li class="fl back-2">
                        <div class="right fr">
                            <h3>城内出行</h3>
                            <sub>INTRA CITY TRAVEL</sub>
                        </div>
                        <img class="fr" src="{{ static_url('images/localcity.png') }}" alt="城内出行">
                    </li>
                    <li class="fl">
                        <div class="right fr">
                            <h3>跨城闪送</h3>
                            <sub>CROSS CITY FLASHING</sub>
                        </div>
                        <img class="fr" src="{{ static_url('images/sendgoods.png') }}" alt="跨城闪送">
                    </li>
                    <li class="fl back-2">
                        <div class="right fr">
                            <h3>公务用车</h3>
                            <sub>GOVERNMENT CAR</sub>
                        </div>
                        <img class="fr" src="{{ static_url('images/govcar.png') }}" alt="公务用车">
                    </li>
                </ul>
            </div>
        </div>

        <!--介绍-->
        <div class="introduce">
            <div class="wrap">
                <h2>少些担心 多份安心</h2>
                <sub>安全可靠；贴心服务，打车不排队，雨天不着急</sub>
            </div>
            <ul class="introduce-list clearfix">
                <li class="fl">
                    <img src="{{ static_url('images/introduce1.png') }}" alt="正规运营">
                    <h3>正规运营</h3>
                    <p>三证齐全、平台合法<br/>车辆合规、司机合格</p>
                </li>
                <li class="fl">
                    <img src="{{ static_url('images/introduce2.png') }}" alt="专职司机">
                    <h3>专职司机</h3>
                    <p>全职司机、持证上岗<br/>专线驾驶、3年以上驾龄</p>
                </li>
                <li class="fl">
                    <img src="{{ static_url('images/introduce3.png') }}" alt="品质服务">
                    <h3>品质服务</h3>
                    <p>百万座位险、30分钟发车<br/>24小时服务、门对门接送</p>
                </li>
                <li class="fl">
                    <img src="{{ static_url('images/introduce4.png') }}" alt="安全出行">
                    <h3>安全出行</h3>
                    <p>虚拟号码、标注车辆<br/>实时监控、一键救援</p>
                </li>
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
<script src="{{ static_url('js/third-part/jquery.bxslider.min.js') }}"></script>
<script src="{{ static_url('js/utils.js') }}"></script>
<script type="text/javascript">
  $(function(){
    var bxSlider = $('.bxslider').bxSlider({
      controls: false,
      auto: true,
      pause: 4000,
      onSlideAfter: function() {
        bxSlider.startAuto()
      }
    });
    overflowHidden($('.news-block li >p a'), 114)
    $('.news-summary >p').each(function () {
      overflowHidden($(this),38)
    })
  });
</script>
</html>