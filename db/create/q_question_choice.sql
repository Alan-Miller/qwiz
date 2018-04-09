CREATE TABLE q_question_choice (
  id serial PRIMARY KEY,
  question_id int REFERENCES q_question (id),
  choice_id int REFERENCES q_choice (id)
)
