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
    <link rel="stylesheet" href="{{ static_url('css/officialTravel.css') }}">
</head>
<body>
<div class="official-travel">
    <!--公共头部 S-->
    {% include "public/header.volt" %}
    <!--公共头部 E-->

    <!--banner-->
    <div class="banner">
        <img class="banner-img" src="{{ model.getModel('FormData').getAllByTableName('gwcx_banner', ['limit':1])[0].image }}" alt="banner">
        <div class="wrap">
            <div class="qr-wrap">
                {{ str_replace(['<p>','</p>'], '', model.getModel('Fragment').getOneBySign('gwc_qrcode').content)  }}
                <p>扫码立即体验</p>
            </div>
        </div>
    </div>

    <div class="info1">
        <h2 class="main-tit">第一个线上运营的公务用车平台</h2>
        <sub class="sub-tit">智能化工具，保障公务出行</sub>
        <p>本平台针对中央及各级地方政府对公车改革的具体要求，围绕“互联网+公务出行服务平台”与“大数据+融合调度”两大特色目标设计，并契合了当前公务车改革趋势——车辆进行集中管理、统一智能调度，而打造的一套软硬件结合的公务车服务系统。 实施时将着重满足和实现服务安全、数据安全、交互友好、横向易扩展、异构数据可融合、数据定向共享（给相关上级部门），以及7*24小时服务在线/可用。立志打造成中国互联网+公务车服务示范平台。</p>
        <img src="{{ static_url('images/officialTravel/pc.png') }}" alt="装饰图">
    </div>

    <div class="info2">
        <div class="wrap clearfix">
            <h2 class="main-tit">为公务出行简化流程，提高效率</h2>
            <sub class="sub-tit">省去繁琐流程，告别人工管控，通过电脑添加用车规则、管理用车</sub>
            <ul class="fr">
                <li class="fr">
                    <img src="{{ static_url('images/officialTravel/info2-2.png') }}" alt="数据抽检">
                    <h3>数据抽检</h3>
                    <p>所有订单具备详情记录便于检查机关审查</p>
                </li>
                <li class="fr">
                    <img src="{{ static_url('images/officialTravel/info2-1.png') }}" alt="审核出行">
                    <h3>审核出行</h3>
                    <p>审核用车事由,审核用车费用通过与驳回</p>
                </li>
                <li class="fr">
                    <img src="{{ static_url('images/officialTravel/info2-3.png') }}" alt="数据分析">
                    <h3>数据分析</h3>
                    <p>分析出行频率、出行费用优化出行方案</p>
                </li>
                <li class="fr">
                    <img src="{{ static_url('images/officialTravel/info2-4.png') }}" alt="机构月结">
                    <h3>机构月结</h3>
                    <p>订单核算确认无误后由机构统一月结</p>
                </li>
            </ul>
            <img src="{{ static_url('images/officialTravel/data.png') }}" alt="数据" class="data">
        </div>
    </div>

    <div class="info3">
        <div class="wrap clearfix">
            <h2 class="main-tit">合规透明，节省公务开支</h2>
            <sub class="sub-tit">行程可查，成本可控，确保员工出行符合规定</sub>
            <ul class="fl">
                <li class="fl">
                    <img src="{{ static_url('images/officialTravel/info3-1.png') }}" alt="总量管控">
                    <h3>总量管控</h3>
                    <p>严格根据公务用车费用控制指标</p>
                </li>
                <li class="fl">
                    <img src="{{ static_url('images/officialTravel/info3-2.png') }}" alt="AA出行">
                    <h3>AA出行</h3>
                    <p>支持多部门合乘AA分摊结算</p>
                </li>
                <li class="fl">
                    <img src="{{ static_url('images/officialTravel/info3-3.png') }}" alt="订单管理">
                    <h3>订单管理</h3>
                    <p>通过后台查看订单确保员工出行符合规定</p>
                </li>
            </ul>
            <img src="{{ static_url('images/officialTravel/data2.png') }}" alt="数据" class="data">
        </div>
    </div>

    <div class="info4">
        <div class="bg"></div>
        <div class="con">
            <h2 class="main-tit">电脑、手机，随时轻松管理</h2>
            <div class="item">
                <p class="sub-tit">管理者在哪里操作？</p>
                <ul class="clearfix">
                    <li class="fl">
                        <img src="{{ static_url('images/officialTravel/info4-1.png') }}" alt="电脑">
                        <span>电脑</span>
                        <p>登录帮邦行公务车系统，可全面实现用车管理功能，查询订单详情，行车轨迹，分析数据，用车费用等。</p>
                    </li>
                    <li class="fl">
                        <img src="{{ static_url('images/officialTravel/info4-2.png') }}" alt="帮邦行公务车APP">
                        <span>帮邦行公务车APP</span>
                        <p>下载公务车App，可实现基本管理功能，如快速审核订单、查看订单，车辆状态等。</p>
                    </li>
                </ul>
            </div>
            <div class="item">
                <p class="sub-tit">公务员在哪里叫车？</p>
                <ul class="clearfix">
                    <li class="fl">
                        <img src="{{ static_url('images/officialTravel/info4-2.png') }}" alt="帮邦行公务车APP">
                        <span>帮邦行公务车APP</span>
                        <p>下载帮邦行公务车App，在线随时随地约车</p>
                    </li>
                </ul>
            </div>
            <div class="down">
                <img src="{{ static_url('images/officialTravel/info4-3.png') }}" alt="下载app">
                <span><a href="{{ model.getModel('Fragment').getOneBySign('gwcx_kf_app_url').content|htmlspecialchars_decode|striptags  }}">下载客服端APP</a></span>
            </div>
        </div>
    </div>

    <div class="info5">
        <ul class="clearfix">
            <li class="fl">
                <h2 class="main-tit">平台无限融合</h2>
                <img src="{{ static_url('images/officialTravel/info5-1.png') }}" alt="平台无限融合">
                <p>支持各省独立集约运营<br/>支持三级行政区：省、市、区（县）独立运营<br/>支持跨地运力融合，提升运力利用率。</p>
            </li>
            <li class="fr">
                <h2 class="main-tit">政企资源互补</h2>
                <img src="{{ static_url('images/officialTravel/info5-2.png') }}" alt="平台无限融合">
                <p>公务用车不足时，由运营方自有车辆和社会车辆补给<br/>公务用车有余时，亦可支持自有车辆和社会车辆运营</p>
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
</html>