<template>
  <div class='Home'>

    <h2>Home view</h2>

    <div class='quiz' v-if='quiz.quiz_id'>
      <h3>{{quiz.title}}</h3>
      <Question 
        v-for='(question, i) in quiz.questions' 
        :key='i' 
        :question='question' 
        :num='++i'
      />
    </div>

    <router-view @getQuiz='getQuiz'/>
  </div>
</template>

<script>
import QuizBank from '@/components/QuizBank'
import Question from '@/components/Question'
import axios from 'axios'
export default {
  name: 'Home',
  components: {
    QuizBank,
    Question
  },
  data() {
    return {
      // titles: [],
      quiz: {}
    }
  },

  methods: {
    getQuiz(id) {
      axios.get(`/api/quiz/${id}`).then(quiz => {
        // console.log('quiz', quiz.data)
        this.quiz = quiz.data
      })
    }
  }
}
</script>

<style>
</style>