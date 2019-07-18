<template>
  <div id="demo" class="carousel" :style="{width:innerWidth+'px'}" @mouseenter="stop" @mouseleave="start">
      <!--1.轮播图片-->
    <div class="carousel-inner" :class="ulClass" :style="ulStyle">
      <div v-for="(img,i) of imgs" :key="i" class="carousel-item" :style="{width:innerWidth+'px'}">
        <router-link to="javascript:;">
          <img :src="'http://127.0.0.1:3000/'+imgs[i]" style="width:620px;"/>
        </router-link>
      </div>
      <div class="carousel-item" :style="{width:innerWidth+'px'}">
        <router-link to="javascript:;" >
          <img :src="'http://127.0.0.1:3000/'+imgs[0]" style="width:620px;"/>
        </router-link>
      </div>
    </div>
    <!--2.左右箭头-->
    <div href="javascript:;" @click="move(1)" class="carousel-control-next">
        <span class="jiantou">&gt;</span>
    </div>
    <div href="javascript:;" @click="move(-1)" class="carousel-control-prev">
        <span class="jiantou">&lt;</span>
    </div>
    <!--3.轮播指示符-->
    <ul class="carousel-indicators">
        <li v-for="(img,idx) of imgs" :key="idx" :class="idx==i?'active':''" @click="moveTo(idx)"></li>
    </ul>
  </div>
</template>
<script>
export default {
  name:"Carousel",
  data(){
    return {
      innerWidth:window.innerWidth,
      ulClass:{ hasTrans:true },
      i:0,
      props:{
        id:["id"]
      },
      imgs:[
      ],
      canClick:true,
      timer:null
    }
  },
  created(){
    window.addEventListener("resize",()=>{
      this.innerWidth=window.innerWidth;
    })
    this.start();
    this.loadMore(this.$route.params.id);
  },
  methods:{
    loadMore(id){
    var url="product";
    var obj={id};
      	this.axios.get(url,{params:obj}).then(result=>{
          var img1=result.data.data[0].lg;
          var img2=result.data.data[0].lg_1;
          
          this.imgs=[img1,img2]
          console.log(this.imgs)
      })
	  },
    stop(){
      clearInterval(this.timer);
    },
    start(){
      this.timer=setInterval(()=>{
        this.move(1);
      },3000)
    },
    move(i){
      if(this.canClick){
        this.canClick=false;
        if(i==-1&&this.i==0){
          this.ulClass.hasTrans=false;
          setTimeout(()=>{
            this.i=this.imgs.length;
            setTimeout(()=>{
              this.ulClass.hasTrans=true;
              this.i+=i;
              setTimeout(()=>{
                this.canClick=true;
              },200)
            },50)
          },50)
        }else if(i==1&&this.i==this.imgs.length-1){
          this.i+=i;
          setTimeout(()=>{
            this.ulClass.hasTrans=false;
            setTimeout(()=>{
              this.i=0;
              setTimeout(()=>{
                this.ulClass.hasTrans=true;
                setTimeout(()=>{
                  this.canClick=true;
                })
              },50)
            },50)
          },200)
        }else{
          this.i+=i;
          setTimeout(()=>{
            this.canClick=true;
          },300)
        }
      }
    },
    moveTo(i){
      if(this.canClick){
        this.i=i;
        this.canClick=false;
        setTimeout(()=>{
          this.canClick=true;
        },300)
      }
    }
  },
  computed:{
    ulStyle(){
      var width=this.innerWidth*(this.imgs.length+1)+"px";
      var marginLeft=-this.i*this.innerWidth+"px";  
      return { width, marginLeft }
    }
  }
}
</script>
<style scoped>

  .carousel{
    overflow:hidden;
    position: relative;
  }
  .carousel:after{
    content:"";
    display:block;
    clear:both;
  }
   .carousel>.carousel-inner.hasTrans{
     transition:all .2s linear;
   }
  .carousel>.carousel-inner>.carousel-item{
    display:block;
    float:left;
  }
 
  /*左右箭头的样式*/
  .carousel-control-prev,
  .carousel-control-next{
    width:40px;height:100px;
    top:40%;
    position: absolute;
    border-radius: 5px;
  }
  .carousel-control-prev{left:40px;}
  .carousel-control-next{right:40px;}
  .jiantou{
    color:rgba(0,0,0,0.5);
    font-size: 60px;
    line-height:100px;
  }
  .carousel-control-prev:hover,
  .carousel-control-next:hover{
    background:rgba(0,0,0,0.2);
  }
  /*重写指示符的样式*/
  .carousel-indicators{
    position: absolute;
    list-style: none;
    padding:0;
    left:46%;
    bottom:20px;
  }
  .carousel-indicators li{
    float: left;
    width:15px;height:15px;
    background-color:rgba(0,0,0,0.5);
    margin-left:6px;
    margin-right:6px;
    border-radius: 50%;
    top:60px;
  }
  .carousel-indicators>li:hover, .carousel-indicators>li.active{
    transform:scale(1.3)
  }
</style>


