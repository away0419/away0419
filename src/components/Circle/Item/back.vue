<template>
  <div class="wrapper">
    <div
      v-for="item in skill"
      :key="item.no"
      :class="`elem circle-item${item.no}`"
      :style="{
        'background-image': `url(${require('@/assets/images/' + item.url)})`,
      }"
    ></div>
  </div>
</template>
v-for="item in main.career" :key="item.no" :item="item" :link="'careerDetail'"
<script>
export default {
  props: {
    skill: {
      type: Array,
      default: undefined,
    },
  },
};
</script>

<style lang="scss" scoped>
@import "../../../assets/scss/color";
$blocks: 6;

.wrapper {
  background: url("../../../assets/images/skill/back/backend.svg");
  background-size: 70px;
  background-position: center;
  background-repeat: no-repeat;
}

#circle-checkbox1 ~ .circle-label {
  @for $i from 0 through ($blocks - 1) {
    .elem:nth-child(#{$i + 1}) {
      background-position: center;
      background-repeat: no-repeat;
      z-index: #{$blocks - $i};
      transform: rotate(#{calc(360 / $blocks) * ($i + 1) - 90}deg)
        translateX(0)
        rotate(#{calc(-360 / $blocks) * ($i + 1) + 90}deg);
    }
  }
}
#circle-checkbox1:checked ~ .circle-label {
  .wrapper {
    background-size: 140px;
    padding: 2.5rem;
    border: 0.5rem solid $basic-color4;
  }
  .elem {
    opacity: 1;
  }

  @for $i from 0 through ($blocks - 1) {
    .elem:nth-child(#{$i + 1}) {
      border: 0.3rem solid $basic-color4;
      background-size: 70px;
      background-repeat: no-repeat;
      background-position: center;
      transform: rotate(#{calc(360 / $blocks) * $i - 90}deg)
        translateX(200%)
        rotate(#{calc(-360 / $blocks) * $i + 90}deg);
      transition-delay: #{$i * 0.01}s, #{$i * 0.04}s;
    }
  }
}
</style>
