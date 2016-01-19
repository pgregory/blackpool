Counter := Object clone do(
  init := method(
    count ::= 0
  )

  renderOn := method(html,
    html h3 with( html text("Counter: " .. count))
    html link("--", block(count = count - 1))
    html space
    html space
    html link("=", block(count = 0))
    html space
    html space
    html link("++", block(count = count + 1))
  )
)
