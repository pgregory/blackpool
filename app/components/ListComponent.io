ListComponent := Object clone do(
  init := method(
    items ::= List clone
    filterBlock ::= block(items, items)
  )

  renderOn := method(html,
    html table with( 
      filterBlock call(items) foreach(i, 
        renderItem(i, html)
      )
    )
  )
)


