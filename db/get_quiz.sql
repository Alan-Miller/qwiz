SELECT
  question.quiz_id AS quiz_id, -- top-level quiz_id property
  question.title AS title, -- top-level title property
  json_agg -- top-level questions array
  (
    JSON_BUILD_OBJECT -- specifies how each question object should be built
    (
      'question_id', question.q_id, 
      'prompt', question.prompt, 
      'choices', choices -- this is the choices array below
    )
  ) AS questions -- without this, the array property would be called "json_agg"
FROM 
(
  SELECT -- select data needed for quiz_id, title, and questions array above  
    z.id AS quiz_id, 
    title,
    q.id AS q_id,
    prompt,
    json_agg -- nested choices array
    (
      JSON_BUILD_OBJECT -- specifies how each choice object should be built
      (
        'choice_id', choice.c_id, 
        'content', choice.content, 
        'is_correct', choice.is_correct
      )
    ) AS choices -- without this, the array property would be called "json_agg"
  FROM
    q_quiz AS z
    JOIN q_quiz_question AS qq ON qq.quiz_id = z.id
    JOIN q_question AS q ON q.id = qq.question_id
    JOIN  -- select each choice and join
    (
      SELECT
        qc.id AS qc_id,
        qc.question_id AS q_id,
        qc.choice_id,
        c.id AS c_id,
        content,
        is_correct
      FROM
        q_question_choice AS qc
        JOIN q_choice AS c ON c.id = qc.choice_id
        ORDER BY c_id
    ) AS choice ON choice.q_id = q.id
    GROUP BY z.id, q.id
    ORDER BY q.id
) AS question
WHERE quiz_id = $1
GROUP BY question.quiz_id, question.title
