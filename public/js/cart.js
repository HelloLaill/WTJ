new Vue({
  el : "#cart",
  data : {
    productList:[
      {
        'proName' :'123456',
        'proStyle':'1800L*800W*880Hmm',
        'proPrice' :4000,
        'proNum' : 1
        
      },
      {
        'proName' :'dhajkdhkasdjk',
        'proStyle':'lans',
        'proPrice' :2000,
        'proNum' : 2
      },
      {
        'proName' :'斯品北欧宜家绦棉面料深蓝色布艺沙发',
        'proStyle':'三人位：1800L*800W*880Hmm',
        'proPrice' :5000,
        'proNum' : 1
      }
    ],
  },
  methods:{
    selectProduct(_isSelect){
      //遍历productList，全部取反
      for(vari=0,len=this.productList.length;i<len;i++) {
        this.productList[i].isSelect = !_isSelect;
      }
    },
    deletePro(index){
      if(confirm(`是否要继续删除${this.productList[index].proName}?`)==true){
        //删除当前行
        this.productList.splice(index,1);
      }	
    },
    //删除已经选中(isSelect=true)的产品
    deleteProduct() {
      if(confirm(`是否删除当前选中的商品`)==true){
        this.productList=this.productList.filter(function(item){return !item.isSelect})
      }
    },
  },
  computed:{
    //检测是否全选
    isSelectAll(){
      //如果productList中每一条数据的isSelect都为true，返回true，否则返回false;
      return this.productList.every(function(val){
        return val.isSelect
      });
    },
    getTotal(){
      var prolist=this.productList.filter(function (val) { return val.isSelect}),
      totalPri=0;
      for(var i=0,len=prolist.length;i<len;i++) {
        totalPri+=prolist[i].proPrice*prolist[i].proNum;
      }
      return {totalNum:prolist.length,totalPrice:totalPri}
    },
  },
  mounted () {
      var _this=this;
      //为productList添加select（是否选中）字段，初始值为true
      this.productList.map(function (item) {
          _this.$set(item, 'isSelect', true);
      })
    }
})