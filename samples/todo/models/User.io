User := Object clone do(
  init := method(
    id ::= nil
    userName ::= Sequence clone
    email ::= Sequence clone
    tasks ::= List clone
    password ::= Sequence clone
  )

  addTask := method(aTask,
    tasks append(aTask)
  )
)


