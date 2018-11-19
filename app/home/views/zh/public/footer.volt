<footer class="common-footer">
    <div class="top clearfix">
        <img class="logo fl" src="{{ static_url('images/logo.png') }}" alt="logo">
        <strong class="fl">全国统一服务热线：{{ config.system.telephone }}</strong>
    </div>
    <div class="mid clearfix">
        <div class="left fl">
            <h3>关于我们</h3>
            <ul class="clearfix">
                <li class="fl">
                    {{ model.getModel('Fragment').getOneBySign('wxqrcode').content  }}
                    <p>官方微信</p>
                </li>
                <li class="fl">
                    {{ model.getModel('Fragment').getOneBySign('official_microblog').content  }}
                    <p>官方微博</p>
                </li>
            </ul>
        </div>
        <div class="right fr">
            <div class="ul-block fl">
                <h3>关于我们</h3>
                <ul>
                	{% for categoryInfo in model.getModel('Category').getSons(25, 1) %}
                    <li><a href="{{ categoryInfo['url'] }}" title="{{ categoryInfo['name'] }}">{{ categoryInfo['name'] }}</a></li>
                    {% endfor %}
                </ul>
            </div>
            <div class="ul-block fl">
                <h3>新闻资讯</h3>
                <ul>
                	{% for categoryInfo in model.getModel('Category').getSons(21, 1) %}
                    <li><a href="{{ categoryInfo['url'] }}" title="{{ categoryInfo['name'] }}">{{ categoryInfo['name'] }}</a></li>
                    {% endfor %}
                </ul>
            </div>
            <ul class="other-link fl">
            	{% set categoryInfo = model.getModel('Category').getOne(19) %}
                <li><a href="{{ categoryInfo.url }}" title="{{ categoryInfo.name }}">{{ categoryInfo.name }}</a></li>
                {% set categoryInfo = model.getModel('Category').getOne(20) %}
                <li><a href="{{ categoryInfo.url }}" title="{{ categoryInfo.name }}">{{ categoryInfo.name }}</a></li>
                {% set categoryInfo = model.getModel('Category').getOne(2) %}
                <li><a href="{{ categoryInfo.url }}" title="{{ categoryInfo.name }}">{{ categoryInfo.name }}</a></li>
            </ul>
        </div>
    </div>
    <div class="bot">{{ config.system.copyright }}备案号{{ config.system.beian }}</div>
</footer>