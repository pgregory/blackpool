Counter := Object clone do(
  init := method(
    count ::= 0
  )

  renderOn := method(html,
    html h1 with( html text("Counter: " .. count))
    html link("--", block(count = count - 1))
    html link("++", block(count = count + 1))
  )
)
