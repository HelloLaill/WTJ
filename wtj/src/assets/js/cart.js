new Vue({
  el : "#cart",
  data : {
    product:{},
    pic:[]
  },
  methods:{
    selectProduct(_isSelect){
      //遍历product，全部取反
      for(vari=0,len=this.product.length;i<len;i++) {
        this.product[i].isSelect = !_isSelect;
      }
    },
    deletePro(index){
      if(confirm(`是否要继续删除${this.product[index].pname}?`)==true){
        //删除当前行
        this.product.splice(index,1);
      }	
    },
    //删除已经选中(isSelect=true)的产品
    deleteProduct() {
      // if(confirm(`是否删除当前选中的商品`)==true){
      //   this.product=this.product.filter(function(item){return !item.isSelect})
      // }
    },
  },
  computed:{
    //检测是否全选
    // isSelectAll(){
    //   //如果product中每一条数据的isSelect都为true，返回true，否则返回false;
    //   return this.product.every(function(val){
    //     return val.isSelect
    //   });
    // },
    isSelectAll(){},
    getTotal(){
      // var prolist=this.product.filter(function (val) { return val.isSelect}),
      // totalPri=0;
      // for(var i=0,len=prolist.length;i<len;i++) {
      //   totalPri+=prolist[i].proPrice*prolist[i].proNum;
      // }
      // return {totalNum:prolist.length,totalPrice:totalPri}
    },
  },
  mounted() {
      var _this=this;
      //为product添加select（是否选中）字段，初始值为true
      this.product.map(function (item) {
          _this.$set(item, 'isSelect', true);
      })
    },
    created(){
      axios.get(
        "http://localhost:3000/cart",
        {
          params:{
            //uid:location.search.split("=")[1]
            uid:1
          }
        }
      ).then(result=>{
        console.log(result);
        this.product=result.data.product;
        this.pic=result.data.pics;
      })
    },
    watch:{
      product(){
        console.log(this.product)
      },
      pic(){
        console.log(this.pic)
      }
    }
})