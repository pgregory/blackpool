MenuComponent := Object clone do(
  init := method(
    entries ::= List clone
  )

  renderOn := method(html,
    entries foreach(v,
      html link(v at(0), v at(1))
      html space
    )
  )

  addEntry := method(name, callback, 
    entries append(list(name, callback))
  )
)


