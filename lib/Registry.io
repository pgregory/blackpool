Registry := Object clone do(
  init := method(
    items ::= List clone
  )

  register := method(item,
    items append(item)
    (items size - 1) asString
  )

  find := method(key,
    items at(key asNumber)
  )
)


