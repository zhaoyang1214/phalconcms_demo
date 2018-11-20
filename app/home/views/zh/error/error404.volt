<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>404</title>
    <link rel="stylesheet" href="{{ static_url('css/reset.css') }}">
</head>
<style>
    .no-find {
        width: 100%;
        height: 550px;
        margin-top: 8%;
    }
    .no-find .no-img {
        display: block;
        margin: 0 auto;
    }
    .no-find h1 {
        margin: 49px 0 28px;
        text-align: center;
        font-size:30px;
        color:rgba(44,45,46,1);
        line-height: 37px;
    }
    .no-find h1 img {
        margin-right: 14px;
        vertical-align: -6px;
    }
    .no-find p {
        text-align: center;
        font-size:22px;
        color:rgba(186,187,194,1);
    }
    .no-find .back-home {
        width: 212px;
        height: 57px;
        margin: 45px auto 0;
        background: #4287FF;
        border-radius:5px;
        font-size:18px;
        line-height:57px;
        text-align: center;
    }
    .no-find .back-home a {
        display: block;
        width: 100%;
        height: 100%;
        color:rgba(255,255,255,1);
    }
</style>
<body>
    <div class="no-find">
        <img class="no-img" src="{{ static_url('images/404.png') }}" alt="404">
        <h1><img src="{{ static_url('images/tip.png') }}" alt="提示">抱歉，您访问的页面地址有误，或者该页面不存在</h1>
        <p>别担心，工程师正在拯救的路上</p>
        <div class="back-home"><a href="{{ url('index/index') }}" title="返回首页">返回首页</a></div>
    </div>
</body>
</html>