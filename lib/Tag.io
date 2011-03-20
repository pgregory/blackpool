Tag := Object clone do(
  init := method(
    tag ::= Sequence clone
    attributes ::= List clone
    canvas ::= call sender
  )

  addAttribute := method(name, value,
    attributes append(list(name, value))
    self
  )

  with := method(
    canvas result appendSeq("<", tag)
    attributes foreach(attr,
      canvas result appendSeq(" ", attr at(0), "='", attr at(1), "'")
    )
    canvas result appendSeq(">")
    call message arguments foreach(arg,
      arg doInContext(call sender) 
    )
    canvas result appendSeq("</", tag, ">")
    // Return nil, so that it's not possible to chain after the 'with' call
    // as with is the completion of the tag.
    nil
  )
)

InputTag := Tag clone do(
  callback := method(code,
    id := canvas callbacks register(list(call sender, code))
    addAttribute("name", id)
  )
)

InputTextTag := InputTag clone do(
  init := method(
    super(init)
    canvas = call sender
    attributes append(list("type", "text"))
    tag = "input"
  )
) 

InputDateTag := InputTag clone do(
  init := method(
    super(init)
    canvas = call sender
    attributes append(list("type", "date"))
    tag = "input"
  )
) 
