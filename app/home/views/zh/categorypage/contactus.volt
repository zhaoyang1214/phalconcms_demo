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
    <link rel="stylesheet" href="{{ static_url('css/aboutUs.css') }}">
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=rssoUTP7ydqWlW5lbAsyzIa6"></script>
</head>

<body>
    <div class="about">
        {% include "category/aboutusheader.volt" %}

        <div class="map-wrap">
            <div class="main-wrap">
                <div class="company-info">
                {{ content }}
                </div>
                <div id="allmap"></div>
            </div>
        </div>


        <!--公共尾部 S-->
        {% include "public/footer.volt" %}
    </div>
    <script type="text/javascript">
        var map = new BMap.Map("allmap");  
        var point = new BMap.Point(118.186975, 24.492213)
        map.centerAndZoom(point, 18);  
        map.addControl(new BMap.MapTypeControl({
            mapTypes: [
                BMAP_NORMAL_MAP,
                BMAP_HYBRID_MAP
            ]
        }));
        var marker = new BMap.Marker(point)
        map.addOverlay(marker)
        map.setCurrentCity("北京");
        map.enableScrollWheelZoom(true);
    </script>
</body>

</html>