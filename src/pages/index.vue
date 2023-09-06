<template>
  <div ref="main" class="main-page-wrap">
    <div class="main-side-right">
      <ul class="article-list">
        <li
          class="article-item"
          v-for="(item, index) in article"
          :key="`side-right-${index}`"
          :class="{ focus: item.focus }"
          :aria-label="item.name"
          @click="goArticle(item)"
        >
          <div :class="`cf side-right-${item.label}`"></div>
        </li>
      </ul>
    </div>
    <div class="container">
      <article
        class="main-article main-greeting"
        v-waypoint="{
          active: true,
          callback: mainWaypoint,
          options: intersectionOptions,
        }"
      >
        <vue-typed-js :strings="strings" :type-speed="30">
          <h1><span class="typing"></span></h1>
        </vue-typed-js>
        <div class="typed-element not-show">
          <h1 style="opacity: 0;" v-html="strings"></h1>
        </div>
        <article class="main-image">
          <img class="image" src="../assets/images/main-image.gif" />
          <div class="about-div">
            <span class="none-span">(</span><span class="fade-in-span">A</span
            ><span class="none-span">)</span
            ><span class="none-span">ssorted </span
            ><span class="none-span">(</span><span class="fade-in-span">B</span
            ><span class="none-span">)</span
            ><span class="none-span">its </span> <span class="none-span">(</span
            ><span class="fade-in-span">O</span><span class="none-span">)</span
            ><span class="none-span">f </span><span class="none-span">(</span
            ><span class="fade-in-span">U</span><span class="none-span">)</span
            ><span class="none-span">sher </span><span class="none-span">(</span
            ><span class="fade-in-span">T</span><span class="none-span">)</span
            ><span class="none-span">ransformation = </span>
            <span class="fade-out-span">?</span>
            <span class="fade-in-span-me">ME</span>

            <div class="about-content">
              <p class="fade-in-p">"다양한 조각이 모여 혁신을 이끈다."</p>
              <p class="fade-in-p">
                괄호 하나 하나를 모으면 제가 됩니다.<br />
                공백 기간 동안 새로운 조각, 즉 다양한 경험을 쌓을 수
                있었습니다.<br />
                인생의 경험을 통해 혁신적인 기술과 서비스를 이끌어 가는 저를
                소개하겠습니다!<br />
              </p>
              <p class="about-email fade-in-p">away0419@naver.com</p>
              <p class="about-tel fade-in-p">010-3155-0419</p>
            </div>
          </div>
        </article>
      </article>
      <article
        ref="introduction"
        class="main-article border-bottom"
        v-waypoint="{
          active: true,
          callback: introductionWaypoint,
          options: intersectionOptions,
        }"
      >
        <transition
          name="fade"
          enter-active-class="fadeInUp"
          leave-active-class="fadeOutDown"
        >
          <Article title="i am" v-show="article.introduction.visible">
            <p class="pb-20" v-html="main.introduction"></p>
            <a class="a-resume" href="/file/LeeJunKyung-resume.pdf" download>
              이력서 다운로드
            </a>
          </Article>
        </transition>
      </article>
      <article
        ref="career"
        class="main-article border-bottom"
        v-waypoint="{
          active: true,
          callback: careerWaypoint,
          options: intersectionOptions,
        }"
      >
        <transition
          name="fade"
          enter-active-class="fadeInUp"
          leave-active-class="fadeOutDown"
        >
          <div v-show="article.career.visible">
            <h2 class="article-title">
              Career & Learning
            </h2>
            <CardList>
              <CardItem
                v-for="item in main.career"
                :key="item.no"
                :item="item"
                :link="'careerDetail'"
              ></CardItem>
            </CardList>
          </div>
        </transition>
      </article>
      <article
        ref="skills"
        class="main-article circle-article"
        v-waypoint="{
          active: true,
          callback: skillWaypoint,
          options: intersectionOptions,
        }"
      >
        <transition
          name="fade"
          enter-active-class="fadeInUp"
          leave-active-class="fadeOutDown"
        >
          <Article
            title="Skills"
            v-show="article.skill.visible"
            class="circle-list"
          >
            <div class="circle-item">
              <input
                type="radio"
                name="circle-checkbox"
                id="circle-checkbox1"
                v-model="circleValue"
                value="1"
                @click="circleClick"
              />
              <label for="circle-checkbox1" class="circle-label">
                <CircleBackList :skill="main.skill.back"></CircleBackList>
              </label>
            </div>
            <div class="circle-item">
              <input
                type="radio"
                name="circle-checkbox"
                id="circle-checkbox2"
                v-model="circleValue"
                value="2"
                @click="circleClick"
              />
              <label for="circle-checkbox2" class="circle-label">
                <CircleFrontList :skill="main.skill.front"></CircleFrontList>
              </label>
            </div>
            <div class="circle-item">
              <input
                type="radio"
                name="circle-checkbox"
                id="circle-checkbox3"
                v-model="circleValue"
                value="3"
                @click="circleClick"
              />
              <label for="circle-checkbox3" class="circle-label">
                <CircleEtcList :skill="main.skill.etc"></CircleEtcList>
              </label>
            </div>
          </Article>
        </transition>
      </article>
    </div>
    <div class="main-portfolio">
      <article
        ref="portfolio"
        class="container"
        v-waypoint="{
          active: true,
          callback: portfolioWaypoint,
          options: intersectionOptions,
        }"
      >
        <transition
          name="fade"
          enter-active-class="fadeInUp"
          leave-active-class="fadeOutDown"
        >
          <div v-show="article.portfolio.visible">
            <h2 class="article-title">
              <router-link to="/portfolio">
                PORTFOLIO
                <span class="more"
                  ><img
                    src="../assets/images/control/arrow-small-next.png"
                    alt="더보기"
                /></span>
              </router-link>
            </h2>
            <CardList>
              <CardItem
                v-for="item in main.portfolio.slice(0, 6)"
                :key="item.no"
                :item="item"
                :link="'portfolioDetail'"
              ></CardItem>
            </CardList>
          </div>
        </transition>
      </article>
    </div>
    <div class="container">
      <article
        ref="faq"
        class="main-article border-bottom"
        v-waypoint="{
          active: true,
          callback: faqWaypoint,
          options: intersectionOptions,
        }"
      >
        <transition
          name="fade"
          enter-active-class="fadeInUp"
          leave-active-class="fadeOutDown"
        >
          <Article title="FAQ" v-show="article.faq.visible">
            <ToggleMessage :list="main.faq" />
          </Article>
        </transition>
      </article>
    </div>
    <div class="main-contact container">
      <article
        ref="contact"
        class="main-article main-contact"
        v-waypoint="{
          active: true,
          callback: contactWaypoint,
          options: intersectionOptions,
        }"
      >
        <transition
          name="fade"
          enter-active-class="fadeInUp"
          leave-active-class="fadeOutDown"
        >
          <div v-show="article.contact.visible">
            <div></div>
            <div class="contact-body">
              <router-link class="contact-image" to="/contact"></router-link>
              <div class="contact-introduction">
                <h5>
                  안녕하세요!<br />
                  다양한 목표를 가진 백엔드 개발자 이준경입니다.
                </h5>
                <p>
                  누구와도 잘 어울리는 밝은 성격,<br />
                  도전을 즐기고 새로운 경험을 추구하는 저에게<br />
                  관심이 생기신 분들은 아래 버튼을 눌러주세요 :)
                </p>
                <router-link to="/contact">
                  <s-button>
                    Want to work with me?
                  </s-button>
                </router-link>
              </div>
              <div class="contact-info">
                <ul>
                  <li>
                    <p class="tit">Where i live</p>
                    <p class="body">
                      Yeongdeungpo-gu, Seoul, Republic of Korea
                    </p>
                  </li>
                  <li>
                    <p class="tit">Give me a call</p>
                    <p class="body">T. +82 (0)10 3155 0419</p>
                  </li>
                  <li>
                    <p class="tit">Or, why don’t you email me?</p>
                    <p class="body">
                      <a href="mailto:away0419@naver.com">away0419@naver.com</a>
                    </p>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </transition>
      </article>
    </div>
  </div>
</template>

<script>
import SButton from "../components/Element/Button/index";

require("vue2-animate/dist/vue2-animate.min.css");
import { mapGetters } from "vuex";
import { VueTypedJs } from "vue-typed-js";
import Article from "../components/Article";
import CardList from "../components/Card/List";
import CardItem from "../components/Card/Item";
import CircleBackList from "../components/Circle/Item/back.vue";
import CircleFrontList from "../components/Circle/Item/front.vue";
import CircleEtcList from "../components/Circle/Item/etc.vue";
import ToggleMessage from "../components/ToggleMessage/List";
import { scrollTo } from "../utils/scroll-to";

export default {
  name: "index",
  components: {
    SButton,
    Article,
    CardList,
    CardItem,
    VueTypedJs,
    ToggleMessage,
    CircleBackList,
    CircleFrontList,
    CircleEtcList,
  },
  computed: {
    ...mapGetters(["main"]),
  },
  data() {
    return {
      circleValue: "",
      strings: ["Junior Back-End Engineer💻<br/>Skills : Java, Spring Boot"],
      intersectionOptions: {
        root: null,
        thresholds: [0, 1],
      }, // https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API
      article: {
        main: {
          name: "Main",
          visible: false,
          focus: false,
          label: "main",
        },
        introduction: {
          name: "Introduction",
          visible: false,
          focus: false,
          label: "introduction",
        },
        career: {
          name: "Career&Learning",
          visible: false,
          focus: false,
          label: "career",
        },
        skill: {
          name: "Skills",
          visible: false,
          focus: false,
          label: "skills",
        },
        portfolio: {
          name: "Portfolio",
          visible: false,
          focus: false,
          label: "portfolio",
        },
        faq: {
          name: "Faq",
          visible: false,
          focus: false,
          label: "faq",
        },
        contact: {
          name: "Contact",
          visible: false,
          focus: false,
          label: "contact",
        },
      },
    };
  },
  methods: {
    circleClick(e) {
      if (this.circleValue === e.target.value) {
        this.circleValue = "";
      }
    },
    mainWaypoint({ going }) {
      this.onWaypoint(going, "main");
    },
    introductionWaypoint({ going }) {
      this.onWaypoint(going, "introduction");
    },
    careerWaypoint({ going }) {
      this.onWaypoint(going, "career");
    },
    skillWaypoint({ going }) {
      this.onWaypoint(going, "skill");
    },
    portfolioWaypoint({ going }) {
      this.onWaypoint(going, "portfolio");
    },
    faqWaypoint({ going }) {
      this.onWaypoint(going, "faq");
    },
    contactWaypoint({ going }) {
      this.onWaypoint(going, "contact");
    },
    onWaypoint(going, type) {
      if (going === "in") {
        this.article[type].visible = true;
        this.article[type].focus = true;
      } else {
        this.article[type].focus = false;
      }
    },
    goArticle(article) {
      const positionTop =
        article === "Main"
          ? 0
          : this.$refs[article.label.toLowerCase()].getBoundingClientRect()
              .top +
            window.pageYOffset -
            80;
      scrollTo(positionTop, 300);
    },
  },
};
</script>

<style lang="scss">
@import "../assets/scss/color";
@import "../assets/scss/circle.scss";

@mixin list-bg {
  width: 26px;
  height: 26px;
  background-size: 16px 16px;
  background-position: center;
  background-repeat: no-repeat;
}
.a-resume:link,
.a-resume:visited {
  background-color: $basic-color5;
  color: $basic-color8;
  padding: 15px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

.a-resume:hover,
.a-resume:active {
  background-color: $basic-color4;
}

.main-page-wrap {
  width: 100%;
  padding-top: 110px;

  .main-side-right {
    position: fixed;
    right: 34px;
    z-index: 10;

    .article-list {
      width: 20px;
      position: relative;

      .article-item {
        width: 26px;
        height: 26px;
        position: relative;
        z-index: 2;
        margin-bottom: 12px;
        box-sizing: border-box;
        border: 2px solid $light-cloud-color;
        border-radius: 100%;
        -moz-border-radius: 100%;
        -webkit-border-radius: 100%;
        background-color: $white-color;
        cursor: pointer;

        &:hover,
        &.focus {
          border: none;
          background: $basic-color5;
          -webkit-box-shadow: inset -1px -2px 0 0 $basic-color4;
          -moz-box-shadow: inset -1px -2px 0 0 $basic-color4;
          box-shadow: inset -1px -2px 0 0 $basic-color4;
          position: relative;

          .cf {
            &.side-right-main {
              background-image: url(../assets/images/common/house.svg);
              @include list-bg;
            }
            &.side-right-introduction {
              background-image: url(../assets/images/common/introduction.svg);
              @include list-bg;
            }
            &.side-right-career {
              background-image: url(../assets/images/common/career.svg);
              @include list-bg;
            }
            &.side-right-skills {
              background-image: url(../assets/images/common/skill.svg);
              @include list-bg;
            }
            &.side-right-portfolio {
              background-image: url(../assets/images/common/portfolio.svg);
              @include list-bg;
            }
            &.side-right-faq {
              background-image: url(../assets/images/common/FAQ.svg);
              @include list-bg;
            }
            &.side-right-contact {
              background-image: url(../assets/images/common/contact.svg);
              @include list-bg;
            }
          }
        }

        &:before,
        &:after {
          position: absolute;
          opacity: 0;
          transition: 100ms;
        }

        &:before {
          content: "";
          top: 5px;
          right: 20px;
          border: solid 6px transparent;
          border-left-color: $basic-color7;
        }

        &:after {
          height: 20px;
          content: attr(aria-label);
          top: 2px;
          right: 30px;
          padding: 0 0.75rem;
          color: white;
          font-size: 13px;
          line-height: 20px;
          border-radius: 3px;
          background-color: $basic-color7;
        }

        &:hover {
          background: $basic-color4;
          -webkit-box-shadow: inset -1px -2px 0 0 $basic-color3;
          -moz-box-shadow: inset -1px -2px 0 0 $basic-color3;
          box-shadow: inset -1px -2px 0 0 $basic-color3;
          &:before,
          &:after {
            opacity: 1;
          }
        }
      }

      &:before {
        content: " ";
        z-index: 0;
        width: 2px;
        height: 100%;
        position: absolute;
        left: 50%;
        margin-left: -1px;
        background-color: $light-cloud-color;
      }
    }
  }

  .main-article {
    width: 100%;
    position: relative;
    padding-top: 100px;

    &.border-bottom {
      border-bottom: 1px solid #dddddd;
      padding-bottom: 70px;
    }

    &.main-contact {
      padding-bottom: 30px;

      .contact-body {
        display: flex;

        .contact-image {
          flex: 1;
          margin-right: 30px;
          background-image: url(../assets/images/main-contact-image.jpg);
          background-size: cover;
          background-repeat: no-repeat;
          background-position: center center;
          box-sizing: border-box;
        }

        .contact-introduction {
          flex: 1;
          color: $basic-color;
          line-height: 1.43;

          h5 {
            margin-bottom: 8px;
            font-size: 16px;
          }

          p {
            margin-bottom: 20px;
            font-size: 14px;
          }
        }

        .contact-info {
          flex: 1;

          ul {
            li {
              padding-bottom: 20px;

              .tit {
                padding-bottom: 8px;
                color: $gray-color;
              }

              .body {
                color: $basic-color;
              }
            }
          }
        }
      }
    }
  }

  h2.article-title {
    position: relative;
    padding-bottom: 30px;
    font-size: 28px;
    text-align: center;
    line-height: 28px;
    letter-spacing: -0.4px;

    .more {
      position: absolute;
      right: 0;
      font-size: 16px;
      font-weight: 400;
      line-height: 28px;

      img {
        width: 16px;
        height: 16px;
        display: inline-block;
        padding-left: 4px;
        line-height: 28px;
        vertical-align: middle;
      }

      &:before {
        content: "더보기";
      }
    }
  }

  p.main-sub-title {
    padding-bottom: 60px;
    color: $gray-color;
    font-size: 15px;
    text-align: center;
  }

  .main-greeting {
    padding-top: 0;
    padding-bottom: 3%;

    .typed-element {
      width: 100%;
      position: absolute;
      top: 0;
      font-weight: 100;
      font-family: "Russo", cursive;
      line-height: 1.43;
      word-break: break-all;
      transition: all 300ms;

      h1 {
        width: max-content;
        max-width: 100%;
        color: $basic-color8;
        font-size: 46px;

        &:hover {
          color: #df405a;
          filter: drop-shadow(10px 10px 0px rgba(0, 0, 0, 0.1));
          transition: all 300ms;
        }
      }

      &.not-show {
        opacity: 0;
        position: relative;
        padding-bottom: 5%;
      }
    }

    .main-image {
      width: 100%;
      position: relative;
      overflow: hidden;
      display: flex;

      .image {
        width: 28%;
        margin-right: 2%;
        border-radius: 25%;
        border: 5px $basic-color2 solid;
      }
    }
  }

  .main-portfolio {
    margin-top: 100px;
    padding-top: 70px;
    padding-bottom: 70px;
    background-color: $white-background-color;
  }
}

.about-div {
  font-family: "Nanum Pen Script", cursive;
  font-size: 40px;
  font-weight: bold;
  height: 10%;
  width: 65%;
}

.about-content {
  padding-top: 7%;

  p {
    padding-top: 4%;
    font-size: 20px;
  }
}

.fade-in-span {
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 1s;
  animation-direction: reverse;
  animation-timing-function: linear;
  animation-fill-mode: none;
  animation-delay: 3s;
  animation-fill-mode: forwards;
  color: $basic-color1;
}

.fade-out-span {
  animation-name: fadeOut;
  animation-duration: 1s;
  animation-direction: reverse;
  animation-timing-function: linear;
  animation-fill-mode: none;
  animation-delay: 3s;
  animation-fill-mode: forwards;
  position: absolute;
  margin-left: 7px;
}

// .none-span{
//   animation-name: noneDisplay;
//   animation-duration: 1s;
//   animation-direction: reverse;
//   animation-timing-function: linear;
//   animation-fill-mode: none;
//   animation-delay: 7s;
//   animation-fill-mode: forwards;
// }

.fade-in-span-me {
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 1s;
  animation-direction: reverse;
  animation-timing-function: linear;
  animation-fill-mode: none;
  animation-delay: 2.5s;
  animation-fill-mode: forwards;
  color: $basic-color1;
  position: absolute;
  margin-left: 7px;
}

.fade-in-p {
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 1s;
  animation-direction: reverse;
  animation-timing-function: linear;
  animation-fill-mode: none;
  animation-delay: 5s;
  animation-fill-mode: forwards;
}

@for $i from 1 through (3) {
  #circle-checkbox#{$i} {
    display: none;
  }
}

@keyframes noneDisplay {
  from {
    opacity: 0;
    display: none;
  }
}

@keyframes fadeOut {
  from {
    opacity: 0;
  }
}

@keyframes fadeIn {
  from {
    opacity: 1;
  }
}

@media (max-width: 1680px) {
  .main-page-wrap {
    .main-greeting .typed-element h1 {
      font-size: 42px;
    }
  }
  .about-div {
    font-size: 36px;
  }
}

@media (max-width: 1440px) {
  .main-page-wrap {
    .main-greeting .typed-element h1 {
      font-size: 40px;
    }
  }
  .about-div {
    font-size: 34px;
  }
}

@media (max-width: 1366px) {
  .main-page-wrap {
    padding-top: 100px;

    .main-greeting .typed-element h1 {
      font-size: 38px;
    }
  }

  .about-div {
    font-size: 32px;
  }
}

@media (max-width: 1280px) {
  .main-page-wrap {
    padding-top: 90px;

    .main-greeting .typed-element h1 {
      font-size: 35px;
    }

    .main-article {
      &.main-contact {
        .contact-body {
          .contact-image {
            display: none;
          }
        }
      }
    }
  }
  .about-div {
    font-size: 29px;
  }
}

@media (max-width: 1024px) {
  .main-page-wrap {
    padding-top: 80px;

    .main-greeting .typed-element h1 {
      font-size: 28px;
    }
  }
  .about-div {
    font-size: 25px;
  }
  .about-content {
    display: none;
  }
}

@media (max-width: 890px) {
  .main-page-wrap {
    .main-side-right {
      display: none;
    }

    h2.article-title {
      .more {
        right: auto;
        margin-top: -2px;

        &:before {
          content: "";
        }
      }
    }

    .main-article {
      &.main-contact {
        padding-bottom: 30px;

        .contact-body {
          padding-top: 30px;
          display: block;

          .contact-image {
            display: none;
          }

          .contact-introduction {
            flex: none;
            padding-bottom: 50px;

            h5 {
              margin-bottom: 8px;
              font-size: 24px;
            }

            p {
              margin-bottom: 20px;
              font-size: 16px;
            }
          }

          .contact-info {
            flex: none;
          }
        }
      }
    }
  }

  .about-div {
    font-size: 24px;
  }
}

@media (max-width: 550px) {
  .main-page-wrap {
    padding-top: 60px;

    .main-greeting .typed-element h1 {
      font-size: 24px;
    }

    .main-article {
      &.main-contact {
        .contact-body {
          padding-top: 20px;

          .contact-introduction {
            letter-spacing: -0.5px;

            h5 {
              font-size: 18px;
            }

            p {
              font-size: 14px;
            }
          }

          .contact-info {
          }
        }
      }
    }
  }

  @media (max-width: 375px) {
    .main-page-wrap {
      .main-greeting .typed-element h1 {
        font-size: 20px;
      }

      .main-article {
        &.main-contact {
          .contact-body {
            padding-top: 20px;

            .contact-introduction {
              letter-spacing: -0.5px;

              h5 {
                font-size: 18px;
              }

              p {
                font-size: 14px;
              }
            }

          }
        }
      }
    }
  }

  .about-div {
    font-size: 24px;
  }
}
</style>
