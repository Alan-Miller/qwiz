<template>
  <div class='Question'>
    <h4>
      {{`${num}: ${question.prompt}`}}
    </h4>
    <p v-for='(choice, i) in question.choices' :key='i'>
      {{letters[i] + ' ' + choice.content}}
    </p>
  </div>
</template>

<script>
export default {
  name: 'Question',
  props: ['num', 'question'],
  data() {
    return {
      letters: ['(A)', '(B)', '(C)', '(D)']
    }
  }
}
</script>

<style scoped>
.Question {
  /* background-color: rgba(30, 30, 30, 1); */
  padding: 17px;
}
</style>