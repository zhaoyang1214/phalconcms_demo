{% include "public/header.volt" %}

<img class="banner-img" style="width:100%" src="{{ model.getModel('FormData').getAllByTableName('about_banner', ['limit':1])[0].image }}" alt="">

<div class="menu">
    <div class="menu-list main-wrap">
    	{% for info in model.getModel('Category').categoryGroup(topCategory['id'], 1) %}
        <a href="{{ info['url'] }}" class="menu-item {% if info['id']==parentCategory.id %}active-menu{% endif %}">{{ info['name'] }}</a>
        {% endfor %}
    </div>
</div>