Task := Object clone do(
  init := method(
    id ::= nil
    completed ::= false
    deadline ::= Date copy(Date today)
    taskDescription ::= Sequence clone
    taskName ::= Sequence clone
  )

  isPending := method(
    completed not and deadline isPast not
  )

  isMissed := method(
    completed not and deadline isPast
  )

  isValid := method(
    deadline isNil not and
    taskDescription isEmpty not and
    taskName isEmpty not
  )
)



