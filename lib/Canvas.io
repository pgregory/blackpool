Message isSingular := method(self next == nil)

Canvas := Object clone do(
  init := method(
    result ::= Sequence clone
    callbacks ::= nil
  )

  "h1 p div tr td table form label select option" split foreach(tag,
    setSlot(tag, 
      method(
        Tag clone setTag(call message name)
      )
    )
  )

  text := method(str,
    result appendSeq(str)
    self
  )

  space := method(str,
    result appendSeq("&nbsp;")
    self
  )

  link := method(name, code,
    id := callbacks register(list(call sender, code))
    result appendSeq("<a href='?_k=",id,"'>",name,"</a>")
    self
  )

  button := method(name, code,
    id := callbacks register(list(call sender, code))
    result appendSeq("<button type='submit' name='_k' value='",id,"'>",name,"</button>")
    self
  )

  inputText := method(
    InputTextTag clone
  )

  inputDate := method(
    InputDateTag clone
  )

  render := method(component,
    component renderOn(self)
  )
)

