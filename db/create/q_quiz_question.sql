CREATE TABLE q_quiz_question (
  id serial PRIMARY KEY,
  quiz_id int REFERENCES q_quiz (id),
  question_id int REFERENCES q_question (id)
)
