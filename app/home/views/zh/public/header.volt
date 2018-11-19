<header class="common-header">
    <div class="wrap clearfix">
        <!--a标签跳转官网-->
        <h1 class="logo fl"><a href="{{ config.system.siteurl }}" title="帮邦行网约出行"></a></h1>
        <nav class="fr">
            <ul class="fl nav-list">
            	{% for categoryInfo in model.getModel('Category').categoryGroup(0,1) %}
                <li {% if (topCategory is not defined and loop.index==1) or (topCategory is defined and topCategory['id']==categoryInfo['id']) %}class="current-page"{% endif %}><a href="{{ categoryInfo['url'] }}" title="{{ categoryInfo['name'] }}">{{ categoryInfo['name'] }}</a></li>
                {% endfor%}
            </ul>
            <div class="qr-code fl">
                <ul class="qr-code-list clearfix hide">
                    <li class="fl">
                    	{{ model.getModel('Fragment').getOneBySign('xcxqrcode').content  }}
                        <p>扫描二维码使用<br/>帮邦行小程序</p>
                    </li>
                    <li class="fl">
                    	{{ model.getModel('Fragment').getOneBySign('wxqrcode').content  }}
                        <p>扫描二维码关注<br/>帮邦行公众号</p>
                    </li>
                    <li class="fl">
                    {{ model.getModel('Fragment').getOneBySign('appqrcode').content  }}
                        <p>扫描二维码下载<br/>帮邦行APP</p>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>