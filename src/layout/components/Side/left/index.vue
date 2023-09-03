<template>
  <aside class="common-side">
    <router-link to="/" class="logo">
      <img src="../../../../assets/images/LJK-logo.png" />
    </router-link>
    <p class="hi">
      Hello World :) 👋
    </p>
  </aside>
</template>

<script>
export default {
  name: "index"
};
</script>

<style lang="scss" scoped>
.common-side {
  left: 0;
  top: 0px;
  z-index: 12;
  width: 150px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
  position: fixed;

  .logo {
    position: relative;
    width: 150px;
    height: 150px;
    cursor: pointer;

    img {
      width: 100%;
    }
  }

  .hi {
    position: absolute;
    left: 63px;
    top: 145px;
    width: 220px;
    color: #191919;
    font-size: 17px;
    opacity: 1;
    -webkit-transform: rotate(90deg);
    transform: rotate(90deg);
    -webkit-transform-origin: left center;
    transform-origin: left center;
    font-family: "Russo", cursive;
    transition: opacity 300ms;
  }
}

@media (max-width: 890px) {
  .common-side {

    .hi {
      opacity: 0;
      display: none;
      transition: opacity 300ms;
    }
  }
}
</style>
