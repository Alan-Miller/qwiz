<template>
  <div class="QuizBank">
    <h2>QuizBank view</h2>
    <div class='titles' v-for='(title, i) in titles' v-bind:key='i'>
      <p>Titles</p>
      <p v-on:click='getQuiz(title.id)'>{{title.title}}</p>
    </div>
  </div>
</template>

<script>
import Quiz from '@/components/Quiz'
import axios from 'axios'
export default {
  name: 'QuizBank',
  props: ['getQuiz'],
  data() {
    return {
      titles: []
    }
  },
  created() {
    axios.get(`/api/title`).then(titles => {
      // console.log('titles', titles.data)
      this.titles = titles.data
    })
  }
}
</script>

<style scoped>
.QuizBank {
  /* background-color: rgba(30, 30, 30, 1); */
  padding: 17px;
}
.titles {
  cursor: pointer;
}
</style>