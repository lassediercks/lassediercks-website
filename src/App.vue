<template>
  <div id="app">
    <header>
      <img src="/lasse.jpg" class="profile-image" alt="" />
      <div class="header-content">
        <h1>{{ Metainfo.title }}</h1>
        <div class="social">
          <a v-for="link in socialLinks" :href="link.href" :key="link.label">{{
            link.label
          }}</a>
        </div>
      </div>
    </header>
    <main>
      <h2 id="cv">About</h2>
      <p class="about-text">
        I'm a 1989 born generalist that makes a living by being a freelance
        UI-Engineer. While I do enjoy being a technical expert I'm trying to
        shift my journey towards a more complexity informed way of working. One
        outcome of this is
        <a href="https://schubrake.de"> the company Schubrakede</a> I founded
        with my <a href="https://xiphe.net">beloved brother Hannes.</a>
        <br /><br />
        When not working or learning I'm most likely building Duplo Towers with
        my son and wife, playing the guitar or
        <a href="https://photography.lassediercks.de">
          doing photography.
        </a>
      </p>
      <h2 id="cv">Curriculum Vitae</h2>
      <div v-for="entry in Cv" :key="entry.when" class="entry">
        <div class="became-freelancer" v-if="entry.company === 'Jimdo'">
          I Became a Freelancer
        </div>
        <div class="time">{{ entry.when }}</div>
        <div class="company-details">
          <h3 class="company-name">
            <a :href="entry.website">
              {{ entry.company }}
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
    </main>
    <footer>
      2020 Lasse Diercks - moin@lassediercks.de
    </footer>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import Tags from './components/tags.vue';
import Cv from './cv.json';
import Metainfo from './metainfo.json';

@Component({
  components: { Tags },
  data() {
    return {
      Cv,
      Metainfo,
      socialLinks: [
        { href: 'https://twitter.com/lassediercks', label: 'Twitter' },
        { href: 'https://instagram.com/lassediercks', label: 'Instagram' },
        { href: 'http://github.com/lassediercks', label: 'Github' },
        { href: 'http://codepen.io/lassediercks', label: 'Codepen' },
        { href: 'https://medium.com/@lassediercks', label: 'Medium' },
        { href: 'https://open.spotify.com/user/lassediercks', label: 'Spotify' }
      ]
    };
  },
  metaInfo: {
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { property: 'og:site_name', content: Metainfo.title },
      { property: 'og:title', content: Metainfo.title },
      { name: 'description', content: Metainfo.description },
      { property: 'og:description', content: Metainfo.description }
    ],
    title: Metainfo.title
  }
})
export default class App extends Vue {}
</script>

<style lang="scss">
$blue: #256cff;
@import url('https://fonts.googleapis.com/css2?family=Asap:wght@400;600&display=swap');

@mixin smallscreen {
  @media (max-width: 775px) {
    @content;
  }
}
html {
  font-size: 20px;
  @include smallscreen {
    font-size: 16px;
  }
  ::selection {
    color: white;
    background: $blue;
  }
  ::-moz-selection {
    /* Code for Firefox */
    color: white;
    background: $blue;
  }
}
#app {
  font-family: 'Asap', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  max-width: 50em;
  margin: 0 auto;
  padding: 0 1em;
  margin-top: 4em;
  @include smallscreen {
    margin-top: 2em;
  }
}
header {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 6em;
  @include smallscreen {
    align-items: flex-start;
    flex-direction: column;
  }
}
h1 {
  margin: 0;
}
.social {
  display: flex;
  flex-flow: row wrap;
  margin: 0 -0.5em;
  a {
    display: inline-block;
    padding: 0.5em;
  }
}
h1 {
  font-size: 4em;
}
h2 {
  font-size: 2.4rem;
}
.about-text {
  margin-top: 0;
  margin-bottom: 6em;
  font-size: 1.6rem;
  line-height: 1.5;
}
.profile-image {
  pointer-events: none;
  width: 17em;
  border-radius: 17em;
  height: 17em;
  object-fit: cover;
  margin-right: 2em;
  @include smallscreen {
    margin-bottom: 1em;
  }
}
a {
  color: inherit;
  &:focus {
    outline: none;
    color: $blue;
    font-weight: bold;
  }
}

.entry {
  text-align: left;

  display: grid;
  grid-gap: 1em;
  grid-template-columns: 1fr 1fr;
  margin-bottom: 5em;
  @media (max-width: 775px) {
    grid-template-columns: 1fr;
  }
}
.time {
  grid-column: span 2;
  text-align: left;
  font-size: 1.6em;

  letter-spacing: -1px;
  opacity: 0.4;
  @include smallscreen {
    grid-column: 1;
  }
}
.company-details {
}
.company-name {
  display: inline-block;
  font-size: 3.2em;
  line-height: 1;
  margin-top: 0em;
  margin-bottom: 0.2em;
  font-weight: bold;
}
.company-description {
  color: #76828c;
  margin: 0;
  font-size: 1.2em;
  line-height: 1.4;
  max-width: 40ex;
}
.project {
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
  margin: 2em 0;
  border-top: 3px solid whitesmoke;
  border-bottom: 3px solid whitesmoke;
  @include smallscreen {
    grid-column: 1;
    font-size: 2em;
  }
}

footer {
  border-top: 3px solid whitesmoke;
  padding: 2em 1em;
}
</style>
