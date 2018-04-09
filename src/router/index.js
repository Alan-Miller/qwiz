import Vue from 'vue'
import Router from 'vue-router'
// import HelloWorld from '@/components/HelloWorld'
import Home from'@/components/Home'
import Quiz from '@/components/Quiz'
import QuizBank from '@/components/QuizBank'

Vue.use(Router)

export default new Router({
  routes: [
    // {
    //   path: '/',
    //   name: 'HelloWorld',
    //   component: HelloWorld
    // }
    // {
    //   path: '/',
    //   name: 'Home',
    //   component: Home
    // },
    {
      path: '/quiz',
      name: 'Quiz',
      component: Quiz
    },
    {
      path: '/quizbank',
      name: 'QuizBank',
      component: QuizBank,
      props: true
    }
  ]
})
