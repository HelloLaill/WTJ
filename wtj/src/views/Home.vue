<template>
  <div class="home">
    <Header></Header>

    <Footer></Footer>
  </div>
</template>

<script>
// @ is an alias to /src
import Header from "@/components/Header.vue"
import Footer from "@/components/Footer.vue"
export default {
  name:"productList",
  components: {
    Header,
    Footer
  },
}
</script>
