<!--公共头部 S-->
{% include "public/header.volt" %}
<!--公共头部 E-->

<!--banner-->
<div class="banner">
    <img class="banner-img" src="{{ model.getModel('FormData').getAllByTableName('news_banner', ['limit':1])[0].image }}" alt="banner">
</div>