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
    <link rel="stylesheet" href="{{ static_url('css/joinIn.css') }}">
    <link rel="stylesheet" href="{{ static_url('css/third-part/jquery.bxslider.css') }}">
</head>

<body>
    <div class="join-in">
        {% include "public/header.volt" %}
        <div class="banner-box">
            <img src="{{ model.getModel('FormData').getAllByTableName('jmrz_banner', ['limit':1])[0].image }}" />
        </div>
        <!-- 客运 -->
        <div class="transport main-wrap  clearfix">
            <h2>立足客运 赋能企业</h2>
            <div class="transport-show clearfix">
                <div class="introduce transport_left fl">
                    <div class="sub-introduce">
                        <p class="introduce-title">技术</p>
                        <p>500人年+研发投入，集成一线运营经营</p>
                    </div>
                    <div class="sub-introduce">
                        <p class="introduce-title">运营</p>
                        <p>融合客运运力</p>
                    </div>
                    <div class="sub-introduce">
                        <p class="introduce-title">数据</p>
                        <p>海量结构化，数据驱动</p>
                    </div>
                </div>
                <div class="transport_middle fl">
                    <div>客运企业</div>
                </div>
                <div class="introduce transport_right fl">
                    <div class="sub-introduce">
                        <p class="introduce-title">牌照</p>
                        <p>合规经营，安全无忧</p>
                    </div>
                    <div class="sub-introduce">
                        <p class="introduce-title">网络</p>
                        <p>可达性更丰富，综合运营成本</p>
                    </div>
                    <div class="sub-introduce">
                        <p class="introduce-title">金融保险</p>
                        <p>节省供给成本，提高平台收入</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- 助力市场 -->
        <div class="market clearfix">
            <div class="market-content main-wrap">
                <h2>助力转型千亿级的蓝海市场</h2>
                <div class="market-exhibition">
                    <div class="exhibition">
                        <div class="desc">客运企业</div>
                    </div>
                    <div class="exhibition">
                        <div class="desc">传统出行服务专家</div>
                    </div>
                    <div class="exhibition">
                        <div class="desc">网络出行服务平台</div>
                    </div>
                </div>
                <div class="market-desc">
                    <p>联合运营：基于现有的运力和线路，实现互联网运营环境，减少客运企业的投入。</p>
                    <p>嵌入式服务提供商：结合技术与互联网运营经营，快速实现转化效益</p>
                    <p>品牌化运营：基于客运企业的安全管理经验，打造安全出行的品牌</p>
                    <p>市场统一与融合：利用合规性平台和多种增值服务解决方案，全面融合非规市场</p>
                </div>
            </div>
        </div>
        <!-- 打造平台 -->
        <div class="platform">
            <div class="main-wrap">
                <h2>打造便民、高效网约车出行服务平台</h2>
                <div class="platform-content">
                    <div>
                        <img src="{{ static_url('images/joinIn/platform1.png') }}" alt="">
                        <h3>客运升级</h3>
                        <p>依托客运企业，构建基于金融服务和互联网运营的定制客运新生态，实现传统客运业转型。</p>
                    </div>
                    <div>
                        <img src="{{ static_url('images/joinIn/platform1.png') }}" alt="">
                        <h3>城内出行</h3>
                        <p>专注于2～5线地区、县城、乡镇之间的用户出行，未用户提供门对门接送的出行服务。</p>
                    </div>
                    <div>
                        <img src="{{ static_url('images/joinIn/platform1.png') }}" alt="">
                        <h3>车辆和规划</h3>
                        <p>整合分散车辆，按法定合规标准，实现三证合一；为用户提供安全的出行服务。</p>
                    </div>
                    <div>
                        <img src="{{ static_url('images/joinIn/platform1.png') }}" alt="">
                        <h3>安置退伍军人</h3>
                        <p>响应政府号召，讲优异的退伍军人融入帮邦行的服务体系，实现退伍军人的自身价值。</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- 优势 -->
        <div class="advantage main-wrap">
            <h2>选择帮邦行的8大优势</h2>
            <div>
                <div class="advantage-item">
                    <img src="{{ static_url('images/joinIn/advantage1.png') }}" alt="">
                    <h3>分公司支持</h3>
                    <p>协助合伙人在其代理城市开办分公司，并获得当地运营商牌照</p>
                </div>
                <div class="advantage-item">
                    <img src="{{ static_url('images/joinIn/advantage2.png') }}" alt="">
                    <h3>品牌支持</h3>
                    <p>共享品牌价值，提供帮邦行当地合法的网约车经营权 </p>
                </div>
                <div class="advantage-item">
                    <img src="{{ static_url('images/joinIn/advantage3.png') }}" alt="">
                    <h3>培训支持</h3>
                    <p>提供公司管理、证件办理及公共关系等专业的业务指导和支持</p>
                </div>
                <div class="advantage-item">
                    <img src="{{ static_url('images/joinIn/advantage4.png') }}" alt="">
                    <h3>市场支持</h3>
                    <p>提供物料设计、线上广告投放、媒体报道等统一市场支持。</p>
                </div>
            </div>
            <div style="margin-top:48px;">
                <div class="advantage-item">
                    <img src="{{ static_url('images/joinIn/advantage5.png') }}" alt="">
                    <h3>服务支持</h3>
                    <p>提供运营方案，推行保姆式服务，帮助合作伙伴实现快速盈利。</p>
                </div>
                <div class="advantage-item">
                    <img src="{{ static_url('images/joinIn/advantage6.png') }}" alt="">
                    <h3>平台支持</h3>
                    <p>提供代理商专属后台，帮助代理商对运帮助代理商对运营进行监控和管理。</p>
                </div>
                <div class="advantage-item">
                    <img src="{{ static_url('images/joinIn/advantage7.png') }}" alt="">
                    <h3>技术支持</h3>
                    <p>对运营需求的新功能进行快速开发和更新。</p>
                </div>
                <div class="advantage-item">
                    <img src="{{ static_url('images/joinIn/advantage8.png') }}" alt="">
                    <h3>运营支持</h3>
                    <p>呼叫中心、微信、APP后台的数据运营支持和前段服务。</p>
                </div>
            </div>
        </div>

        <!-- 加入我们 -->
        <div class="contact">
            <div class="main-wrap">
                <h2>加入我们</h2>
                {% set joinUs = model.getModel('FormData').getAllByTableName('join_us').toArray() %}
                <div class="bxslider">
                	{% set joinUsCount = count(joinUs) %}
                	<?php for($i=0; $i<$joinUsCount;) : ?>
                    <div class="slider-content">
                    	<?php for($j=0; $j<8 && $i<$joinUsCount; $i++,$j++) : ?>
                    	<div class="slider-card">
                            <h3><span>{{ mb_substr(joinUs[i]['title'],0,1) }}</span>{{ mb_substr(joinUs[i]['title'],1) }}</h3>
                            <p>联系人:{{ joinUs[i]['name'] }}</p>
                            <p>联系电话：{{ joinUs[i]['phone'] }}</p>
                        </div>
                    	<?php endfor; ?>
                    </div>
                    <?php endfor; ?>
                </div>
                
            </div>

        </div>


        <!--公共尾部 S-->
        {% include "public/footer.volt" %}
        <!--公共尾部 E-->
    </div>

    <script src="{{ static_url('js/third-part/jquery-1.12.4.min.js') }}"></script>
    <script src="{{ static_url('js/third-part/jquery.bxslider.min.js') }}"></script>
    <script>
        $(function() {
            var bxSlider = $('.bxslider').bxSlider({
                infiniteLoop: false,
                hideControlOnEnd: true,
            });
        });
    </script>
</body>

</html>