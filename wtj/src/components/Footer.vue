<template>
  <div id="footer">
    <div class="bg-ys-1">
<div class="bg-ys">
<div class="div-width">
    <ul class="list-unstyled-1 ul-li">
        <li>
            <a href="" class="d-flex-d">
                <div class="bg-g-1"></div>
                <div>
                    <h4>大厂直供</h4>
                    <span>出厂价格出口品质</span>
                </div>
            </a>
        </li>
        <li>
            <a href="" class="d-flex-d">
                <div class="bg-g-2"></div>
                <div>
                    <h4>家具灵感</h4>
                    <span>海量家具美图发现美的家</span>
                </div>
            </a>
        </li>
        <li>
            <a href="" class="d-flex-d">
                <div class="bg-g-3"></div>
                <div>
                    <h4>私人搭配师</h4>
                    <span>资深设计师免费帮你搭</span>
                </div>
            </a>
        </li>
    </ul>
</div>

<div class="h-x"></div>



    <div class="div-u d-flex_d ">
        <div>
            <img src="../assets/img/logo.png" alt=""/>
            <p>粤ICP备15037979号-1</p>
            <p>©2015~2018 wutuojia.com 广州乌托家信息科技有限公司</p>
        </div>

        <div>
            <ul class="db-ul d-flex-q">
                <li>
                    <ul class="list-unstyled-qq">
                        <li><h5>关于我们</h5></li>
                        <li><p>关于乌托家</p></li>
                        <li><p>战略合作</p></li>
                        <li><p>社会招聘</p></li>
                    </ul>
                </li>
                <li>
                    <ul class="list-unstyled-qq">
                        <li><h5>帮助中心</h5></li>
                        <li><p>用户指南</p></li>
                        <li><p>常见问题</p></li>
                        <li><p>意见反馈</p></li>
                    </ul>
                </li>
                <li>
                    <ul class="list-unstyled-qq">
                        <li><h5>配送安装</h5></li>
                        <li><p>配送服务</p></li>
                        <li><p>安装服务</p></li>
                        <li><p>收货指南</p></li>
                        <li><p>配送政策</p></li>
                    </ul>
                </li>
                <li>
                    <ul class="list-unstyled-qq">
                        <li><h5>售后保障</h5></li>
                        <li><p>退货政策</p></li>
                        <li><p>退货流程</p></li>
                        <li><p>联系我们</p></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div>
            <div>
                <img src="../assets/img/qrcode.png" alt=""/>
            </div>
            <span>关注微信二维码</span>
        </div>
    </div>


    <div class="h-x"></div>


    <div class="d-flex-d db-lj ">
        <div><a href="">友情链接:</a></div>
        <div>
            <a href="">家居</a>
            <a href="">家居百科</a>
            <a href="">家居资讯</a>
            <a href="">家居文库</a>
            <a href="">家居品牌</a>
            <a href="">家居图片</a>
            <a href="">家具搭配</a>
            <a href="">精品家具</a>
            <a href="">软装配饰</a>
            <a href="">一美居网</a>
            <a href="">软装设计公司</a>
            <a href="">依旧东方情</a>
            <a href="">福建装修网</a>
            <a href="">家具o2o</a>
            <a href="">家具厂</a>
            <a href="">乌托家手机版</a>
        </div>
        <div>
            <div class="j-jh"></div>
        </div>
    </div>
</div>

</div>
  </div>

</template>
<script>
export default {
  name:"Footer"
}
</script>
<style scoped>
#footer{margin-top:30px;}
.bg-ys-1{
    background:#f0f0f0;
}
.bg-ys{
    width: 90%;
    margin:0 auto;
}
.bg-g-1{
    background:url("../assets/img/b_ic.png") no-repeat 0 0;
    width: 58px;
    height:36px;
    margin-right:30px;
    margin-top:10px;
}

.bg-g-2{
    background:url("../assets/img/b_ic.png") no-repeat 0 0;
    width:49px;
    height:49px;
    background-position: -63px 0;
    margin-right:30px;


}
.bg-g-3{
    background:url("../assets/img/b_ic.png") no-repeat 0 0;
    width:49px;
    height:49px;
    background-position: -120px 0;
    margin-right:30px;


}

.div-width{
    padding-top:60px;
    height:160px;
    background:#f0f0f0;
}
a{
    color:black;
}
a:hover{
    text-decoration:none;
    color: black;
}
.h-x{
    border-bottom:1px solid gainsboro;
}
a div span{
    font-size:16px;
    color: gray;
}
.div-u{
    margin-top:30px;


}
.div-u div p{
    font-size:12px;
    color: gray;
}
.div-u div p:last-child{
    margin-bottom:0;
}
.div-u div p:nth-child(2){
    margin-bottom:0;
    margin-top:50px;
}
.db-ul li{
    margin:0 20px;
}
.db-ul li ul li p{
    margin-top:5px;
    font-size:12px;
}
.db-lj{
    padding-bottom:10px;
}
.db-lj a{
    font-size:12px;
    color: gray;
    margin-right:12px;
    text-decoration:none;
}
.db-lj a:hover{
    text-decoration:none;
}
.j-jh{
    background:url("../assets/img/commodityicon.png") no-repeat;
    width:17px;
    height:22px;
    background-position:-45px 4px;
}
.list-unstyled-1 {
    padding-left: 0;
    list-style: none;
    display: flex;
    justify-content: space-between;
}
.d-flex-d{
    display: flex;
    text-decoration:none;
}
.d-flex-d div h4{
    margin-top:0;
    margin-bottom:5px;
}
.d-flex_d{
    display: flex;
    justify-content: space-between;
}
.d-flex-q{
    display: flex;
    padding-left: 0;
    list-style: none;

}
.list-unstyled-qq{
    padding-left: 0;
    list-style: none;
}
.list-unstyled-qq li h5{
    font-size:16px;
}
</style>
