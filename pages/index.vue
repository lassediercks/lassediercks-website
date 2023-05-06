<template>
  <div
    id="app"
    :style="`--time-color: ${timeColor}; --hue-amount: ${hueAmount}`"
  >
    <header>
      <div class="header-content">
        <h1>{{ Metainfo.title }}</h1>
        <a href="mailto:hello@lassediercks.de" class="header-link">
          Write me an E-Mail
        </a>
      </div>
      <div
        :style="{ backgroundImage: `url(${profileImage})` }"
        class="profile-image"
        alt=""
      />
    </header>

    <main>
      <!-- <div class="waters">
        <compass class="compass"></compass>
        <h3>New waters ahead!</h3>
        <p>
          I'm currently open for new projects starting in 2021. If you're a
          company and think I could be a decent addition to your team, let's
          have a chat about that!
        </p>
      </div> -->

      <div class="about">
        <h2 id="about">About</h2>
        <div>
          <p class="about-text">
            1989 born into a creative family. I got comfortable in web
            development and turned that into being a freelance UI-Engineer. When
            not working or learning I'm most likely building Duplo Towers with
            my son and wife, playing the guitar or
            <a href="https://photography.lassediercks.de">
              doing photography.
            </a>
          </p>
        </div>
      </div>
      <div class="cv-wrap">
        <h2 id="cv">Experience</h2>
        <div v-for="entry in Cv" :key="entry.when" class="entry">
          <div class="became-freelancer" v-if="entry.company === 'Jimdo'">
            I Became a Freelancer
          </div>
          <div class="time">{{ entry.when }}</div>
          <div class="company-details">
            <h3 class="company-name">
              <a :href="entry.website">
                <span>
                  {{ entry.company }}
                </span>
              </a>
            </h3>
            <p class="company-description">{{ entry.companyDescription }}</p>
          </div>
          <div class="projects">
            <div
              class="project"
              v-for="(project, index) in entry.projects"
              :key="index"
            >
              <h4 v-if="project.title" class="project-title">
                <a v-if="project.link" :href="project.link">{{
                  project.title
                }}</a>
                <template v-if="!project.link">
                  {{ project.title }}
                </template>
              </h4>
              <p class="project-description">{{ project.description }}</p>
              <Tags :tags="project.tags"></Tags>
            </div>
          </div>
        </div>
      </div>
      <div class="waters">
        <p>
          I can add value to: <br />
          Strategy, Product Management, Product Discovery, Crisis Management or
          Complexity based Customer Research
        </p>
        <br />
        <p>Do you want to have a chat?</p>
        <a href="mailto:hello@lassediercks.de" class="header-link">
          Write me an E-Mail
        </a>
      </div>
    </main>
    <footer>
      Lasse Diercks - moin@lassediercks.de
    </footer>
  </div>
</template>

<script>
import Tags from '~/components/tags.vue';
import profileImage from '~/assets/lasse.png';
import Cv from '~/cv.json';
import Metainfo from '~/metainfo.json';
import compass from '~/components/compass';

export default {
  components: { Tags, compass },
  setup() {
    useHead({
      title: Metainfo.title,
      link: [
        {
          rel: 'stylesheet',
          href:
            'https://fonts.googleapis.com/css2?family=Asap:wght@400;500;600&display=swap'
        }
      ],
      meta: [
        { name: 'theme-color', content: '#2c3e50' },
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { property: 'og:site_name', content: Metainfo.title },
        { property: 'og:title', content: Metainfo.title },
        { property: 'og:url', content: Metainfo.url },
        { property: 'og:image', content: `${Metainfo.url}/open-graph.png` },
        { property: 'og:image:width', content: '1200' },
        { property: 'og:image:height', content: '630' },

        { name: 'description', content: Metainfo.description },
        { property: 'og:description', content: Metainfo.description },
        { property: 'twitter:description', content: Metainfo.description },
        { property: 'twitter:site', content: '@lassediercks' },
        { property: 'twitter:creator', content: '@lassediercks' },
        { property: 'twitter:image', content: `${Metainfo.url}/twitter.png` },
        { property: 'twitter:image:width', content: '750' },
        { name: 'twitter:card', content: 'photo' },
        { property: 'twitter:image:height', content: '560' }
      ]
    });
  },
  data() {
    return {
      Cv,
      profileImage,
      Metainfo,
      hueAmount: 0,
      socialLinks: [
        { href: 'https://twitter.com/lassediercks', label: 'Twitter' },
        { href: 'https://instagram.com/lassediercks', label: 'Instagram' },
        { href: 'http://github.com/lassediercks', label: 'Github' },
        { href: 'http://codepen.io/lassediercks', label: 'Codepen' },
        { href: 'https://open.spotify.com/user/lassediercks', label: 'Spotify' }
      ]
    };
  },

  computed: {
    timeColor() {
      const today = new Date();
      const minutes = today.getHours() * 60 + today.getMinutes();
      this.hueAmount = (minutes / 1440) * 360;
      return `hsl(${this.hueAmount}, 100%,96%)`;
    }
  }
};
</script>

<style lang="scss">
@import './components/variables';

html {
  font-size: 20px;
  @include smallscreen {
    font-size: 16px;
  }
  ::selection {
    background: hsl(calc(var(--hue-amount) - 180), 90%, 94%);
  }
  ::-moz-selection {
    /* Code for Firefox */
    background: hsl(calc(var(--hue-amount) - 180), 90%, 94%);
  }
}
body {
  margin: 0;
  padding: 0;
}
#app {
  font-family: 'Asap', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: $onyx;
  max-width: 120em;
  margin: 0 auto;
}
header {
  height: 65vh;
  display: grid;
  place-items: center;
  grid-template-columns: 1fr 1fr;
  justify-content: center;
  margin-bottom: 6em;
  @include smallscreen {
    align-items: flex-start;
    flex-direction: column;
  }
  @include mediumscreen {
    grid-template-columns: 1.5fr 1fr;
  }
  @include tablet {
    min-height: 80vh;
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: 1fr auto;
  }
}
.profile-image {
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center center;
  pointer-events: none;
  object-fit: cover;
  box-shadow: -1.5em 1.5em 0 0 var(--time-color);
  @include tablet {
  }
}
.header-content {
  text-align: right;
  @include tablet {
    display: flex;
    text-align: left;
    box-sizing: border-box;
    padding: 3em 2em;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    order: 2;
  }
  @include smallscreen {
    width: 100%;
  }
}
.header-link {
  display: inline-block;
  background: white;
  border: 2px solid $onyx;
  margin-top: 1em;
  box-shadow: -0.5em 0.5em 0 0 var(--time-color);
  transition: box-shadow 120ms ease-in-out;
  &:hover {
    box-shadow: 0 0 0 0.5em hsl(calc(var(--hue-amount) - 180), 90%, 94%);
  }
  &:focus {
    background: $onyx;
    color: white;
  }
  text-decoration: none;
  padding: 0.6em 0.6em;
  @include tablet {
    box-shadow: 0.5em 0.5em 0 0 var(--time-color);
  }
}
.description {
  display: block;
  font-weight: 500;
  font-size: 1.625em;
}
.social {
  display: flex;
  justify-content: center;
  flex-flow: row wrap;
  margin: 6em 0;
  a {
    display: inline-block;
    padding: 0.5em;
    margin: 0.5em;
    font-weight: bold;
    text-decoration: none;
    border-bottom: 5px solid var(--time-color);
  }
  @include smallscreen {
    text-align: left;
    margin-left: -1em;
    justify-content: flex-start;
  }
}
h1 {
  margin: 0;

  font-size: 4em;
}
h2 {
  font-size: 2.4rem;
}
main {
  margin: 0 auto;
  max-width: 50em;
  padding: 0 2em;
}
.about {
  display: grid;
  grid-gap: 2em;
  grid-template-columns: auto auto;
  @include smallscreen {
    grid-template-columns: auto;
  }
}
#about {
  margin-top: 0;
  margin-bottom: 0;
}
.about-text {
  display: inline;
  font-size: 1.6rem;
  line-height: 1.5;
}

a {
  color: inherit;
  &:focus {
    outline: none;
    background: hsl(calc(var(--hue-amount) - 180), 90%, 94%);
    font-weight: bold;
  }
}
.cv-wrap {
  padding-top: 8em;
}
#cv {
  margin-bottom: 2em;
}
.entry {
  text-align: left;

  display: grid;
  grid-column-gap: 1em;
  grid-row-gap: 0.5em;
  grid-template-columns: 1fr 1fr;
  margin-bottom: 5em;
  @media (max-width: 775px) {
    grid-template-columns: 1fr;
  }
}
.time {
  grid-column: span 2;
  text-align: left;
  font-size: 1.4em;
  font-weight: 600;
  color: $grey;
  @include smallscreen {
    grid-column: 1;
  }
}
.company-details {
}
.company-name {
  display: inline-block;
  font-size: 3em;
  line-height: 1;
  margin-top: 0em;
  margin-bottom: 0.2em;
  font-weight: bold;
  span {
    position: relative;
    z-index: 5;
  }
  a {
    position: relative;
    &:focus {
      text-decoration: none;
    }
    &:focus:after,
    &:hover:after {
      bottom: 0;
      height: 100%;
      right: 0;
      background: hsl(calc(var(--hue-amount) - 180), 90%, 94%);
    }
    text-decoration: none;
    &:after {
      position: absolute;
      content: ' ';
      height: 0.3em;
      width: 110%;
      left: -5%;
      bottom: 3%;
      background: var(--time-color);
      transition: bottom 170ms ease-in-out, top 170ms ease-in-out,
        height 170ms ease-in-out, background-color 170ms ease-in-out;
    }
  }
}
.company-description {
  color: $onyx;
  margin: 0;
  font-size: 1.2em;
  line-height: 1.4;
  max-width: 35ex;
  padding-left: 0.2ex;
}
.project {
  margin-top: 1ex;
  margin-bottom: 2em;
  &:last-child {
    margin-bottom: 0;
  }
}
.project-title {
  margin-top: 0;
  font-size: 1.6em;
  margin-bottom: 0.5em;
}

.project-description {
  font-size: 1.2em;
  line-height: 1.4;
}
.became-freelancer {
  text-transform: uppercase;
  font-size: 4em;
  grid-column: span 2;
  text-align: center;
  padding: 1em 0;
  margin-bottom: 2em;
  border-top: 0.12em solid hsl(calc(var(--hue-amount) - 270), 90%, 94%);
  border-bottom: 0.12em solid hsl(calc(var(--hue-amount) - 270), 90%, 94%);
  @include smallscreen {
    grid-column: 1;
    font-size: 2em;
  }
}
.waters {
  position: relative;

  padding: 3em 0;

  h3 {
    margin-top: 0;
    margin-bottom: 0.4em;
    font-size: 3em;
  }
  p {
    font-size: 1.8em;
    line-height: 1.4;
    margin: 0;
  }
  margin-bottom: 0em;
}
.compass {
  position: absolute;
  color: hsl(calc(var(--hue-amount) + 90), 90%, 94%);

  width: auto;
  left: -7em;
  top: -7em;
  height: 20em;
  z-index: -1;
}
footer {
  text-align: center;
  border-top: 3px solid whitesmoke;
  padding: 2em 1em;
}
</style>
